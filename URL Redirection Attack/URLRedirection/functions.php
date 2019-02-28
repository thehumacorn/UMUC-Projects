<!-- functions.php -->
<!-- September 10, 2018 -->
<?php
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: DENY');
ini_set('session.cookie_httponly',1);
//sets the login session duration
function isLoginSessionExpired() {
	$login_session_duration = 10 * 60; 
	$current_time = time(); 
	if(isset($_SESSION['loggedin_time']) and isset($_SESSION["user_id"])){  
		if(((time() - $_SESSION['loggedin_time']) > $login_session_duration)){ 
			return true; 
		} 
	}
	return false;
}
?>
