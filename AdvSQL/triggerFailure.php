<?php
  // Author: 			Chadd Williams
  // File: 				triggerFialure.php
  // Date:				Nov 6, 2019
  // Class:				CS 445	
  // Project: 		In Class PDO Examples
  // Description: demonstrate a failure in a trigger
	
  require_once "connDB_local.php";
	require_once "basicErrorHandling.php";
  
	$dbh = db_connect();
	$sth = $dbh -> prepare("insert into user (first_name, last_name, 
	email) VALUES ('John', 'Doe', 'john_doe.example.net')");
	

	try
	{
			 $sth ->execute( );
	}
	catch (PDOException $e)
	{
			 printf ("The statement failed.<br/>");
			 printf ("getCode: ". $e->getCode () . "<br/>");
			 printf ("getMessage: ". $e->getMessage () . "<br/>");
	}
	
	
	db_close($dbh);

?>
