<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/config.php');
require_once(dirname(__FILE__) . '/lib.php');

global $DB, $USER, $CFG;

$comment = optional_param('comment', '', PARAM_TEXT);
$receiver_id = optional_param('receiver_id', 0, PARAM_INT);
$peerfeedback_id = optional_param('peerfeedback_id', 0, PARAM_INT);;
$provider_id = $USER->id;

$lastinsertid = $DB->insert_record('peerfeedback_userfeedback', [
    'provider_id' => intval($provider_id),
    'receiver_id' => intval($receiver_id),
    'peerfeedback_id' => intval($peerfeedback_id),
    'comment' => $comment,
    'created_at' => strtotime(date("Y-m-d h:i:s"))
]);

if ($lastinsertid) {

    $feedbacks = $DB->get_records_sql("Select * From {peerfeedback_userfeedback} WHERE (peerfeedback_id = ? AND (provider_id = ? AND receiver_id = ?)) order by id DESC", [$peerfeedback_id, $provider_id, $receiver_id]);
    $userDetail = $DB->get_record_sql("Select * From {peerfeedback_feedback_area} WHERE userid = ? ", [$receiver_id]);
    $receiver = $DB->get_record('user', ['id' => $receiver_id]);

    echo html_writer::start_tag('h6');
    echo "Feedback from $USER->username to $receiver->username:";
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
