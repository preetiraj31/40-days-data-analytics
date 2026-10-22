
-- Find the total sales Across all orders
USE SalesDB;

SELECT 
SUM(Sales) TotalSales
FROM Orders;

SELECT 
ProductID,
SUM(Sales) TotalSales
FROM Orders
GROUP BY ProductID;

-- find the total sales for each product
-- Additionally provide details such OrderID, oder date 
SELECT 
OrderID,
OrderDate,
ProductID,
SUM(Sales) TotalSales
FROM Orders
GROUP BY 
OrderID,
OrderDate,
ProductID;


SELECT 
ProductID,
SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
FROM Orders;
--find the total sales across all order
-- find the total sales for each product 
-- Additionally provide details such order ID ,order date 
SELECT 
OrderID,
OrderDate,
ProductID,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER (PARTITION BY ProductID) TotalSalesByProducts
FROM Orders;


SELECT 
OrderID,
OrderDate,
CustomerID,
COUNT(*) OVER() TotalOrders,
COUNT(*) OVER(PARTITION BY CustomerID) OrdersByCustomers
FROM Orders;

-- find the total number of customers
--Additionally provide all customers Details
SELECT 
*,
COUNT(*) OVER() TotalCustomers
FROM Customers;

-- check whether the table orders contains any duplicate rows

SELECT 
OrderID,
COUNT(*) OVER (PARTITION BY OrderID) CheckPK
FROM Orders;

SELECT
OrderID,
COUNT(*) OVER (PARTITION BY OrderID) CheckPK
FROM OrdersArchive;

-- find the total sales across all orders
--And the total sales for each products
--Additionally provide details such orderID ,order date

SELECT 
    OrderID,
    OrderDate,
    Sales,
    ProductID,
    SUM(Sales) OVER() TotalSales,
    SUM(Sales) OVER (PARTITION BY ProductID) SalesByProducts
    FROM Orders;

    -- find the percentage contribution of each products sales to the total sales
    SELECT 
    OrderID,
    ProductID,
    Sales,
    SUM(Sales) OVER () TotalSales,
   ROUND( CAST (Sales AS Float)/SUM(Sales) OVER()*100 ,2) percentageofTotal
    FROM Orders;

-- find the average sales across all order
-- And find the average sales for each product
SELECT
    OrderID,
    ProductID,
    Sales,
    AVG(Sales) OVER() AvgSales,
    AVG(Sales) OVER(PARTITION BY ProductID) AvgSalesByProducts
    FROM Orders;


    SELECT
    CustomerID,
    LastName,
    Score,
    COALESCE(Score, 0) CustomerScore,-- handle null value
    AVG(Score) OVER ()  AvgScore,
    AVG(COALESCE(Score,0)) OVER() AvgScoreWithoutNull
    FROM Customers;
-- find all orders where sales are higher than the average sales across all orders

SELECT
*
FROM(
SELECT
     OrderID,
     ProductID,
     Sales,
     AVG(Sales) OVER() AvgSales
     FROM Orders
     )t WHERE Sales > AvgSales;

--Calculate moving average of sales for each product over time
 --Running and Rolling Total

 SELECT 
 OrderID,
 ProductID,
 OrderDate,
 Sales,
 AVG(Sales) OVER(PARTITION BY ProductID) AvgByProduct,
 AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate) MovingAvg
 FROM Orders;

 -- 15 Practice Question 
 --1 For each customer, number their orders by OrderDate.
 SELECT CustomerID, OrderID, OrderDate,
       ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY OrderDate, OrderID) AS OrderSeq
FROM Orders;

--2 Rank employees by salary inside each department.
SELECT EmployeeID, Department, Salary,
       RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS RankInDept,
       DENSE_RANK() OVER(PARTITION BY Department ORDER BY Salary DESC) AS DenseRankInDept
FROM Employees;

--3 Show each order and the customer’s total sales

SELECT OrderID, CustomerID, Sales,
       SUM(Sales) OVER(PARTITION BY CustomerID) AS CustomerTotalSales
FROM Orders;

