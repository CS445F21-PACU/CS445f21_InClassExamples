-- -----------------------------------------------------------------
-- File name: 	InsertPics.sql
-- Author: 		Chadd Williams
-- Date: 		10/26/2017
-- Class: 		CS445
-- Assignment:	Class Example, Build a picture table and insert a file
-- -----------------------------------------------------------------

drop table if exists pictures;

CREATE TABLE pictures (
  PicID int(11) NOT NULL AUTO_INCREMENT,
	image mediumblob NOT NULL,
	type varchar(255) NOT NULL,
  PRIMARY KEY  (`PicID`)) ENGINE=InnoDB;
  
INSERT INTO pictures (image, type) VALUES 
  (LOAD_FILE('/tmp/g0/cs445.png'), "mime/png");
