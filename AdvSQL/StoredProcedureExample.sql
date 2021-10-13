-- ---------------------------------------------------------------------------
-- File: 	StoredProcedureExample.sql
-- Author:	Chadd Williams
-- Date: 	11/17/2017
-- Class:	CS445
-- Purpose:	Demonstrate Stored Procedures
-- ---------------------------------------------------------------------------

-- use with CallStoredProcedure.php

DROP PROCEDURE IF EXISTS AddTo250;
DELIMITER //
CREATE PROCEDURE
	AddTo250 (parameter_StudentID INTEGER)
	MODIFIES SQL DATA
	BEGIN
		DELETE FROM CurrentlyEnrolled where
			StudentID=parameter_StudentID and CourseID=1;
		INSERT IGNORE INTO CurrentlyEnrolled (CourseID, StudentID)  
			VALUES(2, parameter_StudentID);
	END ;
//
DELIMITER ;


DROP PROCEDURE IF EXISTS QueryCurrentlyEnrolled;
DELIMITER //
CREATE PROCEDURE
	QueryCurrentlyEnrolled (parameter_StudentID INTEGER)
	READS SQL DATA
	BEGIN
		select * from CurrentlyEnrolled Where StudentID=parameter_StudentID;
	END ;
//
DELIMITER ;

-- INSERT INTO CurrentlyEnrolled (CourseID, StudentID) VALUES (1, 5);

-- select * from CurrentlyEnrolled Where StudentID=5;
	
-- CALL AddTo250(5);

-- select * from CurrentlyEnrolled Where StudentID=5;

-- SHOW CREATE PROCEDURE AddTo250;

-- SHOW PROCEDURE STATUS;

--	$sth = $dbh -> prepare("Call AddTo250(:param)");
--	$sth->bindValue(":param",5);
		
--	// run the query
--	$sth -> execute();


DROP PROCEDURE IF EXISTS QueryCurrentlyEnrolled_OutParam;
DELIMITER //
CREATE PROCEDURE
	QueryCurrentlyEnrolled_OutParam (parameter_StudentID INTEGER, OUT results INTEGER)
	READS SQL DATA
	BEGIN
		select count(*) into results from CurrentlyEnrolled Where StudentID=parameter_StudentID;
	END ;
//
DELIMITER ;


DROP FUNCTION IF EXISTS QueryTotalClassesEnrolledBy;
DELIMITER //
CREATE FUNCTION
	QueryTotalClassesEnrolledBy(parameter_StudentID INTEGER)
	RETURNS INTEGER
	BEGIN
		declare results INTEGER;

		select count(*) into results
		from CurrentlyEnrolled
		WHERE StudentID=parameter_StudentID;
		
		return results;
	end ;
//
DELIMITER ;

select QueryTotalClassesEnrolledBy(11);


select * 
from CurrentlyEnrolled
where QueryTotalClassesEnrolledBy(StudentID) > 1;
