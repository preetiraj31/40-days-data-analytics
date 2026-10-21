CREATE DATABASE Popularity;

CREATE TABLE baby_names (
Gender VARCHAR(10),
Name VARCHAR(50),
Total INT
);

INSERT INTO baby_names (Gender, Name, Total) VALUES
('Girl', 'Ava', 95),
('Girl', 'Emma', 106),
('Boy', 'Ethan', 115),
('Girl', 'Isabella', 100),
('Boy', 'Jacob', 101),
('Boy', 'Liam', 84),
('Boy', 'Logan', 73),
('Boy', 'Noah', 120),
('Girl', 'Olivia', 100),
('Girl', 'Sophia', 88);

SELECT * FROM baby_names;

SELECT Gender,Name,Total,
ROW_NUMBER() OVER(ORDER BY Total DESC) AS Popularity
FROM baby_names;

SELECT Gender,Name ,Total,
ROW_NUMBER() OVER(ORDER BY Total DESC) AS Popularity,
RANK() OVER(ORDER BY Total DESC) AS Popularity_R,
DENSE_RANK() OVER(ORDER BY Total DESC) AS Popularity_DR
FROM baby_names;


SELECT Gender, Name, Total,
ROW_NUMBER() OVER(PARTITION BY Gender ORDER BY Total DESC) AS popularity
FROM baby_names;

-- what are the top 3 most popular name for the gender 

SELECT * FROM
(SELECT Gender, Name,Total,
ROW_NUMBER() OVER(PARTITION BY Gender ORDER BY Total DESC) AS popularity
FROM baby_names) AS Pop
WHERE Popularity <=3;

-- Write 10 queries with window function
CREATE TABLE EmployeeSales (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    City VARCHAR(50),
    TotalSales INT
);

INSERT INTO EmployeeSales
    (EmployeeID, EmployeeName, Department, City, TotalSales)
VALUES
    (101, 'Aman',   'IT',    'Delhi',  50000),
    (102, 'Priya',  'IT',    'Delhi',  70000),
    (103, 'Rahul',  'HR',    'Mumbai', 40000),
    (104, 'Neha',   'HR',    'Mumbai', 60000),
    (105, 'Simran', 'IT',    'Mumbai', 70000),
    (106, 'Karan',  'Sales', 'Delhi',  30000),
    (107, 'Anjali', 'Sales', 'Mumbai', 50000),
    (108, 'Rohit',  'HR',    'Delhi',  40000),
    (109, 'Meena',  'Sales', 'Delhi',  60000),
    (110, 'Arjun',  'IT',    'Delhi',  50000);


    SELECT *
    FROM EmployeeSales;

    --Display every employee with their name, department, and sales. Assign a unique row number based on TotalSales from highest to lowest.
    SELECT Employeename, Department,TotalSales,
    ROW_NUMBER() OVER(ORDER BY TotalSales DESC) AS employee
    FROM EmployeeSales;

    --Assign a row number to employees separately within each department, ordering by TotalSales from highest to lowest.

    SELECT Department,
    ROW_NUMBER() OVER(PARTITION BY Department ORDER BY TotalSales DESC) AS employee1
    FROM EmployeeSales;

    --Rank all employees by TotalSales from highest to lowest using DENSE_RANK(). Employees with equal sales should have the same rank.
    SELECT TotalSales,
    DENSE_RANK() OVER(ORDER BY TotalSales DESC) AS employee_DR
    FROM EmployeeSales;

    --Rank employees within each department based on TotalSales. Equal sales within a department must receive the same rank.
    SELECT TotalSales,
    DENSE_RANK() OVER(PARTITION BY Department ORDER BY TotalSales DESC) AS employee_DR
    FROM EmployeeSales;

    --Assign row numbers separately within each city, ordering employees by TotalSales from lowest to highest.
    SELECT City,
    ROW_NUMBER() OVER(PARTITION BY Department ORDER BY TotalSales ASC) AS employee
    FROM EmployeeSales;

    --write a query to rank all employees based on their TotalSales, from highest to lowest.
    SELECT EmployeeName, Department, TotalSales,
    RANK() OVER(ORDER BY TotalSales DESC) AS SalesRank
    FROM EmployeeSales;

   -- write a query to rank employees within their own department, from highest to lowest sales.

   SELECT TotalSales, Department, TotalSales,
   RANK() OVER( PARTITION BY Department ORDER BY TotalSales DESC) AS sales
   FROM EmployeeSales;

   --write a SQL query to assign a row number to each employee within their department, based on TotalSales from highest to lowest.

   SELECT TotalSales, Department, TotalSales,
   ROW_NUMBER() OVER( PARTITION BY Department ORDER BY TotalSales DESC) AS RowNum
   FROM EmployeeSales;

  --Find the Second-Highest-Selling Employee in Each Department
SELECT EmployeeName, Department, TotalSales, RowNum
FROM (
    SELECT
        EmployeeName,
        Department,
        TotalSales,
        ROW_NUMBER() OVER
        (PARTITION BY Department
            ORDER BY TotalSales DESC
        ) AS RowNum
    FROM EmployeeSales
) AS RankedEmployees
WHERE RowNum = 2;

