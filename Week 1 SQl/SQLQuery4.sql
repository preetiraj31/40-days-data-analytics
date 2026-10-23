-- subquery 
--A query nested inside another query. It can live in SELECT, FROM, WHERE, or HAVING
--Types & examples
--a) Scalar subquery (returns one value)
SELECT  Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

--IN / EXISTS subquery
SELECT *
FROM Customers
WHERE CustomerID IN(
SELECT CustomerID FROM Orders WHERE Score > 1000
);
SELECT * FROM Customers;

-- Correlated subquery (references the outer query — runs per row)
SELECT e.FirstName, e.Salary
FROM Employees e
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employees e2
    WHERE e2.Department = e.Department   -- depends on outer row
);

--d) Derived table (subquery in FROM)
SELECT dept, avg_salary
FROM (
    SELECT Department AS dept, AVG(Salary) AS avg_salary
    FROM Employees
    GROUP BY Department
) AS dept_stats
WHERE avg_salary > 50000;

/*CTE — Common Table Expression
A named temporary result set defined with WITH, valid only for the single statement that follows it.*/

WITH HighValueCustomers AS (
    SELECT CustomerID, SUM(Sales) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
    HAVING SUM(Sales) > 10000
)
SELECT c.FirstName, h.TotalSpent
FROM HighValueCustomers h
JOIN Customers c ON c.CustomerID = h.CustomerID;

--Multiple chained CTEs
WITH OrderTotals AS (
    SELECT CustomerID, SUM(Sales) AS Total
    FROM Orders
    GROUP BY CustomerID
),
Ranked AS (
    SELECT CustomerID, Total,
           RANK() OVER (ORDER BY Total DESC) AS rnk
    FROM OrderTotals
)
SELECT * FROM Ranked WHERE rnk <= 10;
/*Where used:

Breaking a complex query into readable, named steps

Replacing deeply nested derived tables

Referencing the same intermediate result multiple times in one statement

Recursive hierarchies (see §4)

a CTE is not a physical table. SQL Server / PostgreSQL
usually inline it into the outer query (so it may re-execute each time it's referenced). It does not store rows or have indexes. 
Use MATERIALIZED (Postgres) or a temp table if you need that.*/


--Recursive CTE
WITH DateSeries AS (
    SELECT CAST('2024-01-01' AS DATE) AS d
    UNION ALL
    SELECT DATEADD(DAY, 1, d)
    FROM DateSeries
    WHERE d < '2024-01-31'
)
SELECT d FROM DateSeries;

/*Rule of thumb
Simple filter / one value → subquery.

Complex query split into named steps → CTE.

Same intermediate data reused across many statements, or large + needs indexes → temp table.

Hierarchy / tree / series → recursive CTE.*/

--3 refactored queries
--For each employee, show their salary, their department's average salary, and flag whether they earn above that average.
-- Subquery
SELECT e.FirstName,
       e.Department,
       e.Salary,
       d.DeptAvg,
       CASE WHEN e.Salary > d.DeptAvg THEN 'YES' ELSE 'NO' END AS AboveAvg
FROM Employees e
JOIN (
    SELECT Department, AVG(Salary) AS DeptAvg
    FROM Employees
    GROUP BY Department
) AS d
  ON d.Department= e.Department;



















































