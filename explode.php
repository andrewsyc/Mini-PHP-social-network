<?php
/**
 * Created by PhpStorm.
 * User: andrewsyc
 * Date: 11/8/15
 * Time: 10:38 AM
 *
 * This file is for preloading the database with users, well in preps of doing so.
 */
require_once ''
$txt_file    = file_get_contents("names.txt") or die("Unable to open file!");
$rows        = explode(' ', $txt_file);

foreach($rows as $row){

    //get row data
//    $row_data = explode('0', $row);
//    echo $row_data;
    echo $row;

}



?>