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
echo $OUTPUT->heading('Strength Opportunities');

//User strength areas
//start
echo html_writer::start_tag('h6');
echo "My Strength areas";
echo html_writer::end_tag('h6');
echo html_writer::start_tag('div', ["class" => "border-box"]);

echo html_writer::start_tag('ol');
echo html_writer::start_tag('li');

echo html_writer::start_tag('div', ["class" => "first-behavioral-box"]);
echo html_writer::start_tag('form', ["method" => "post", "action" => "submit_feedback.php"]);
echo html_writer::start_tag('input', ["type" => "hidden", "name" => "receiver_id", "id" => "receiver_id", "value" => "0"]);
echo html_writer::start_tag('textarea', ["name" => "comment", "id" => "comment", "style" => "width:98%;background-color: rgb(255, 255, 255);", "rows" => "2"]);
echo $USER->first_behavioral;

echo html_writer::end_tag('textarea');
echo html_writer::start_tag('div', ["id" => "feedback_msg"]);
echo html_writer::end_tag('div');

echo html_writer::end_tag('form');

echo html_writer::end_tag('li');



echo html_writer::start_tag('hr', ["style" => "margin: 6px"]);
echo html_writer::start_tag('li');

echo html_writer::start_tag('div', ["class" => "second-behavioral-box"]);
echo html_writer::start_tag('form', ["method" => "post", "action" => "submit_feedback.php"]);
echo html_writer::start_tag('input', ["type" => "hidden", "name" => "receiver_id", "id" => "receiver_id", "value" => "0"]);
echo html_writer::start_tag('textarea', ["name" => "comment", "id" => "comment", "style" => "width:98%;background-color: rgb(255, 255, 255);", "rows" => "2"]);
echo $USER->second_behavioral;
    
echo html_writer::end_tag('textarea');
echo html_writer::start_tag('div', ["id" => "feedback_msg"]);
echo html_writer::end_tag('div');
echo html_writer::end_tag('form');

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

echo html_writer::start_tag('div', ["class" => "first-development-box"]);
echo html_writer::start_tag('form', ["method" => "post", "action" => "submit_feedback.php"]);
echo html_writer::start_tag('input', ["type" => "hidden", "name" => "receiver_id", "id" => "receiver_id", "value" => "0"]);
echo html_writer::start_tag('textarea', ["name" => "comment", "id" => "comment", "style" => "width:98%;background-color: rgb(255, 255, 255);", "rows" => "2"]);
echo $USER->first_development;

echo html_writer::end_tag('textarea');
echo html_writer::start_tag('div', ["id" => "feedback_msg"]);
echo html_writer::end_tag('div');
echo html_writer::end_tag('form');

echo html_writer::end_tag('li');
echo html_writer::start_tag('hr', ["style" => "margin: 6px"]);
echo html_writer::start_tag('li');

echo html_writer::start_tag('div', ["class" => "second-development-box"]);
echo html_writer::start_tag('form', ["method" => "post", "action" => "submit_feedback.php"]);
echo html_writer::start_tag('input', ["type" => "hidden", "name" => "receiver_id", "id" => "receiver_id", "value" => "0"]);
echo html_writer::start_tag('textarea', ["name" => "comment", "id" => "comment", "style" => "width:98%;background-color: rgb(255, 255, 255);", "rows" => "2"]);
echo $USER->second_development;

echo html_writer::end_tag('textarea');
echo html_writer::start_tag('div', ["id" => "feedback_msg"]);
echo html_writer::end_tag('div');
echo html_writer::end_tag('form');

echo html_writer::end_tag('li');
echo html_writer::end_tag('ol');
echo html_writer::end_tag('div');

// Submit button for profile update 
echo html_writer::start_tag('input', ["type" => "submit", "name" => "feedback_submit", "id" => "submit_feedback", "style" => "float: right;"]);
echo html_writer::start_tag('div', ["class" => "clearfix"]);
echo html_writer::end_tag('div');


//end
//feedback list to given by user team 
//start
echo html_writer::start_tag('h6');
echo "Feedback from my team:";
echo html_writer::end_tag('h6');
echo html_writer::start_tag('div', ["class" => "feedback_history history_scroll"]);
$feedbacks = $DB->get_records_sql("Select * From {peerfeedback_userfeedback} WHERE peerfeedback_id = ? AND receiver_id = ? Order by id DESC", [$id, $USER->id]);
if ($feedbacks) {
    echo html_writer::start_tag('ul');
    foreach ($feedbacks as $feedback) {
        echo html_writer::start_tag('li');
        echo $feedback->comment;
        echo html_writer::start_tag('span',["class" => "history_time"]);
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
$groups = groups_get_user_groups($course->id,$USER->id);
$memberArray = [];
if ($groups) {
    $group = $groups[0];
    for($i=0; $i< count($groups[0]); $i++) {

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
echo "New feedback from $USER->username to $slectedMember:";
echo html_writer::end_tag('h6');
echo html_writer::start_tag('div', ["class" => "feedback_box"]);
echo html_writer::start_tag('form', ["method" => "post", "action" => "submit_feedback.php"]);
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
?>
<script>
    $(document).ready(function () {
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
                    url: '<?php echo "/mod/peerfeedback/feedback_submit.php"; ?>',
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
//                      $(".history_scroll").animate({scrollTop: 99999}, 'fast');
                        $("#feedback_msg").css("color", "green");
                        $("#feedback_msg").html("Your feeback has been successfully submitted.");
                        return false;
                    }
                });
            }
            return false;
        });
    });
</script>
<?php
// Finish the page.
echo $OUTPUT->footer();
