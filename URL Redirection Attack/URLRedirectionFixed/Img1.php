<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Img1.php -->
<!-- September 10, 2018 -->
<?php
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: DENY');
ini_set('session.cookie_httponly',1);
session_start();
include("functions.php");
//if time expires user is logged out 
if(isset($_SESSION["user_id"])) {
        if(isLoginSessionExpired()) {
                header("Location:Logout.php?session_expired=1");
        }
}
?><!-- Website Code below -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>
      Image 1
    </title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <meta http-equiv="Content-Type" content=
    "text/html; charset=utf-8" />
  </head>
  <body>
    <table border="0" cellpadding="10" cellspacing="1" width=
    "100%">
      <tr class="tableheader">
        <td align="center">
          User Dashboard
        </td>
      </tr>
      <tr class="tablerow">
        <td>
          <?php
                    //provides the user with a welcome message and their username is displayed. A logout option is also available.
                                        if(isset($_SESSION["user_name"])) {
                                        ?>Welcome
          <?php echo $_SESSION["user_name"]; ?>. Click here to
          <a href="Logout.php" tite="Logout">Logout. <?php
                                        }
                                        ?></a>
          <h1>
            Image 1 Description
          </h1>
          <p>
            <!-- Add Table of Hyperlinks -->
          </p>
          <table border="1">
            <tr>
              <td>
                Menu
              </td>
            </tr>
            <tr>
              <td>
                <a href="Index.php">Homepage</a>
              </td>
            </tr>
            <tr>
              <!-- Add some images in a table -->
            </tr>
            <tr>
              <td></td>
              <td>
                <img src="Image%201.jpg" width="408.125" height=
                "612.25" />
              </td>
              <td>
                This is a photograph of the Eiffel Tower in Paris,
                France in the winter time.
              </td>
            </tr>
          </table>Price: $15<br />
          Photograph by Matt Rieser
        </td>
      </tr>
    </table>
  </body>
</html>
