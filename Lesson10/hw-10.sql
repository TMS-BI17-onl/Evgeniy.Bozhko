--Task 3
SELECT Year, January, February, December
FROM
(SELECT YEAR (DueDate) AS Year, DATENAME (MONTH, DueDate) AS Month, OrderQty
FROM Production.WorkOrder) AS SourceTable
PIVOT
(SUM (OrderQty) FOR Month IN (January, February, December)) AS PivotTable
ORDER BY Year