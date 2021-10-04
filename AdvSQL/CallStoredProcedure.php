<?php
  // Author: 			Chadd Williams
  // File: 				queryFunction.php
  // Date:				March 18, 2013
  // Class:				CS 445	
  // Project: 		In Class PDO Examples
  // Description: demonstrate a function to run an SQL query and return
  // 							the results as an array

  require_once "connDB_local.php";
	require_once "basicErrorHandling.php";
  
	$dbh = db_connect();
	$sth = $dbh -> prepare("Call AddTo250(:param)");
	$sth->bindValue(":param",5);
		
	// run the query
	$sth -> execute();

	$sth = $dbh -> prepare("Call QueryCurrentlyEnrolled(:param)");
	$sth->bindValue(":param",5);
		
	// run the query
	$sth -> execute();
		
	while ($row = $sth -> fetch())
	{
		print $row['CourseID'] . ' ' . $row['StudentID'] . 
		' ' . $row['Grade'];
	}
	// https://phpdelusions.net/pdo#call
	$sth->nextRowSet();

	$sth2 = $dbh -> prepare("Select * from CurrentlyEnrolled where 
	StudentID=:param");
	$sth2->bindValue(":param",5);
		
	// run the query
	$sth2 -> execute();
		
	while ($row = $sth2 -> fetch())
	{
		print $row['CourseID'] . ' ' . $row['StudentID'] . ' ' 
		. $row['Grade'];
	}

	$sth = $dbh -> prepare("select QueryTotalClassesEnrolledBy(:param)");
	$sth->bindValue(":param",11);
		
	// run the query
	$sth -> execute();
		
	$row = $sth -> fetch();
	
	print 'function: '. $row[0];
		
	db_close($dbh);

?>
