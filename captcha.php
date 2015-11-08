<?php
/**
 * Created by PhpStorm.
 * User: andrewsyc
 * Date: 11/8/15
 * Time: 12:16 PM
 */

session_start();

include_once '/securimage/securimage.php';

$securimage = new Securimage();

if ($securimage->check($_POST['captcha_code']) == false) {
  // the code was incorrect
  // you should handle the error so that the form processor doesn't continue
  // or you can use the following code if there is no validation or you do not know how
  echo "The security code entered was incorrect.<br /><br />";
  echo "Please go <a href='javascript:history.go(-1)'>back</a> and try again.";
  exit;
} else echo "awesome";
?>
<img id="captcha" src="/securimage/securimage_show.php" alt="CAPTCHA Image" />
<input type="text" name="captcha_code" size="10" maxlength="6" />
<a href="#" onclick="document.getElementById('captcha').src = '/securimage/securimage_show.php?' + Math.random(); return false">[ Different Image ]</a>