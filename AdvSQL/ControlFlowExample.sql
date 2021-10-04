-- -----------------------------------------------------------------
-- File name: 	ControlFlowExample.sql
-- Author: 		Chadd Williams
-- Date: 		11/6/2019
-- Class: 		CS445
-- Assignment:	Class Example, If / Case
-- -----------------------------------------------------------------


SELECT StudentID, CourseID, 
  IF( Grade > 72, "Passing", "Failing") as Status
FROM  CurrentlyEnrolled;

INSERT INTO People (Login) VALUES ("horse");

SELECT PersonID, login, IFNULL(FName, "NONAME"), IFNULL(LName, "NONAME")
FROM  People;

SELECT StudentID, CourseID, 
  Case Grade WHEN 100 THEN 'Wow' WHEN 98 THEN 'Almost' ELSE 'OTHER' END
FROM  CurrentlyEnrolled;

SELECT StudentID, CourseID, 
  Case Grade WHEN 100 THEN 'Wow' WHEN 98 THEN 'Almost' END
FROM  CurrentlyEnrolled;

