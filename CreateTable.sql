create table Employee
(
	EmpID int(11) NOT NULL AUTO_INCREMENT,
	FName varchar(50) DEFAULT NULL,
	LName varchar(50) DEFAULT NULL,
	DateOfBirth date NOT NULL,
	Email varchar(200) DEFAULT NULL,
	CONSTRAINT Employee_PK PRIMARY KEY (EmpID),
	CONSTRAINT Employee_Email_U UNIQUE(Email)
) Engine = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin;

INSERT INTO Employee (EmpID, FName, LName, DateOfBirth, Email)
VALUES
(NULL, 'bob', 'smith', '2000-02-06', 'bob@smith');

INSERT INTO Employee (FName, LName, DateOfBirth, Email)
VALUES
('sally', 'smith', '2001-02-06', 'sally2@smith');


create table Dept
(
	DID int(11) NOT NULL AUTO_INCREMENT,
	Name varchar(25) DEFAULT NULL,
	CONSTRAINT Dept_PK PRIMARY KEY (DID)
)
Engine = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin;

INSERT INTO Dept (DID, Name) VALUES (NULL, 'Coding');
INSERT INTO Dept (DID) VALUES (NULL);

CREATE TABLE WorksIn
(
	EmpID int(11) NOT NULL,
	DID int(11) NOT NULL,
	CONSTRAINT WorksIn_PK PRIMARY KEY (EmpID, DID),
	CONSTRAINT WorksIn_DID_FK FOREIGN KEY (DID) REFERENCES Dept(DID),
	CONSTRAINT WorksIn_EmpID_FK FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
)Engine = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin;
	
INSERT INTO WorksIn (EmpID, DID) VALUES (1, 1); 
INSERT INTO WorksIn (EmpID, DID) VALUES (3, 2);  -- produce error, missing EmpID 
	
	
	
	
	
	