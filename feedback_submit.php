<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/config.php');
require_once(dirname(__FILE__) . '/lib.php');


$comment = isset($_POST['comment']) ? $_POST['comment'] : 0;
$receiver_id = isset($_POST['receiver_id']) ? $_POST['receiver_id'] : 0;
$peerfeedback_id = isset($_POST['peerfeedback_id']) ? $_POST['peerfeedback_id'] : 0;
$provider_id = $USER->id;

$record = new stdClass();
$record->provider_id = $provider_id;
$record->receiver_id = $receiver_id;
$record->soi_id = $peerfeedback_id;
$record->comment = $comment;
$record->created_at = date("Y-m-d h:i:s");
$lastinsertid = $DB->insert_record('userfeedback', $record);

if ($lastinsertid) {

    $feedbacks = $DB->get_records_sql("Select * From {userfeedback} WHERE (soi_id = ? AND (provider_id = ? AND receiver_id = ?)) order by id DESC", [$peerfeedback_id, $provider_id, $receiver_id]);
    $userDetail = $DB->get_record_sql("Select * From {user} WHERE id = ? ", [$receiver_id]);
    echo html_writer::start_tag('h6');
    echo "Feedback from $USER->username to $userDetail->username:";
    echo html_writer::end_tag('h6');
    echo html_writer::start_tag('div', ["class" => "border-box history_scroll"]);
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
}

die;
