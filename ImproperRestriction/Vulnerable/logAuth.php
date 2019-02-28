<?php
    //Variable bank
    $uname = $pword = "";
    $unameERR = $pwordERR = "";
    $Welcome["uname"] = FALSE;
    $Welcome["pword"] = FALSE;

    //Pull in input with checks
    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {   
        if ($_POST["uname"] === "user1")
        {
            $uname = formInput($_POST["uname"]);
            $Welcome["uname"] = TRUE;
        } else {
            $unameERR = "Username is incorrect";
        }

        if ($_POST["pword"] === "password123")
        {
            $pword = formInput($_POST["pword"]);
            $Welcome["pword"] = TRUE;
        } else {
            $pwordERR = "Password is incorrect";
        }
    }

    if ($Welcome["uname"] === TRUE && $Welcome["pword"] === TRUE)
    {
        //Begin a user session
        $_SESSION['uname'] = $uname;
        $_SESSION['pword'] = $pword;
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
