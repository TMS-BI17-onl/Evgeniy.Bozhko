--Task 1a
SELECT *
FROM Sales.SalesTerritory

--Task 1b
SELECT TerritoryID, Name
FROM Sales.SalesTerritory

--Task 1c
SELECT *
FROM Person.Person
WHERE LastName = 'Norman' 

--Task 1d
SELECT *
FROM Person.Person
WHERE EmailPromotion != 2

--Task 3

--Example 1
SELECT stdev(SalesYTD) as StandardDeviation
FROM Sales.SalesTerritory

--Example 2
SELECT var(distinct TaxRate) as DistinctVariance
FROM Sales.SalesTaxRate

--Task 4a
SELECT count(distinct PersonType) as UniquePersonType
FROM Person.Person
WHERE LastName like 'm%'
	OR EmailPromotion !=1

--Task 4b
SELECT top 3 *
FROM Sales.SpecialOffer
WHERE StartDate between '2013-01-01' and '2014-01-01'
ORDER BY DiscountPct desc

--Task 4c
SELECT min(Weight) as MinimalWeight, max(Size) as MaximumSize
FROM Production.Product

--Task 4d
SELECT ProductSubcategoryID, min(Weight) as MinimalWeight, max(Size) as MaximumSize
FROM Production.Product
GROUP BY ProductSubcategoryID

--Task 4e
SELECT ProductSubcategoryID, min(Weight) as MinimalWeight, max(Size) as MaximumSize
FROM Production.Product
WHERE Color is not NULL 
GROUP BY ProductSubcategoryID