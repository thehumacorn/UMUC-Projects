<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- Index.php -->
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

?>
<!-- Website Code below -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
      
    <title>
      Through The Lens Website
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
          <a href="Logout.php" tite="Logout">Logout. 
              <?php
                                        }
                                        ?></a>
          <h1>
            Welcome to Through The Lens Marketplace
          </h1>
          <p>
            Photographs for Sale
          </p>
          <table border="1">
            <tr>
              <td>
                Menu
              </td>
            </tr>
            <tr>
              <td>
                <a href="OrderForm.php">Order Form</a>
              </td>
            </tr>
            <tr>
              <!-- Add Table of Hyperlinks -->
            </tr>
            <tr>
              <td>
                Photograph
              </td>
              <td>
                Details
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%201.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img1.php">Image 1 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%202.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img2.php">Image 2 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%203.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img3.php">Image 3 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%204.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img4.php">Image 4 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%205.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img5.php">Image 5 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%206.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img6.php">Image 6 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%207.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img7.php">Image 7 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%208.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img8.php">Image 8 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%209.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img9.php">Image 9 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%2010.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img10.php">Image 10 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%2011.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img11.php">Image 11 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%2012.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img12.php">Image 12 Details</a>
              </td>
            </tr>
            <tr>
              <td>
                <img src="Image%2013.jpg" width="150" height=
                "300" />
              </td>
              <td>
                <a href="Img13.php">Image 13 Details</a>
              </td>
            </tr>
          </table>
          <p>
            Click the Link below to purchase desired
            Photographs<br />
          </p>
          <p>
            <a href="OrderForm.php">Through the Lens Photograph
            Order Form</a>
          </p>
          <table>
            <tr>
              <td></td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>
