--Task 2
SELECT CONCAT (t1.LastName, ' ', t1.FirstName, ' ', t1.ParentName) AS 'װָ־', 
CONCAT (t2.LastName, ' ', t2.FirstName, ' ', t2.ParentName) AS 'װָ־ ־עצא' 
FROM People t1 JOIN People t2 ON t1.ID_Father=t2.ID
WHERE t1.FirstName='ִלטענטי'