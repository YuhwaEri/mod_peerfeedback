<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Prints a particular instance of peerfeedback
 *
 * You can have a rather longer description of the file as well,
 * if you like, and it can span multiple lines.
 *
 * @package    mod_peerfeedback
 * @copyright  2016 Your Name <your@email.address>
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */
// Replace peerfeedback with the name of your module and remove this line.

require_once(dirname(dirname(dirname(__FILE__))) . '/config.php');
require_once(dirname(__FILE__) . '/lib.php');

$id = optional_param('id', 0, PARAM_INT); // Course_module ID, or
$n = optional_param('n', 0, PARAM_INT);  // ... peerfeedback instance ID - it should be named as the first character of the module.
$returnto = optional_param('returnto', null, PARAM_ALPHA);

if ($id) {
    $cm = get_coursemodule_from_id('peerfeedback', $id, 0, false, MUST_EXIST);
    $course = $DB->get_record('course', array('id' => $cm->course), '*', MUST_EXIST);
    $peerfeedback = $DB->get_record('peerfeedback', array('id' => $cm->instance), '*', MUST_EXIST);
} else if ($n) {
    $peerfeedback = $DB->get_record('peerfeedback', array('id' => $n), '*', MUST_EXIST);
    $course = $DB->get_record('course', array('id' => $peerfeedback->course), '*', MUST_EXIST);
    $cm = get_coursemodule_from_instance('peerfeedback', $peerfeedback->id, $course->id, false, MUST_EXIST);
} else {
    error('You must specify a course_module ID or an instance ID');
}

require_login($course, true, $cm);

$event = \mod_peerfeedback\event\course_module_viewed::create(array(
    'objectid' => $PAGE->cm->instance,
    'context' => $PAGE->context,
));
$event->add_record_snapshot('course', $PAGE->course);
$event->add_record_snapshot($PAGE->cm->modname, $peerfeedback);
$event->trigger();

// Print the page header.
$PAGE->set_url('/mod/peerfeedback/view.php', array('id' => $cm->id));
$PAGE->set_title(format_string($peerfeedback->name));
$PAGE->set_heading(format_string($course->fullname));

// Output starts here.
echo $OUTPUT->header();

$PAGE->set_url('/user/editadvanced.php', array('course' => 1, 'id' => 2));

//heading
echo $OUTPUT->heading('Strength and Development areas for Peer Feedback');

//User strength areas
//start
echo html_writer::start_tag('h6');
echo "My Strength areas";
echo html_writer::end_tag('h6');
echo html_writer::start_tag('div', ["class" => "border-box"]);
echo html_writer::start_tag('ol');
echo html_writer::start_tag('li');
echo "<span>".$USER->first_behavioral."</span><span style='color:#000; float:right;'>Word count: " . str_word_count($USER->first_behavioral) . "</span>";
echo html_writer::end_tag('li');
echo html_writer::start_tag('hr', ["style" => "margin: 6px"]);
echo html_writer::start_tag('li');
echo "<span>".$USER->second_behavioral."</span><span style='color:#000; float:right;'>Word count: " . str_word_count($USER->second_behavioral) . "</span>";
echo html_writer::end_tag('li');
echo html_writer::end_tag('ol');
echo html_writer::end_tag('div');
//end
//User development areas
//start
echo html_writer::start_tag('h6');
echo "My Development areas";
echo html_writer::end_tag('h6');
echo html_writer::start_tag('div', ["class" => "border-box"]);
echo html_writer::start_tag('ol');
echo html_writer::start_tag('li');
echo "<span>".$USER->first_development."</span><span style='color:#000; float:right;'>Word count: " . str_word_count($USER->first_development) . "</span>";
echo html_writer::end_tag('li');
echo html_writer::start_tag('hr', ["style" => "margin: 6px"]);
echo html_writer::start_tag('li');
echo "<span>".$USER->second_development."</span><span style='color:#000; float:right;'>Word count: " . str_word_count($USER->second_development) . "</span>";
echo html_writer::end_tag('li');
echo html_writer::end_tag('ol');
echo html_writer::end_tag('div');
//end

//Strength and Development areas
//start
echo "<div style='float:right; width:100%; text-align:right'><a href='#' onclick='fn_edit()' class='btn btn-succcess' style='text-align: right; margin-top: 40px;'>Edit</a></div>";
//end

