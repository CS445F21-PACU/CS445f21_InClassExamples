-- chadd williams


show tables;

show create table People;


SELECT *
FROM People;

SELECT login 
FROM People 
WHERE PersonID > 5;

SELECT login, PersonID 
FROM People 
WHERE LName = "Ryan";

SELECT login, PersonID 
FROM People 			-- list of tables
WHERE FName like "C%";  -- % is a wildcard

SELECT login, PersonID 
FROM People 			-- list of tables
WHERE FName like "c%";  -- % is a wildcard

SELECT * 
FROM People;

SELECT * 
FROM CurrentlyTeaching;

DELETE FROM People WHERE PersonID = 1;

SELECT *
FROM People;

SELECT *
FROM CurrentlyTeaching;

DROP TABLE People;

DELETE FROM People;

SELECT * 
FROM Professors ;

SELECT *
FROM CurrentlyEnrolled;


SELECT * 
FROM Courses 
ORDER BY MaxSize ASC;

SELECT *
FROM People 
ORDER BY LName , FName ;

SELECT LName, count(*)
FROM People
GROUP BY LName;

SELECT AVG(Grade), CourseID
FROM CurrentlyEnrolled 
Group By CourseID;
