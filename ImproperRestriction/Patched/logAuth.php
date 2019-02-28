<?php
    //Variable bank
    $uname = $pword = $denied = "";
    $unameERR = $pwordERR = "";
    $Welcome["uname"] = FALSE;
    $Welcome["pword"] = FALSE;
    
    // Initialize login attempt counter
    if (!isset($_SESSION['logtmpt'])) {
        $_SESSION['logtmpt'] = 0;
    }

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
    
    //login success under 3 attemts
    if ($Welcome["uname"] === TRUE && $Welcome["pword"] === TRUE && $_SESSION['logtmpt'] < 3)
    {
        // reset login attemtps
        $_SESSION['logtmpt'] = 0;

        //Begin a user session
        $_SESSION['uname'] = $uname;
        $_SESSION['pword'] = $pword;
        header("Location: welcome.php");
        exit;
    }
    //bad login under lockout threshold
    elseif ($_SESSION['logtmpt'] >= 3)
    {
        //denied error with targeted user
        $denied = "Account for ".$uname." has been locked. Please contact a site Admin for help.";
    }
    //base case
    elseif ($Welcome['uname'] === TRUE || $Welcome['pword'] === TRUE)
    {
        // increment attempts
        $_SESSION['logtmpt']++;
    }
    
    //make user input safer
    function formInput($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }


?>
