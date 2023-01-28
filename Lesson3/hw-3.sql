--Task 2a
SELECT Name,
CASE 
	WHEN StandardCost=0 THEN 'Not for sale'
	WHEN StandardCost>0 AND StandardCost<100 THEN '<$100'
	WHEN StandardCost>=100 AND StandardCost<500 THEN '<$500'
	ELSE '>=500'
END AS PriceRange
FROM Production.Product

--Task 2b
SELECT Purchasing.Vendor.BusinessEntityID, Purchasing.Vendor.Name, Purchasing.ProductVendor.ProductID, Purchasing.ProductVendor.StandardPrice 
FROM Purchasing.Vendor
INNER JOIN Purchasing.ProductVendor ON Purchasing.Vendor.BusinessEntityID=Purchasing.ProductVendor.BusinessEntityID
WHERE Purchasing.ProductVendor.StandardPrice>10
	AND Purchasing.Vendor.Name LIKE '%x%'
	OR Purchasing.Vendor.Name LIKE 'n%'

--Task 2c
SELECT Purchasing.Vendor.BusinessEntityID, Purchasing.Vendor.Name 
FROM Purchasing.Vendor
LEFT JOIN Purchasing.ProductVendor ON Purchasing.Vendor.BusinessEntityID=Purchasing.ProductVendor.BusinessEntityID
WHERE Purchasing.ProductVendor.BusinessEntityID IS NULL

--Task 3a
SELECT Production.Product.Name, Production.Product.StandardCost, Production.ProductModel.Name
FROM Production.Product
INNER JOIN Production.ProductModel ON Production.Product.ProductModelID=Production.ProductModel.ProductModelID
WHERE Production.ProductModel.Name LIKE 'll%' 

--Task 3b
SELECT Name
FROM Purchasing.Vendor
UNION
SELECT Name
FROM Sales.Store
ORDER BY Name

--Task 3c
SELECT Production.Product.Name, count(1) AS Count 
FROM Production.Product
INNER JOIN Sales.SpecialOfferProduct ON Production.Product.ProductID=Sales.SpecialOfferProduct.ProductID
GROUP BY Production.Product.Name
HAVING count(1)>1