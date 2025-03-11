<?php
require_once(dirname(dirname(dirname(__FILE__))) . '/config.php');
require_once(dirname(__FILE__) . '/lib.php');

//Update Strength and Development areas
$valid = false;
$peerfeedback_id = isset($_GET['id']) ? $_GET['id'] : 0;
if ($peerfeedback_id) {
  $txt_first_stregth = $_POST['txt_first_stregth'] ?? '';
  $txt_second_stregth = $_POST['txt_second_stregth'] ?? '';
  $txt_first_development = $_POST['txt_first_development'] ?? '';
  $txt_second_development = $_POST['txt_second_development'] ?? '';

  $columns = $DB->get_columns('user');

  $key = 'id';

  if (array_key_exists('id', $columns)) {
    echo "Field $key exists in the user table.";
  } else {
    echo "Field $key does NOT exist.";
  }

  //check word count: min 75 words
  $word_count1 = str_word_count($txt_first_stregth);
  $word_count2 = str_word_count($txt_second_stregth);
  $word_count3 = str_word_count($txt_first_development);
  $word_count4 = str_word_count($txt_second_development);
  if($word_count1 >= 75 && $word_count2 >= 75 && $word_count3 >= 75 && $word_count4 >= 75) {
    $update_obj = new stdClass();
    $update_obj->id = $USER->id;
    $update_obj->first_behavioral = $txt_first_stregth;
    $update_obj->second_behavioral = $txt_second_stregth;
    $update_obj->first_development = $txt_first_development;
    $update_obj->second_development = $txt_second_development;

    $result = $DB->update_record('user', $update_obj, false);
    $USER->first_behavioral = $txt_first_stregth;
    $USER->second_behavioral = $txt_second_stregth;
    $USER->first_development = $txt_first_development;
    $USER->second_development = $txt_second_development;
    $valid = true;
  }
}
if($valid) {//redirect
  echo json_encode(array('status' => true, 'message' => 'success'));
}
else {
  echo json_encode(array('status' => false, 'message' => 'Fields require a minimum of 75 words per field.'));
}
die;