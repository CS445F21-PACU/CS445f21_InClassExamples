-- chadd williams
-- indexes

SHOW CREATE TABLE People;

SHOW CREATE TABLE CurrentlyTeaching ;

EXPLAIN SELECT * 
FROM People, CurrentlyTeaching
WHERE PersonID=ProfID 
AND FName like '%a%';
