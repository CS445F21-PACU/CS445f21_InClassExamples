-- -----------------------------------------------------------------
-- File name: 	UnionExample.sql
-- Author: 		Chadd Williams
-- Date: 		10/26/2017
-- Class: 		CS445
-- Assignment:	Class Example, Unions
-- -----------------------------------------------------------------

select Students.StudentID
from Students, CurrentlyEnrolled
where 
Students.StudentID = CurrentlyEnrolled.StudentID
and CourseID=3
UNION ALL 
select Students.StudentID
from Students, CurrentlyEnrolled
where 
Students.StudentID = CurrentlyEnrolled.StudentID
and CourseID=4
UNION ALL
select Students.StudentID
from Students, CurrentlyEnrolled
where 
Students.StudentID = CurrentlyEnrolled.StudentID
and CourseID=5
order by StudentID;
