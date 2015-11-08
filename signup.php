<?php // Example 26-5: signup.php
require_once 'header.php';
require_once 'securimage/securimage.php';

echo <<<_END
  <script>
    function checkUser(user)
    {
      if (user.value == '')
      {
        O('info').innerHTML = ''
        return
      }

      params  = "user=" + user.value
      request = new ajaxRequest()
      request.open("POST", "checkuser.php", true)
      request.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
      request.setRequestHeader("Content-length", params.length)
      request.setRequestHeader("Connection", "close")

      request.onreadystatechange = function()
      {
        if (this.readyState == 4)
          if (this.status == 200)
            if (this.responseText != null)
              O('info').innerHTML = this.responseText
      }
      request.send(params)
    }

    function ajaxRequest()
    {
      try { var request = new XMLHttpRequest() }
      catch(e1) {
        try { request = new ActiveXObject("Msxml2.XMLHTTP") }
        catch(e2) {
          try { request = new ActiveXObject("Microsoft.XMLHTTP") }
          catch(e3) {
            request = false
      } } }
      return request
    }
  </script>
  <div class='main'><h3>Please enter your details to sign up</h3>
_END;

$error = $user = $pass = "";
if (isset($_SESSION['user'])) destroySession();

if (isset($_POST['user'])) {
    $user = sanitizeString($_POST['user']);
    $pass = sha1(sanitizeString($_POST['pass']));
//    $final = password_hash($salthash, PASSWORD_DEFAULT);

//    $image = new Securimage();
//    if ($image->check($_POST['captcha_code']) == true) {
//        echo "Correct!";
//    } else {
//        echo "Sorry, wrong code.";
//    }

    if ($user == "" || $pass == "")
        $error = "Not all fields were entered<br><br>";
    else {
        $result = queryMysql("SELECT * FROM members WHERE user='$user'");

        if ($result->num_rows)
            $error = "That username already exists<br><br>";
        else {
            queryMysql("INSERT INTO members VALUES('$user', '$pass')");
            die("<h4>Account created</h4>Please Log in.<br><br>");
        }
    }
}

echo <<<_END
    <form method='post' action='signup.php'>$error
    <span class='fieldname'>Username</span>
    <input type='text' maxlength='16' name='user' value='$user'
      onBlur='checkUser(this)'><span id='info'></span><br>
    <span class='fieldname'>Password</span>
    <input type='text' maxlength='16' name='pass' autocomplete="off"
      value='$pass'><br>
      <input type='submit' value='Sign up'>

    </form>
_END;
?>
<!--<form method="post" action="">-->
<!--<!---->-->
<!--    <div>-->
<!--        --><?php //echo Securimage::getCaptchaHtml() ?>
<!--    </div>-->
<!--</form>-->
<span class='fieldname'>&nbsp;</span>
<!--<input type='submit' value='Sign up'>-->


</body>
</html>
