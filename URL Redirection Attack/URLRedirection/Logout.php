<!-- Logout.php -->
<!-- September 10, 2018 -->
<?php
//starts a session
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: DENY');
ini_set('session.cookie_httponly',1);
session_start();
//log the user out if criteria isn't set
unset($_SESSION["user_id"]);
unset($_SESSION["user_name"]);
//redirects the user to the login page
$url = "loginIndex.php";
if(isset($_GET["session_expired"])) {
	$url .= "?session_expired=" . $_GET["session_expired"];
}
header("Location:$url");
?>
