<?php

if (isset($_GET['logout'])) {
        if (isset($_COOKIE['userdata'])) 
        {
            setcookie('userdata', "", (time() - 3600));
        }
        header("Location: index.php");
        exit;
    }

?>
