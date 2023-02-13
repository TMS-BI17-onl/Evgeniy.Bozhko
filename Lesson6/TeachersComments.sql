Well done!

-2 
In your solution to change values we need ro recreate a precodeure every time. It's not the best way.
Correct solution would be to have input parameters:
CREATE PROCEDURE uspUpdateBEID (@BusinessEntityID int, @NationalIDNumber nvarchar(15))
AS
BEGIN
	UPDATE HumanResources.Employee
	SET NationalIDNumber=@NationalIDNumber
	WHERE BusinessEntityID=@BusinessEntityID
END

EXEC uspUpdateBEID @BusinessEntityID=15, @NationalIDNumber='879341111'

SELECT *
FROM HumanResources.Employee
WHERE BusinessEntityID=15


Mark: 8
