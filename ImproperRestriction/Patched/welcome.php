<?php
    session_start();
    if (isset($_GET['logout'])) {
        unset($_SESSION['logtmpt']);
        session_unset();
        session_destroy();
        header("Location: index.php");
        exit;
    }
?>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome Page</title>
</head>
<body>
<h1>Welcome <?php echo $_SESSION['uname']; ?> ! </h1>
    <form action='<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>'>
        <input type="submit" name="logout" value="Logout">
    </form>
</body>
</html>
