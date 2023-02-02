/* 
Task  3
If every value will be unique
*/

--Task 4a
SELECT * 
FROM Production.UnitMeasure

SELECT * 
FROM Production.UnitMeasure
WHERE UnitMeasureCode like 't%'

SELECT count (distinct UnitMeasureCode) as cnt 
FROM Production.UnitMeasure

INSERT INTO Production.UnitMeasure (UnitMeasureCode, Name, ModifiedDate)
VALUES ('TT1', 'Test 1', '2020-09-09'), ('TT2', 'Test 2', getdate ())

SELECT * 
FROM Production.UnitMeasure
WHERE UnitMeasureCode like 't%'

--Task 4b
SELECT UnitMeasureCode, Name, ModifiedDate
INTO Production.UnitMeasureTest
FROM Production.UnitMeasure
WHERE UnitMeasureCode like 't%'

INSERT INTO Production.UnitMeasureTest (UnitMeasureCode, Name, ModifiedDate)
SELECT UnitMeasureCode, Name, ModifiedDate
FROM Production.UnitMeasure
WHERE UnitMeasureCode='can'

SELECT * 
FROM Production.UnitMeasureTest
ORDER BY UnitMeasureCode

--Task 3c
UPDATE Production.UnitMeasureTest
SET UnitMeasureCode='TTT'

--Task 4d
DELETE
FROM Production.UnitMeasureTest

--Task 4e
SELECT SalesOrderID, max (LineTotal) over (partition by SalesOrderID) as max, 
	min (LineTotal) over (partition by SalesOrderID) as min, 
	avg (LineTotal) over (partition by SalesOrderID) as avg
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43659, 43664)

--Task 4f
SELECT FirstName, LastName, SalesYTD, dense_rank () over (order by SalesYTD desc) as rating, 
concat (upper (substring (FirstName, 1, 3)), 'login', isnull (TerritoryGroup, ' ')) as login
FROM Sales.vSalesPerson

SELECT FirstName, LastName, SalesLastYear, dense_rank () over (order by SalesLastYear desc) as rating, 
concat (upper (substring (FirstName, 1, 3)), 'login', isnull (TerritoryGroup, ' ')) as login
FROM Sales.vSalesPerson
-- YTD leader - Linda Mitchell, last year lider - Ranjit Varkey Chudukatil

--Task 4g
SELECT 
CASE 
WHEN datename (weekday, dateadd (month, datediff (month, 0, getdate ()), 0)) = 'Saturday'
THEN dateadd (month, datediff (month, 0, getdate()), 0) + 2
WHEN datename (weekday, dateadd (month, datediff (month, 0, getdate ()), 0)) = 'Sunday'
THEN dateadd (month, datediff (month, 0, getdate()), 0) + 1
ELSE dateadd (month, datediff (month, 0, getdate()), 0)
END

/*
Task 5
count (1) - 4
count (name) - 2
count (id) - 4
count (*) - 4
*/