//feedback list to given by user team 
//start
echo html_writer::start_tag('h6');
echo "Feedback from my team:";
echo html_writer::end_tag('h6');
echo html_writer::start_tag('div', ["class" => "feedback_history history_scroll"]);

$feedbacks = $DB->get_records_sql("Select * From {userfeedback} WHERE soi_id = ? AND receiver_id = ? Order by id DESC", [$id, $USER->id]);
if ($feedbacks) {
    echo html_writer::start_tag('ul');
    foreach ($feedbacks as $feedback) {
        echo html_writer::start_tag('li');
        echo $feedback->comment;
        echo html_writer::start_tag('span', ["class" => "history_time"]);
        echo date("d-M-Y h:i a", strtotime($feedback->created_at));
        echo html_writer::end_tag('span');
        echo html_writer::end_tag('li');
        echo html_writer::start_tag('hr', ["style" => "margin: 6px"]);
    }
    echo html_writer::end_tag('ul');
} else {
    echo "No Feedback";
}
echo html_writer::end_tag('div');
//end

//get all groups by course
// echo "<pre>";
// print_r(groups_get_user_groups($course->id,$USER->id));

$groups = groups_get_all_groups($course->id);
$groups = groups_get_user_groups($course->id, $USER->id);
$memberArray = [];
if ($groups) {
    $group = $groups[0];
    for ($i = 0; $i < count($groups[0]); $i++) {
        //get all members for a particular group
        $members = groups_get_members($group[$i]);
        if ($members) {
            foreach ($members as $member) {
                if ($member->id != $USER->id) {
                    array_push($memberArray, $member);
                }
            }
        }
    }
    //unique filter
    $memberArray = array_unique($memberArray, SORT_REGULAR);
}
$slectArray[0] = "--select member--";
foreach ($memberArray as $memb) {
    $slectArray[$memb->id] = ucfirst($memb->username);
}

//group member dropdownlist
//start
echo html_writer::start_tag('h6');
echo "Select the Group Member to write feedback:";
echo html_writer::end_tag('h6');
echo html_writer::select($slectArray, 'receiver_id', '', [], ["style" => "min-width: 180px;", "class" => "member", "id" => "receiver_id"]);
//end
//selecte member strength area
//start
echo html_writer::start_tag('div', ["class" => "member_strength"]);
echo html_writer::end_tag('div');
//end
//selecte member development area
//start
echo html_writer::start_tag('div', ["class" => "member_development"]);
echo html_writer::end_tag('div');
//end
//Feedback form start
echo html_writer::start_tag('h6');
$slectedMember = html_writer::start_tag('span', ["id" => "selected_member"]);
$slectedMember .= "--";
$slectedMember .= html_writer::end_tag('span');
echo "New feedback to $slectedMember:";
echo html_writer::end_tag('h6');
echo html_writer::start_tag('div', ["class" => "feedback_box"]);
echo html_writer::start_tag('form', ["method" => "post"]);
echo html_writer::start_tag('input', ["type" => "hidden", "name" => "receiver_id", "id" => "receiver_id", "value" => "0"]);
echo html_writer::start_tag('textarea', ["name" => "comment", "id" => "comment", "style" => "width:98%;background-color: rgb(255, 255, 166);", "rows" => "5"]);
echo html_writer::end_tag('textarea');
echo html_writer::start_tag('input', ["type" => "submit", "name" => "feedback_submit", "id" => "submit_feedback", "style" => "float: right;"]);
echo html_writer::start_tag('div', ["id" => "feedback_msg"]);
echo html_writer::end_tag('div');
echo html_writer::end_tag('form');
echo html_writer::end_tag('div');
//Feedback form end
//feedback history to selected user
echo html_writer::start_tag('div', ["class" => "member_feedback_history"]);
echo html_writer::end_tag('div');

echo html_writer::start_tag('div', ["class" => "clearfix"]);
echo html_writer::end_tag('div');

