<?php

session_start();

if (isset($_SESSION['admin'])) {
header ("Location: index.php");
}

if ($_POST['password']) {
  include 'password_file.php';
  if ($_POST['password'] == $password) {
  $_SESSION['admin'] = 'true';
header ("Location: index.php");

}else{

header ("Location: login.php?message=failed_Login");
}

}else{
?>

<center>
<h1>Login to sarGraphs</h1>

<?php echo $_GET['message']; ?>
<form action="login.php" method="POST">
<input type="password" name="password" />
<input type="submit" value="Submit" />
</form>
</center>
<?php
}
?>
