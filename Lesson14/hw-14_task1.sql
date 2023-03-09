--Task 1
CREATE VIEW vTopSellers
AS
SELECT TOP 50 WITH TIES FullName, SumofPoints, RANK () OVER (ORDER BY SumofPoints DESC) AS Place
FROM
(
SELECT FullName, SUM (Points) AS SumofPoints
FROM 
(
SELECT FullName, RentDate, Quantity, 
Points=CASE 
WHEN Quantity<5 THEN 1
WHEN Quantity>=5 AND  Quantity<10 THEN 2
WHEN Quantity>=10 THEN 3
END
FROM
(
SELECT FullName, RentDate, COUNT (o.EmployeeNumber) AS Quantity
FROM FctOrders o JOIN DimEmployees e ON o.EmployeeNumber=e.EmployeeNumber
GROUP BY FullName, RentDate
) q
) p
GROUP BY FullName
) s
ORDER BY Place