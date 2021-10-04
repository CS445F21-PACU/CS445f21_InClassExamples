-- -----------------------------------------------------------------
-- File name: 	IndexStorageExample.sql
-- Author: 		Chadd Williams
-- Date: 		10/26/2017
-- Class: 		CS445
-- Assignment:	Class Example, Index & Storage Engines
-- Purpose: 	Create a small database; inspect how queries are 
--				solved. -- print in 10 pt
-- -----------------------------------------------------------------

Drop table if exists Prof_Ex;
Drop table if exists JobStatus;
Drop table if exists OneRow;

Create table OneRow
(
	OneRowID int AUTO_INCREMENT not null,
	OneRowName varchar(25),
	Constraint OneRow_PK Primary Key(OneRowID)
) Engine = InnoDB;

INSERT INTO OneRow (OneRowName)	Values ("Databases");

Create table JobStatus
(
	StatusID int AUTO_INCREMENT not null, 
	JobName varchar(25),
	PayBonus int not null default 0,
	Tenure boolean default FALSE,
	CONSTRAINT JobStatus_PK Primary key(StatusID)
) Engine = InnoDB;

Create table Prof_Ex
(
	ProfID int not null AUTO_INCREMENT,
	FName varchar(25),
	LName varchar(50),
	StatusID int not null,
	StartDate date,
	CONSTRAINT Prof_Ex_PK Primary key(ProfID),
	 Index Prof_EX_StartDate_IDX (StartDate),
	CONSTRAINT Prof_Ex_StatusID_FK FOREIGN key (StatusID) 
		References JobStatus(StatusID)
) Engine=InnoDB;

SHOW INDEX From Prof_Ex;

SHOW INDEX From People;

SHOW INDEX From CurrentlyEnrolled;

INSERT INTO JobStatus (JobName, PayBonus, Tenure) 
	Values ("Professor", 10000, TRUE);
INSERT INTO JobStatus (JobName, PayBonus, Tenure) 
	Values ("Associate", 1000, TRUE);
INSERT INTO JobStatus (JobName, PayBonus, Tenure) 
	Values ("Assistant", 0, FALSE);

INSERT INTO Prof_Ex(FName, LName, StatusID, StartDate) 
	Values ("D","R", 3, "1990-08-01");
INSERT INTO Prof_Ex(FName, LName, StatusID, StartDate) 
	Values ("S","K", 3, "2002-08-01");
INSERT INTO Prof_Ex(FName, LName, StatusID, StartDate) 
	Values ("C","W", 2, "2006-08-01");
INSERT INTO Prof_Ex(FName, LName, StatusID, StartDate) 
	Values ("C","L", 2, "1999-08-01");


explain select * from OneRow; -- ALL

explain select OneRowID from OneRow; -- index

explain select * from OneRow where OneRowID=1; -- const
	
explain select * from Prof_Ex where ProfID=1;  -- const

explain select * from Prof_Ex where StatusID=3; -- ref

explain select * from JobStatus Where PayBonus > 100; -- ALL

explain select * from Prof_Ex 
	where StartDate > "2001-01-01"; -- range

explain select * from Prof_Ex, JobStatus 
	where Prof_Ex.StatusID=JobStatus.StatusID;  -- ALL, ALL
-- https://mariadb.com/kb/en/library/block-based-join-algorithms/
	
explain select ProfID from Prof_Ex; -- index (covering index)

explain select ProfID from Prof_Ex, JobStatus 
	where Prof_Ex.StatusID=JobStatus.StatusID; -- index, ref
	
explain select ProfID, Prof_Ex.LName, JobStatus.JobName 
from Prof_Ex, JobStatus 
	where Prof_Ex.StatusID=JobStatus.StatusID; -- ALL, ALL
	
explain select Prof_Ex.*, JobStatus.JobName from Prof_Ex, JobStatus 
	where StartDate > "2001-01-01" 
	and Prof_Ex.StatusID = JobStatus.StatusID; -- range, All  (flat BNL Join)
	
explain select * 
from People, CurrentlyTeaching, Courses
where People.PersonID = CurrentlyTeaching.ProfID AND
Courses.CourseID = CurrentlyTeaching.CourseID; -- index, eq_ref, ALL (flat BNL Join)

explain 
select CurrentlyTeaching.CourseID, 
CurrentlyEnrolled.StudentID, T.PersonID
-- select * 
from People as T, CurrentlyTeaching, CurrentlyEnrolled, People as S
where T.PersonID = CurrentlyTeaching.ProfID AND
CurrentlyTeaching.CourseID=CurrentlyEnrolled.CourseID AND
S.PersonID = CurrentlyEnrolled.StudentID; -- index, ref, eq_ref, eq_ref

explain 
select *
From CurrentlyEnrolled
where CourseID=1; -- ref


explain 
select *
From CurrentlyEnrolled
where StudentID=1; -- ref

-- alter table CurrentlyEnrolled 
-- 	drop index CurrentlyEnrolled_StudentID_IDX;

explain 
select * 
from People
where Login like '%a%'; -- ALL

explain 
select * 
from People
where Login like 'c%'; -- range

explain 
select * 
from People
where Login like 'chadd';  -- range

explain 
select * 
from People
where Login = 'chadd'; -- const

