<?php
//if the form has been submitted
if (isset($_POST['submitted'])){
 #prepare the form input

  // connect to the database
  require_once('connectdb.php');
	
  $username=isset($_POST['username'])?$_POST['username']:false;
  $password=isset($_POST['password'])?password_hash($_POST['password'],PASSWORD_DEFAULT):false;
  
  if (!($username)){
	echo "Username wrong!";
    exit;
	}
  if (!($password)){
	exit("password wrong!");
	}
 try{
	
	#register user by inserting the user info 
	$stat=$db->prepare("insert into user values(default,?,?)");
	$stat->execute(array($username, $password));
	
	$id=$db->lastInsertId();
	echo "Congratulations! You are now registered. Your ID is: $id  ";  	
	
 }
 catch (PDOexception $ex){
	echo "Sorry, a database error occurred! <br>";
	echo "Error details: <em>". $ex->getMessage()."</em>";
 }

 
}
?>
<!DOCTYPE html>
<html>
<head>
  <title>Registration System </title>
</head>
<body>
  <h2>Register</h2>
  <form method = "post" action="register.php">
	Username: <input type="text" name="username" /><br>
	Password: <input type="password" name="password" /><br><br>

	<input type="submit" value="Register" /> 
	<input type="reset" value="clear"/>
	<input type="hidden" name="submitted" value="true"/>
  </form>  
  <p> Already a user? <a href="index.php">Log in</a>  </p>

</body>
</html>