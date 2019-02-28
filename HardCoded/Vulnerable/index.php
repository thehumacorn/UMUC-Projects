<?php
session_start();
require "logAuth.php";
?>
<!DOCTYPE html>
<html>
<head>
    <title>HW4</title>
<style type="text/css">

    .error  {color: #FF0000;}

    input[type=text], input[type=password] {
        width: 40%;
        padding: 12px 20px;
        margin: 8px 0;
        box-sizing: border-box;
    }

    input[type=submit] {
        background-color: #4CAF50;
        color: white;
    }

</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<h1>Appalachian Artifacts</h1>
<form id="LoginForm" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
    <fieldset>
        <legend><h3>Login</h3></legend>
        Username <br><input type="text" name="uname" placeholder="Username = admin" value="<?php echo $uname;?>"><span class="error"> <?php echo $unameERR;?></span><br>
        Password <br><input type="password" name="pword" placeholder="Password = password123" autocomplete='off' value="<?php echo $pword;?>"><span class="error"> <?php echo $pwordERR;?></span><br>
        <input type="submit" value="Login">
    </fieldset>
</form>
</body>
</html>