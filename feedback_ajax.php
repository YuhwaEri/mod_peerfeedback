<?php

require_once(dirname(dirname(dirname(__FILE__))) . '/config.php');
require_once(dirname(__FILE__) . '/lib.php');

$provider_id = isset($_POST['provider_id']) ? $_POST['provider_id'] : 0;
$receiver_id = isset($_POST['receiver_id']) ? $_POST['receiver_id'] : 0;
$soi_id = isset($_POST['soi_id']) ? $_POST['soi_id'] : 0;


$userDetail = $DB->get_record_sql("Select * From {user} WHERE id = ?", [$receiver_id]);
$strength = '';
$development = '';
if ($userDetail) {

    $strength = html_writer::start_tag('h6');
    $strength .= "$userDetail->username Strength areas";
    $strength .= html_writer::end_tag('h6');
    $strength .= html_writer::start_tag('div', ["class" => "border-box"]);
    $strength .= html_writer::start_tag('ol');
    $strength .= html_writer::start_tag('li');
    $strength .= $userDetail->first_behavioral;
    $strength .= html_writer::end_tag('li');
    $strength .= html_writer::start_tag('hr', ["style" => "margin: 6px"]);
    $strength .= html_writer::start_tag('li');
    $strength .= $userDetail->second_behavioral;
    $strength .= html_writer::end_tag('li');
    $strength .= html_writer::end_tag('ol');
    $strength .= html_writer::end_tag('div');


    $development = html_writer::start_tag('h6');
    $development .= "$userDetail->username Development areas";
    $development .= html_writer::end_tag('h6');
    $development .= html_writer::start_tag('div', ["class" => "border-box"]);
    $development .= html_writer::start_tag('ol');
    $development .= html_writer::start_tag('div', ["contenteditable" => "true"]);
    $development .= html_writer::start_tag('li');
    $development .= $userDetail->first_development;
    $development .= html_writer::end_tag('li');
    $development .= html_writer::end_tag('div');
    $development .= html_writer::start_tag('hr', ["style" => "margin: 6px"]);
    $development .= html_writer::start_tag('li');
    $development .= $userDetail->second_development;
    $development .= html_writer::end_tag('li');
    $development .= html_writer::end_tag('ol');
    $development .= html_writer::end_tag('div');
    
}


$feedbacks = $DB->get_records_sql("Select * From {userfeedback} WHERE (soi_id = ? AND (provider_id = ? AND receiver_id = ?)) order by id DESC", [$soi_id, $provider_id, $receiver_id]);

$feeds = html_writer::start_tag('h6');
$feeds .= "Feedback from $USER->username to $userDetail->username:";
$feeds .= html_writer::end_tag('h6');
$feeds .= html_writer::start_tag('div', ["class" => "border-box history_scroll"]);
if ($feedbacks) {
    $feeds .= html_writer::start_tag('ul');
    foreach ($feedbacks as $feedback) {
        $feeds .= html_writer::start_tag('li');
        $feeds .= $feedback->comment;
        $feeds .= html_writer::start_tag('span',["class" => "history_time"]);
        $feeds .= date("d-M-Y h:i a", strtotime($feedback->created_at));
        $feeds .= html_writer::end_tag('span');
        $feeds .= html_writer::end_tag('li');
        $feeds .= html_writer::start_tag('hr', ["style" => "margin: 6px"]);
    }
    $feeds .= html_writer::end_tag('ul');
} else {
    $feeds .= "No Feedback";
}
$feeds .= html_writer::end_tag('div');
echo json_encode(["strength" => $strength, "development" => $development, "feeds" => $feeds]);
die;
