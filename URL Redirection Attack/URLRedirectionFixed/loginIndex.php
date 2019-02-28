<!-- loginIndex.php -->
<!-- September 10, 2018 -->
<?php
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: DENY');
ini_set('session.cookie_httponly',1);
//starts a session includes components from the file functions.php
session_start();
include("functions.php");
$message="";
//setting of login data - username, password, and email
if(count($_POST)>0) {
        if( $_POST["user_name"] == "Matt_Rieser" and $_POST["password"] == "Mpr+114896"  and $_POST["email"] == "email@gmail.com") {
//checking if username, password, email, and logintime are correct
                $_SESSION["user_id"] = 1001;
                $_SESSION["user_name"] = $_POST["user_name"];
                $_SESSION["email"] = $_POST["email"];
                $_SESSION['loggedin_time'] = time();  
        } else {
//if not they will recieve this message
                $message = "Invalid Username, Password, or Email!";
        }
}
//if the login data is correct they will be redirected to the homepage
if(isset($_SESSION["user_id"])) {
        if(!isLoginSessionExpired()) {
            header("Location: Index.php");
        } else {
            header("Location:Logout.php?session_expired=1");
        }
}
//session has expired, requiring the user to enter information again
if(isset($_GET["session_expired"])) {
        $message = "Login Session is Expired. Please Login Again";
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>

      <title>
      User Login
    </title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
  </head>
  <body>
    <form name="frmUser" method="post" action="" id="frmUser" autocomplete="off">
      <?php if($message!="") { ?>
      <div class="message">
        <?php echo $message; ?>
      </div><?php } ?>
      <table border="0" cellpadding="10" cellspacing="1" width=
      "100%" class="tblLogin">
        <tr class="tableheader">
          <td align="center" colspan="2">
            Enter Login Details
          </td>
        </tr>
        <tr class="tablerow">
          <td align="right">
            Username
          </td>
          <td>
            <input type="text" name="user_name" />
          </td>
        </tr>
        <tr class="tablerow">
          <td align="right">
            Password
          </td>
          <td>
            <input type="password" name="password" />
          </td>
        </tr>
        <tr class="tablerow">
          <td align="right">
            Email
          </td>
          <td>
            <input type="email" name="email" />
          </td>
        </tr>
        <tr class="tableheader">
          <td align="center" colspan="2">
            <input type="submit" name="submit" value="Submit" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
