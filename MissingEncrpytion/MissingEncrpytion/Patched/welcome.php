<?php
require 'session.php';
?>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page - AA</title>
</head>
<body>
    <h1>Welcome, have a look around!</h1>
    
    <form action='<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>'>
    <input type="submit" name="logout" value="Logout">
    </form>
</body>
</html>