//Edit Strength Modal START
?>
<style type="text/css">
    #myModal_fn_edit .modal-body {
        height: 90vh;
        overflow: scroll;
    }
    #myModal_fn_edit label {
        float: left;
        font-weight: 700;
    }
    #myModal_fn_edit label.starlabel:after {
        content: " *";
        color: red;
    }
    #myModal_fn_edit span {
        float: right;
        margin-right: calc(5% - 12px);
    }
    #myModal_fn_edit .alert {
        width: calc(95% - 8px);
        padding-right: 12px;
        padding-left: 8px;
        display: none;
    }
    #myModal_fn_edit .alert button.close {
        outline: none;
        background-color: transparent;
    }
    #myModal_fn_edit .alert button.close span {
        outline: none;
        margin-right: 0;
    }
    #scroll-to-top-button {
        position: absolute;
        bottom: 10px;
        right: 10px;
    }
    #scroll-to-top-button {
        position: fixed;
        bottom: 55px;
        right: 10px;
        background: none;
        border: none !important;
        display: none;
        z-index: 99;
        text-align: center;
        font: 11px/100%;
        text-transform: uppercase;
        text-decoration: none;
        color: #003264;
        cursor: pointer;
    }
    #myModal_fn_edit .modal-body {
        position: relative;
        height: 500px;
        overflow: auto;
        padding-bottom: 40px;
    }
    #scroll-to-top-button:before {
        content: "\f139";
        font-family: FontAwesome;
        font-size: 13px;
        font-weight: 900;
        font-size: 3rem;
        color: #003264;
    }
    #scroll-to-top-button:focus {
        outline: none;
        outline: none;
    }
    .modal.fade.in {
        top: 10px;
    }
    @media (max-width: 767px){
        #myModal_fn_edit {
            top: 0% !important;
            width: 100% !important;
            left: 0 !important;
            height: 100vh !important;
            overflow: scroll !important;
        }
        #myModal_fn_edit .modal-body {
            position: relative;
            overflow: auto;
        }
        #confirm-modal {
            top: 0% !important;
            width: 100% !important;
            left: 0 !important;
            overflow: scroll !important;
        }
    }
</style>

<div id="confirm-modal" class="modal fade" style="display: none" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-center">Confirmation</h4>
            </div>
            <div class="modal-body text-center">
                <p>Changes have been made. Would you like to save?</p>
                <div class="modal-buttons">
                    <button id="confirm-button">Yes</button>
                    <button id="cancel-button">No</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="myModal_fn_edit" class="modal fade" style="display: none" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title text-center">Edit Strength and Development areas</h4>
                <div class="alert alert-danger" role="alert">
                    <strong class="message">Fields require a minimum of 75 words per field.</strong>
                    <button type="button" class="close" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>
            <form id="strength_form" action="<?php echo "ajax_strength.php?id='" . $cm->id . "'"; ?>" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="comment" class="starlabel"
                            title="Please fill out this field. Minimum 75 words.">1st Behavioral Strength</label>
                        <span id="showCount1">Word count: <?php echo str_word_count($USER->first_behavioral); ?></span>
                        <textarea class="form-control" rows="4" cols="100" id="txt_first_stregth"
                            name="txt_first_stregth"
                            placeholder="Please enter the first strength that you bring to your team.  Your two strengths must be behavioral characteristics that other team members, faculty, and leaders can observe.  You can use peer feedback, assessments like the Hogan assessments or other 360-degree instruments, personal assessments, etc.  Your team members will read these and give you feedback on your performance during the program in this context."
                            required><?php echo $USER->first_behavioral; ?></textarea>

                    </div>
                    <div class="form-group">
                        <label for="comment" class="starlabel"
                            title="Please fill out this field. Minimum 75 words.">2nd Behavioral Strength</label>
                        <span id="showCount2">Word count: <?php echo str_word_count($USER->second_behavioral); ?></span>
                        <textarea class="form-control" rows="3" cols="100" id="txt_second_stregth"
                            name="txt_second_stregth"
                            placeholder="Please enter the second behavioral strength that you bring to your team."
                            required><?php echo $USER->second_behavioral; ?></textarea>
                    </div>
                    <div class="form-group">
                        <label for="comment" class="starlabel"
                            title="Please fill out this field. Minimum 75 words.">1st Behavioral Development Area</label>
                        <span id="showCount3">Word count: <?php echo str_word_count($USER->first_development); ?></span>
                        <textarea class="form-control" rows="5" cols="100" id="txt_first_development"
                            name="txt_first_development"
                            placeholder="Please enter the first development area you wish to work on during the exercise.  Your two development areas must be behavioral characteristics that other team members, faculty, and leaders can observe.  You can use peer feedback, assessments like the Hogan assessments or other 360-degree instruments, personal assessments, etc.  Your team members will read these and give you feedback on your performance during the program in this context.  To maximize your experience, keep your development areas front of mind."
                            required><?php echo $USER->first_development; ?></textarea>
                    </div>
                    <div class="form-group">
                        <label for="comment" class="starlabel"
                            title="Please fill out this field. Minimum 75 words.">2nd Behavioral Development Area</label>
                        <span id="showCount4">Word count: <?php echo str_word_count($USER->second_development); ?></span>
                        <textarea class="form-control" rows="3" cols="100" id="txt_second_development"
                            name="txt_second_development"
                            placeholder="Please enter the second behavioral strength you wish to work on during the exercise."
                            required><?php echo $USER->second_development; ?></textarea>
                    </div>
                    <button id="scroll-to-top-button"></button>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="submit-btn" class="btn btn-default">Submit</button>
                    <button type="button" class="btn btn-default" id="close">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php
