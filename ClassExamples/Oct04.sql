-- chadd williams

SELECT *
FROM Professors LEFT JOIN CurrentlyTeaching 
ON (Professors.ProfID = CurrentlyTeaching.ProfID)
WHERE CourseID is NULL;

SELECT *
FROM Professors, CurrentlyTeaching 
WHERE (Professors.ProfID = CurrentlyTeaching.ProfID);

-- find all the course people are IN
-- exclude bart

Select People.FName, People.LName, Students.*, CurrentlyEnrolled.CourseID
FROM Students, CurrentlyEnrolled, People
WHERE 
PersonID = Students.StudentID AND
Students.StudentID = CurrentlyEnrolled.StudentID AND
(LName != 'Simpson' OR FName !='Bart');


-- find bart's courses
SELECT *
FROM CurrentlyEnrolled as BSClass 
WHERE BSClass.StudentID  = 5; 



Select People.FName, People.LName, Students.*, CurrentlyEnrolled.CourseID
FROM Students, CurrentlyEnrolled, People
WHERE 
PersonID = Students.StudentID AND
Students.StudentID = CurrentlyEnrolled.StudentID AND
(LName != 'Simpson' OR FName !='Bart') AND 
EXISTS (
SELECT *
FROM CurrentlyEnrolled as BSClass 
WHERE BSClass.StudentID  = 5
AND BSClass.CourseID = CurrentlyEnrolled.CourseID
)
;

Select People.FName, People.LName, Students.*, CurrentlyEnrolled.CourseID
FROM Students, CurrentlyEnrolled, People
WHERE 
PersonID = Students.StudentID AND
Students.StudentID = CurrentlyEnrolled.StudentID AND
(LName != 'Simpson' OR FName !='Bart') AND 
CurrentlyEnrolled.CourseID IN (
SELECT BSClass.CourseID
FROM CurrentlyEnrolled as BSClass 
WHERE BSClass.StudentID  = 5
)
;


SELECT CourseID, MAX(Grade)
FROM CurrentlyEnrolled
GROUP BY CourseID;

Select People.FName, People.LName, Students.*, CurrentlyEnrolled.CourseID, Grade
FROM Students, CurrentlyEnrolled, People
WHERE 
PersonID = Students.StudentID AND
Students.StudentID = CurrentlyEnrolled.StudentID AND
Grade IN 
(SELECT MAX(CE.Grade)
FROM CurrentlyEnrolled as CE
 -- WHERE CE.CourseID = CurrentlyEnrolled.CourseID 
GROUP BY CE.CourseID 
);



