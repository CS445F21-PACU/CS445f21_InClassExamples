-- ---------------------------------------------------------------------------
-- File: 	boldLineTriggerExample.sql
-- Author:	Chadd Williams
-- Date: 	11/17/2017
-- Class:	CS445
-- Purpose:	Demonstrate Trigger
-- ---------------------------------------------------------------------------

drop table if exists Wrote;
drop table if exists Authors;
drop table if exists Books;

CREATE TABLE Authors (
	AuthorID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	FName VARCHAR(20),
	LName VARCHAR(20)
) Engine = InnoDB;

CREATE TABLE Books (
	BookID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Title CHAR(200)
) Engine = InnoDB;

CREATE TABLE Wrote (
	BookID INT NOT NULL,
	AuthorID INT NOT NULL,
	
	CONSTRAINT Wrote_BookIDAuthorID_PK PRIMARY KEY 
		(BookID, AuthorID),

	CONSTRAINT Wrote_BookID_FK FOREIGN KEY (BookID) 
		REFERENCES Books(BookID) ON DELETE CASCADE,

	CONSTRAINT Wrote_AuthorID_FK FOREIGN KEY (AuthorID) 
		REFERENCES Authors(AuthorID) ON DELETE CASCADE
		
) Engine = InnoDB;

INSERT INTO Authors (FName, LName) VALUES ('Raghu', 'Ramakrishnan');

INSERT INTO Books (Title) VALUES ('Database Management Systems');

INSERT INTO Wrote (BookID, AuthorID) VALUES (1, 1);

Create Trigger BoldLine BEFORE DELETE ON  Wrote
For each row
Begin
  	declare BooksRowCount INTEGER;
	declare WroterowCount INTEGER;

	SELECT COUNT(*) FROM Books WHERE
		BookID=OLD.BookID into BooksRowCount;

	SELECT Count(*) from Wrote Where 		
		Wrote.BookID=OLD.BookID into WroteRowCount;
		
	If BooksRowCount > 0 and WroteRowCount = 1 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Bold Line';
	END IF;
END; 

 show triggers;
 delete from Wrote where BookID=1;

 delete from Books where BookID=1;

 select * from Authors;

 select * from Wrote;

 select * from Books;
 

 -- drop and rebuild tables.

drop trigger if exists BoldLine_Books;
Create Trigger BoldLine_Books BEFORE DELETE ON  Books
For each row
Begin
  	declare BooksRowCount INTEGER;
	declare WroterowCount INTEGER;

	SELECT COUNT(*) FROM Books WHERE
		BookID=OLD.BookID into BooksRowCount;

	SELECT Count(*) from Wrote Where 		
		Wrote.BookID=OLD.BookID into WroteRowCount;
		
	If BooksRowCount > 0 and WroteRowCount = 1 THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Bold Line - books';
	END IF;
END;  -- check with on delete cascade

INSERT INTO Authors (FName, LName) VALUES ('Raghu', 'Ramakrishnan');

INSERT INTO Books (Title) VALUES ('Database Management Systems');

INSERT INTO Wrote (BookID, AuthorID) VALUES (1, 1);

delete from Wrote where BookID=1;

delete from Books where BookID=1;

select * from Authors;

select * from Wrote;

select * from Books;
