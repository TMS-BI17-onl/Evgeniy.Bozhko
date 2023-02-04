--Task 6
CREATE TABLE Patients
(
ID				INT IDENTITY(1,1),
FirstName		NVARCHAR(100), 
LastName		NVARCHAR(100), 
SSN				UNIQUEIDENTIFIER DEFAULT NEWID(),
Email			AS CONCAT(UPPER(LEFT(FirstName, 1)), LOWER(LEFT(LastName, 3)), '@mail.com'),
Temp			FLOAT,
CreatedDate		DATETIME DEFAULT GETDATE()
)

--Task 7
INSERT Patients(FirstName, LastName, Temp)  
VALUES  
('Ivan', 'Ivanov', 36.6),  
('Petr', 'Petrov', 37.7),
('Fedor', 'Fedorov', 38.8)

--To test getdate
INSERT Patients(FirstName, LastName, Temp)  
VALUES  
('Aleksey', 'Alekseev', 36.8),
('Sergey', 'Sergeev', 37),
('Matvey', 'Matveev', 37.9)

--Task 8
ALTER TABLE Patients
ADD TempType AS 
CASE 
WHEN Temp<37 THEN '<37°C'
WHEN Temp>37 THEN '>37°C'
ELSE '37°C' 
END

--Task 9
CREATE VIEW Patients_v AS
SELECT FirstName, LastName, CreatedDate, Temp*9/5+32 AS TempF
FROM Patients

--Task 10
CREATE FUNCTION TempF(@TempC FLOAT)
RETURNS FLOAT 
AS
BEGIN
RETURN @TempC*9/5+32
END

--To test function
SELECT dbo.TempF (37.7) AS TempF

--Task 11
DECLARE @firstdayofmonth DATETIME 
SET @firstdayofmonth=dateadd (month, datediff (month, 0, getdate()), 0)
SELECT 
CASE 
WHEN datename (weekday, @firstdayofmonth) = 'Saturday'
THEN @firstdayofmonth
WHEN datename (weekday, @firstdayofmonth) = 'Sunday'
THEN @firstdayofmonth + 1
ELSE @firstdayofmonth
END