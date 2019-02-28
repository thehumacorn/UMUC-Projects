<?php

    //Variable bank
    $Welcome = false;
    $uname = $pword = "";
    $unameERR = $pwordERR = "";

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
    setcookie('userdata', krypt($data), (time()+450), "/");
    header("Location: welcome.php");
    exit;
    }

    //Functions
    
    //crypto
    function krypt( $string, $action = 'e' ) {
    $secret_key = 'my_secret_key';
    $secret_iv = 'my_secret_iv';
 
    $output = "";
    $encrypt_method = "AES-256-CBC";
    $key = hash( 'sha256', $secret_key );
    $iv = substr( hash( 'sha256', $secret_iv ), 0, 16 );
 
    if( $action == 'e' ) {
        $output = base64_encode( openssl_encrypt( $string, $encrypt_method, $key, 0, $iv ) );
    }
    else if( $action == 'd' ){
        $output = openssl_decrypt( base64_decode( $string ), $encrypt_method, $key, 0, $iv );
    }
    return $output;
    }
    
    //tidy up login input
    function formInput($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }


?>
