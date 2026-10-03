
<?php
	//step 1: start the session, check if the user is not logged in, redirect to start
	session_start();	

	if (!isset($_SESSION['username'])){
		header("Location: index.php");
		exit();
	}
	$username=$_SESSION['username'];
	echo "<h2> Welcome ".$_SESSION['username']."! </h2>";
	
	// Step2. include the connectdb.php to connect to the database, the PDO object is called $db and run the query to get all the course information 
	require_once ('connectdb.php');  
	try {
		$query="SELECT  * FROM  course ";
		//run  the query
		$rows =  $db->query($query);
		
	//step 3: display the course list in a table 	
		if ( $rows && $rows->rowCount()> 0) {
		
		?>	
	<table cellspacing="0"  cellpadding="5" id="myTable" >
	  <tr><th align='left'><b>Course_id</b></th>   <th align='left'><b>Course_Name</b></th> <th align='left'><b>Course_NumofStudent</b></th ></tr>
		<?php
		// Fetch and  print all  the records.
			while  ($row =  $rows->fetch())	{
				echo  "<tr><td align='left'>" . $row['courseid'] . "</td>";
				echo  "<td align='left'>" . $row['coursename'] . "</td>";
				echo "<td align='left'>". $row['studentnum'] . "</td></tr>\n";
			}
			echo  '</table>';
		}
		else {
			echo  "<p>No  course in the list.</p>\n"; //no match found
		}
	}
	catch (PDOexception $ex){
		echo "Sorry, a database error occurred! <br>";
		echo "Error details: <em>". $ex->getMessage()."</em>";
	}

	//step 4: display the logout choice 	
?>	
   <p>Would like to log out? <a href="logout.php">Log out</a>  </p>

