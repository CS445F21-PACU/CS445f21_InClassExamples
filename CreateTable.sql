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