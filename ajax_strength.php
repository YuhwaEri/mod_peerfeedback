<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/config.php');
require_once(dirname(__FILE__) . '/lib.php');

global $DB;
//Update Strength and Development areas
$valid = false;
$soi_id = isset($_GET['id']) ? $_GET['id'] : 0;
if ($soi_id) {

    $txt_first_stregth = required_param('txt_first_stregth',PARAM_RAW);
    $txt_second_stregth = required_param('txt_second_stregth',PARAM_RAW);
    $txt_first_development = required_param('txt_first_development',PARAM_RAW);
    $txt_second_development = required_param('txt_second_development',PARAM_RAW);
    //check word count: min 75 words
    $word_count1 = str_word_count($txt_first_stregth);
    $word_count2 = str_word_count($txt_second_stregth);
    $word_count3 = str_word_count($txt_first_development);
    $word_count4 = str_word_count($txt_second_development);
    if ($word_count1 >= 75 && $word_count2 >= 75 && $word_count3 >= 75 && $word_count4 >= 75) {

        $record = $DB->get_record('soi_feedback_area', ['userid' => $soi_id]);

        if ($record) {

            $update_sql = "UPDATE {soi_feedback_area} SET first_behavioral=:first_behavioral, second_behavioral=:second_behavioral, first_development=:first_development, second_development=:second_development WHERE userid=:userid";
            $DB->execute($update_sql,
                [
                    'first_behavioral' => $txt_first_stregth,
                    'second_behavioral' => $txt_second_stregth,
                    'first_development' => $txt_first_development,
                    'second_development' => $txt_second_development,
                    'userid' => $soi_id
                ]
            );

        } else {
            $DB->insert_record("soi_feedback_area",
                ["first_behavioral" => $txt_first_stregth,
                    "second_behavioral" => $txt_second_stregth,
                    "first_development" => $txt_first_development, "second_development" => $txt_second_development, "userid" => $soi_id]);
        }
        $valid = true;
    }
}
if ($valid) {//redirect
    echo json_encode(array('status' => true, 'message' => 'success'));
} else {
    echo json_encode(array('status' => false, 'message' => 'Fields require a minimum of 75 words per field.'));
}
die;