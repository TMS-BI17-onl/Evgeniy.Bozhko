--Task 3
CREATE TABLE result_from_merge
(
Function_name VARCHAR (50),
Function_count INT
)

WITH Function_CTE
AS
(
SELECT Alex AS Function_name
FROM data_for_merge
UNION ALL
SELECT Carlos
FROM data_for_merge
UNION ALL
SELECT Charles
FROM data_for_merge
UNION ALL
SELECT Daniel
FROM data_for_merge
UNION ALL
SELECT Esteban
FROM data_for_merge
UNION ALL
SELECT Fred
FROM data_for_merge
UNION ALL
SELECT George
FROM data_for_merge
UNION ALL
SELECT Lando
FROM data_for_merge
UNION ALL
SELECT Lewis
FROM data_for_merge
)
MERGE result_from_merge AS Target
USING 
(
SELECT Function_name, COUNT (Function_name) AS Function_count
FROM Function_CTE
WHERE Function_name IS NOT NULL
GROUP BY Function_name
)
AS Source 
ON Target.Function_name=Source.Function_name
WHEN NOT MATCHED BY TARGET
THEN INSERT (Function_name, Function_count)
VALUES (Source.Function_name, Source.Function_count);