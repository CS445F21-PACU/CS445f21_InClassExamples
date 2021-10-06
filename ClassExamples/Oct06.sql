-- chadd williams
-- views

CREATE VIEW  CS150_VW AS
SELECT LName, FName, Grade, StudentID
FROM Courses, CurrentlyEnrolled, People
WHERE 
Courses.CourseID = CurrentlyEnrolled.CourseID  AND
People.PersonID = CurrentlyEnrolled.StudentID  AND
Title like "CS150%";

SELECT *
FROM CS150_VW;

DELETE FROM People WHERE PersonID=5;
DELETE FROM Students WHERE StudentID=6;


CREATE VIEW CS150_GPAGRADECOMP AS
SELECT (Grade/100.0) / (GPA/4.0) AS GradeGPAComp, Students.StudentID, LName, FName
FROM CS150_VW, Students 
WHERE CS150_VW.StudentID  = Students.StudentID ;

SELECT *
FROM CS150_GPAGRADECOMP_TABLE;

CREATE TABLE CS150_GPAGRADECOMP_TABLE AS
SELECT (Grade/100.0) / ((GPA+.01)/4.0) AS GradeGPAComp, Students.StudentID, LName, FName
FROM CS150_VW, Students 
WHERE CS150_VW.StudentID  = Students.StudentID ;
