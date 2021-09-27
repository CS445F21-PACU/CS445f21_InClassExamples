-- sept 27

SELECT LName
FROM People
ORDER BY LName;


SELECT LName, count(*)
FROM People
GROUP BY LName;

SELECT Grade, CourseID, StudentID 
FROM CurrentlyEnrolled 
ORDER BY CourseID;


SELECT MIN(Grade), MAX(Grade), AVG(Grade), CourseID
FROM CurrentlyEnrolled 
Group By CourseID;

SELECT MIN(Grade), MAX(Grade), AVG(Grade) as AvgGrade, CourseID
FROM CurrentlyEnrolled 
WHERE Grade > 60
Group By CourseID;


SELECT MIN(Grade), MAX(Grade), AVG(Grade) as AvgGrade, CourseID, count(*) as RowCount
FROM CurrentlyEnrolled 
Group By CourseID
HAVING AvgGrade > 80 and RowCount > 1;


SELECT MIN(Grade), MAX(Grade), AVG(Grade) as AvgGrade, CourseID, count(*) as RowCount
FROM CurrentlyEnrolled 
Group By CourseID
HAVING AvgGrade > 80 and RowCount > 1
ORDER BY AvgGrade DESC
LIMIT 2, 1;

SELECT ProfID, FName, LName
FROM Professors, People
WHERE 
PersonID = ProfID
;

SELECT * 
FROM Professors, People;

SELECT * 
FROM People LEFT JOIN Students ON (PersonID = StudentID)
;

SELECT CourseID
FROM CurrentlyTeaching, Professors p
WHERE Rank='Associate' and CurrentlyTeaching.ProfID = p.ProfID;





