--Task 3
CREATE PROCEDURE HumanResources.uspUpdateID 
AS
DECLARE @NN_ID NVARCHAR (100) = '879341111', @BE_ID INT = 15
UPDATE HumanResources.Employee  
SET NationalIDNumber=@NN_ID
WHERE BusinessEntityID=@BE_ID

EXEC HumanResources.uspUpdateID