--4 Calculate a running total of Sales by order date.
SELECT OrderID, OrderDate, Sales,
       SUM(Sales) OVER(ORDER BY OrderDate, OrderID
                       ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM Orders;


--5 Calculate a 3-order moving average of Sales
SELECT OrderID, OrderDate, Sales,
       AVG(CAST(Sales AS DECIMAL(10,2))) OVER(ORDER BY OrderDate, OrderID
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvg3
FROM Orders;

-- 6 Show order count, average, min, and max sales per customer beside each order.
SELECT OrderID, CustomerID, Sales,
       COUNT(*) OVER(PARTITION BY CustomerID) AS OrderCount,
       AVG(CAST(Sales AS DECIMAL(10,2))) OVER(PARTITION BY CustomerID) AS AvgSales,
       MIN(Sales) OVER(PARTITION BY CustomerID) AS MinSales,
       MAX(Sales) OVER(PARTITION BY CustomerID) AS MaxSales
FROM Orders;

-- 7 Return the latest order for each customers
WITH Ranked AS (
  SELECT OrderID, CustomerID, OrderDate,
         ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY OrderDate DESC, OrderID DESC) AS rn
  FROM Orders
)
SELECT * FROM Ranked WHERE rn = 1;

-- 8 Divide customers into 4 score groups using Score
SELECT CustomerID, FirstName, LastName, Score,
       NTILE(4) OVER(ORDER BY Score DESC) AS ScoreQuartile
FROM Customers
WHERE Score IS NOT NULL;


-- 9 Show salary cumulative distribution and percent rank within department.

SELECT EmployeeID, Department, Salary,
       CUME_DIST() OVER(PARTITION BY Department ORDER BY Salary) AS CumeDist,
       PERCENT_RANK() OVER(PARTITION BY Department ORDER BY Salary) AS PctRank
FROM Employees;

-- 10 Show each customer’s previous order sales
SELECT CustomerID, OrderID, OrderDate, Sales,
       LAG(Sales) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS PrevSales
FROM Orders;

-- 11 Show the next order date and days until next order for each customer.

SELECT CustomerID, OrderID, OrderDate,
       LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrderDate,
       DATEDIFF(DAY, OrderDate,
                LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate)) AS DaysToNext
FROM Orders;

--  12 Show monthly total sales and previous month sales.
WITH MonthlySales AS (
  SELECT DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS MonthStart,
         SUM(Sales) AS TotalSales
  FROM Orders
  GROUP BY YEAR(OrderDate), MONTH(OrderDate)
)
SELECT MonthStart, TotalSales,
       LAG(TotalSales) OVER(ORDER BY MonthStart) AS PrevMonthSales,
       TotalSales - LAG(TotalSales) OVER(ORDER BY MonthStart) AS MoMChange
FROM MonthlySales;

-- 13 Find customers who ordered in consecutive months.
WITH CustMonths AS (
  SELECT DISTINCT CustomerID,
         DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS MonthStart
  FROM Orders
), Prev AS (
  SELECT CustomerID, MonthStart,
         LAG(MonthStart) OVER(PARTITION BY CustomerID ORDER BY MonthStart) AS PrevMonth
  FROM CustMonths
)
SELECT DISTINCT CustomerID
FROM Prev
WHERE DATEDIFF(MONTH, PrevMonth, MonthStart) = 1;

--14 Show each customer’s first and latest order date beside each order.
SELECT CustomerID, OrderID, OrderDate,
       FIRST_VALUE(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS FirstOrderDate,
       LAST_VALUE(OrderDate) OVER(PARTITION BY CustomerID ORDER BY OrderDate
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastOrderDate
FROM Orders;

-- 15 Rank customers by total sales.

WITH CustSales AS (
  SELECT CustomerID, SUM(Sales) AS TotalSales
  FROM Orders
  GROUP BY CustomerID
)
SELECT CustomerID, TotalSales,
       RANK() OVER(ORDER BY TotalSales DESC) AS SalesRank,
       DENSE_RANK() OVER(ORDER BY TotalSales DESC) AS DenseSalesRank
FROM CustSales;
