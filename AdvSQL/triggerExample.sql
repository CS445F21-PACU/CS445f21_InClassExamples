-- ---------------------------------------------------------------------------
-- File: 	triggerExample.sql
-- Author:	Chadd Williams
-- Date: 	11/17/2017
-- Class:	CS445
-- Purpose:	Demonstrate Trigger
-- 			This file is necessary so you can run the entire script at once.
--  		The Delimiter lines are necessary since ; is used in the trigger
-- 			The Delimiter lines are their own statements so this file contains
--          three statements that must be run together
-- ---------------------------------------------------------------------------

-- use with triggerFailure.php

-- https://mariadb.com/kb/en/library/trigger-overview/

drop table if exists users;

CREATE TABLE user (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name CHAR(20),
	last_name CHAR(20),
	email CHAR(100)
) Engine = InnoDB;



DELIMITER //
CREATE TRIGGER validateEmail
  BEFORE INSERT ON user
  FOR EACH ROW
BEGIN
  IF NEW.email NOT LIKE '_%@_%.__%' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email field is not valid';
  END IF;
END; 
DELIMITER ;


DELIMITER //
CREATE TRIGGER PromoteOnly
  BEFORE UPDATE ON Professors
  FOR EACH ROW
BEGIN
  IF NEW.Rank = 'Assistant' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Demotions to Assistant!';
  ELSEIF NEW.Rank = 'Associate' and OLD.Rank != 'Assistant' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Demotions to Associate!';
  END IF;
END; 
DELIMITER ;


UPDATE Professors SET Rank = 'Assistant' WHERE Rank ='Full';
UPDATE Professors SET Rank = 'Associate' WHERE Rank !='Assistant';



