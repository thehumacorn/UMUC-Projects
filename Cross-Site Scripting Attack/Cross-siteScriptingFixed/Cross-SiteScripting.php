<!-- Cross-SiteScripting.php -->
<!-- September 19, 2018 -->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cross-Site Scripting Example</title>
    </head>
    <body>
       
        Enter Comment in text box below<br> 
        <form method="GET" action="<?php echo ($_SERVER["PHP_SELF"]);?>">
        Comment Box: <textarea name="comment" rows="5" cols="40"><?php echo $comment;echo "<br>";
?></textarea><br>
<input type="submit" name="submit" value="Submit">
        </form>
        <p>Comment Input:</p>
          <?php
          $comment = "";
          echo "<br>";
          echo htmlspecialchars($_GET["comment"]);
          echo "<br>";
          ?>
    </body>
</html>