//Edit Strength Modal End
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    var firstStrength = document.getElementById('txt_first_stregth').value;
    var secondStrength = document.getElementById('txt_second_stregth').value;
    var firstDevelopment = document.getElementById('txt_first_development').value;
    var secondDevelopment = document.getElementById('txt_second_development').value;

    $('#scroll-to-top-button').on('click', function(event) {
        event.preventDefault();
        // Set the scroll position of the "modal-body" element to 0, effectively scrolling to the top of that element
        $('.modal-body').scrollTop(0);
    });

    const button = document.getElementById('scroll-to-top-button');

    $('.modal-body').on('scroll', function () {
        if (this.scrollTop > 0) {
            $('#scroll-to-top-button').css('display', 'block')
            button.classList.add('visible');
        } else {
            $('#scroll-to-top-button').css('display', 'none')
        }
    });

    $(document).ready(function () {
        // $('#confirm-button').on('click',function (){
        //     window.close();
        //     location.reload();
        // });
        $("#confirm-button").on('click',function (){
            // $("#strength_form").submit();
            $('#submit-btn').trigger('click');
        })
        $('#cancel-button').on('click',function (){
            location.reload();
            // $('#confirm-modal').modal('hide');
            // $('#myModal_fn_edit').modal('show');
        });
        $('#close').on('click', function () {
            if (firstStrength === document.getElementById('txt_first_stregth').value &&
                secondStrength === document.getElementById('txt_second_stregth').value &&
                firstDevelopment === document.getElementById('txt_first_development').value &&
                secondDevelopment === document.getElementById('txt_second_development').value) {
                location.reload();
            } else {
                $('#myModal_fn_edit').modal('hide');
                $('#confirm-modal').modal('show');
                location.reload();
            }
        });

        $(document).on("change", ".member", function () {
            var peerfeedback_id = "<?php echo $id ?>";
            var provider_id = "<?php echo $USER->id; ?>";
            var receiver_id = $(".member :selected").val();
            var user_name = $(".member :selected").text();

            if (provider_id && receiver_id) {
                $("#selected_member").html(user_name);
                $.ajax({
                    url: '<?php echo "$CFG->wwwroot/mod/peerfeedback/feedback_ajax.php"; ?>',
                    type: "POST",
                    dataType: 'json',
                    data: {
                        peerfeedback_id: peerfeedback_id,
                        provider_id: provider_id,
                        receiver_id: receiver_id
                    },
                    beforeSend: function (xhr) {

                    },
                    success: function (data, textStatus, jqXHR) {
                        $(".member_strength").html(data['strength']);
                        $(".member_development").html(data['development']);
                        $(".member_feedback_history").html(data['feeds']);
                    }
                });
            }
        });

        $(document).on("click", "#submit_feedback", function () {
            var peerfeedback_id = "<?php echo $id ?>";
            var comment = $("#comment").val();
            var receiver_id = $("#receiver_id :selected").val();

            if (!receiver_id || (receiver_id == 0)) {
                $("#feedback_msg").html("Please select user.");
                $("#feedback_msg").css("color", "red");
                return false;
            } else if (!comment) {
                $("#feedback_msg").html("Please provide feedback.");
                $("#feedback_msg").css("color", "red");
                return false;
            } else if (!peerfeedback_id || (peerfeedback_id == 0)) {
                $("#feedback_msg").html("some error occured.");
                $("#feedback_msg").css("color", "red");
                return false;
            } else {
                $.ajax({
                    url: '<?php echo $CFG->wwwroot . "/mod/peerfeedback/feedback_submit.php"; ?>',
                    type: "POST",
                    data: {
                        peerfeedback_id: peerfeedback_id,
                        comment: comment,
                        receiver_id: receiver_id
                    },
                    beforeSend: function (xhr) {

                    },
                    success: function (data, textStatus, jqXHR) {
                        $(".member_feedback_history").html(data);
                        $("#comment").val('');
                        // $(".history_scroll").animate({scrollTop: 99999}, 'fast');
                        $("#feedback_msg").css("color", "green");
                        $("#feedback_msg").html("Your feeback has been successfully submitted.");
                        return false;
                    }
                });
            }
            return false;
        });
        //show the count of words
        $("#strength_form #txt_first_stregth").keyup(function () {
            var count = ($(this).val() === null || $(this).val() === '') ? 0 : wordCount($(this).val());
            if (wordCount($(this).val()) < 75) {
                $("#showCount1").html("Word count: " + count);
                $("#showCount1").css("color", "red");
            } else {
                $("#showCount1").html("Word count: " + count);
                $("#showCount1").css("color", "green");
            }
        });
        $("#strength_form #txt_second_stregth").keyup(function () {
            var count = ($(this).val() === null || $(this).val() === '') ? 0 : wordCount($(this).val());

            if (wordCount($(this).val()) < 75) {
                $("#showCount2").html("Word count: " + count);
                $("#showCount2").css("color", "red");
            } else {
                $("#showCount2").html("Word count: " + count);
                $("#showCount2").css("color", "green");
            }
        });
        $("#strength_form #txt_first_development").keyup(function () {
            var count = ($(this).val() === null || $(this).val() === '') ? 0 : wordCount($(this).val());
            if (wordCount($(this).val()) < 75) {
                $("#showCount3").html("Word count: " + count);
                $("#showCount3").css("color", "red");
            } else {
                $("#showCount3").html("Word count: " + count);
                $("#showCount3").css("color", "green");
            }
        });
        $("#strength_form #txt_second_development").keyup(function () {
            var count = ($(this).val() === null || $(this).val() === '') ? 0 : wordCount($(this).val());
            if (wordCount($(this).val()) < 75) {
                $("#showCount4").html("Word count: " + count);
                $("#showCount4").css("color", "red");
            } else {
                $("#showCount4").html("Word count: " + count);
                $("#showCount4").css("color", "green");
            }
        });
        //alert message
        $("#strength_form .alert button.close").click(function () {
            $('#myModal_fn_edit .alert').hide();
        });
        $("#strength_form").submit(function (event) {
            event.preventDefault();
            var post_url = $(this).attr("action");
            var request_method = $(this).attr("method");
            var form_data = $(this).serialize();

            $.ajax({
                type: request_method,
                url: post_url,
                data: form_data,
                dataType: "json",
            }).done(function (data) {
                //console.log(data);
                if (!data.status) {
                    $('#myModal_fn_edit').modal('show');
                    $(".message").html(data.message);
                    $('#myModal_fn_edit .alert').show();
                } else {
                    $('#myModal_fn_edit .alert').hide();
                    setTimeout(function () {
                        window.location.reload();
                    }, 500);
                }
            });
            return false;//prevent form submits twice
        });
    });

    function fn_edit() {
        $('#myModal_fn_edit').modal('show');
    }

    function wordCount(str) {
        const isAlpha = (ch) =>
        (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z');

        let count = 0;
        let i = 0;
        const n = str.length;

        // Skip initial ' and - characters
        if (str[i] === "'" || str[i] === "-") {
            i++;
        }

        // Skip ending - character
        if (str[n - 1] === "-") {
            n--;
        }

        while (i < n) {
            let start = i;
            while (i < n && (isAlpha(str[i]) || str[i] === "'" || str[i] === '-')) {
                i++;
            }

            if (i > start) {
                const word = str.slice(start, i);
                count++;
            }
            i++;
        }
        return count;
    }

</script>
<?php
// Finish the page.
echo $OUTPUT->footer();