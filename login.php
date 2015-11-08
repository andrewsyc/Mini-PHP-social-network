<?php // Example 26-7: login.php
require_once 'header.php';
echo "<div class='main'><h3>Please enter your details to log in</h3>";
$error = $user = $pass = "";

if (isset($_POST['user'])) {
    $user = sanitizeString($_POST['user']);
    $pass = password_hash(sanitizeString($_POST['pass']), PASSWORD_DEFAULT);
    $pass = sha1(sanitizeString($_POST['pass']));

    if ($user == "" || $pass == "")
        $error = "Not all fields were entered<br>";
    else {
        $result = queryMySQL("SELECT user,pass FROM members
        WHERE user='$user' AND pass='$pass'");

        if ($result->num_rows == 0) {
            $error = "<span class='error'>Username/Password
                  invalid</span><br><br>";
        } else {
            $_SESSION['user'] = $user;
            $_SESSION['pass'] = $pass;
            die("You are now logged in. Please <a href='members.php?view=$user'>" .
                "click here</a> to continue.<br><br>");
        }
    }
}
echo $pass;
echo <<<_END
    <form method='post' action='login.php'>$error
    <span class='fieldname'>Username</span><input type='text'
      maxlength='16' name='user' value='$user'><br>
    <span class='fieldname'>Password</span><input type='password'
      maxlength='16' name='pass' value='$pass'>
_END;
?>

<br>
<span class='fieldname'>&nbsp;</span>
<input type='submit' value='Login'>
</form><br></div>

<!--Form that can be installed later on-->
<?php
//echo <<<_END
//<form>
//  <div class="form-group">
//    <label for="exampleInputEmail1">Email address</label>
//    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
//  </div>
//  <div class="form-group">
//    <label for="exampleInputPassword1">Password</label>
//    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
//  </div>
//  <div class="form-group">
//    <label for="exampleInputFile">File input</label>
//    <input type="file" id="exampleInputFile">
//    <p class="help-block">Example block-level help text here.</p>
//  </div>
//  <div class="checkbox">
//    <label>
//      <input type="checkbox"> Check me out
//    </label>
//  </div>
//  <button type="submit" class="btn btn-default">Submit</button>
//</form>
//_END;

?>
</body>
</html>
