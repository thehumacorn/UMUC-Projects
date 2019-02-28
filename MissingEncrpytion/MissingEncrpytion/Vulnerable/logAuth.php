<?php

    //Variable bank
    $uname = $pword = "";
    $unameERR = $pwordERR = "";

    //Lab4 specific
    $Welcome = false;

    //Pull in input with checks
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if (empty($_POST["uname"]))
        {
            $unameERR = "Username is required";
            $Welcome = false;
        } else {
            $uname = formInput($_POST["uname"]);
            $Welcome = true;
        }

        if (empty($_POST["pword"]))
        {
            $pwordERR = "Password is required";
            $Welcome = false;
        } else {
            $pword = formInput($_POST["pword"]);
            $Welcome = true;
        }
    }

    if ($Welcome) {
    //Set Cookie and begin user session
    $data = $uname . "+" . $pword;
    setcookie('userdata', $data, (time()+450), "/");
    header("Location: welcome.php");
    exit;
    }

    //
    function formInput($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }


?>
