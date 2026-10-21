CREATE DATABASE SalesDB;
USE SalesDB;

CREATE TABLE Customers (
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Score FLOAT
);

-- Insert statements for Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Country, Score) VALUES (1, 'Jossef', 'Goldberg', 'Germany', 350.0);
INSERT INTO Customers (CustomerID, FirstName, LastName, Country, Score) VALUES (2, 'Kevin', 'Brown', 'USA', 900.0);
INSERT INTO Customers (CustomerID, FirstName, LastName, Country, Score) VALUES (3, 'Mary', NULL, 'USA', 750.0);
INSERT INTO Customers (CustomerID, FirstName, LastName, Country, Score) VALUES (4, 'Mark', 'Schwarz', 'Germany', 500.0);
INSERT INTO Customers (CustomerID, FirstName, LastName, Country, Score) VALUES (5, 'Anna', 'Adams', 'USA', NULL);


CREATE TABLE Employees (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    BirthDate VARCHAR(50),
    Gender VARCHAR(50),
    Salary INT,
    ManagerID FLOAT
);

-- Insert statements for Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES (1, 'Frank', 'Lee', 'Marketing', '1988-12-05', 'M', 55000, NULL);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES (2, 'Kevin', 'Brown', 'Marketing', '1972-11-25', 'M', 65000, 1.0);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES (3, 'Mary', NULL, 'Sales', '1986-01-05', 'F', 75000, 1.0);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES (4, 'Michael', 'Ray', 'Sales', '1977-02-10', 'M', 90000, 2.0);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, BirthDate, Gender, Salary, ManagerID) VALUES (5, 'Carol', 'Baker', 'Sales', '1982-02-11', 'F', 55000, 3.0);


CREATE TABLE Orders (
    OrderID INT,
    ProductID INT,
    CustomerID INT,
    SalesPersonID INT,
    OrderDate VARCHAR(50),
    ShipDate VARCHAR(50),
    OrderStatus VARCHAR(50),
    ShipAddress VARCHAR(50),
    BillAddress VARCHAR(50),
    Quantity INT,
    Sales INT,
    CreationTime VARCHAR(54)
);

-- Insert statements for Orders
INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (1, 101, 2, 3, '2025-01-01', '2025-01-05', 'Delivered', '9833 Mt. Dias Blv.', '1226 Shoe St.', 1, 10, '2025-01-01 12:34:56.0000000');
INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (2, 102, 3, 3, '2025-01-05', '2025-01-10', 'Shipped', '250 Race Court', NULL, 1, 15, '2025-01-05 23:22:04.0000000');
INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (3, 101, 1, 5, '2025-01-10', '2025-01-25', 'Delivered', '8157 W. Book', '8157 W. Book', 2, 20, '2025-01-10 18:24:08.0000000');
INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (4, 105, 1, 3, '2025-01-20', '2025-01-25', 'Shipped', '5724 Victory Lane', NULL, 2, 60, '2025-01-20 05:50:33.0000000');
INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (5, 104, 2, 5, '2025-02-01', '2025-02-05', 'Delivered', NULL, NULL, 1, 25, '2025-02-01 14:02:41.0000000');
INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (6, 104, 3, 5, '2025-02-05', '2025-02-10', 'Delivered', '1792 Belmont Rd.', NULL, 2, 50, '2025-02-06 15:34:57.0000000');
INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (7, 102, 1, 1, '2025-02-15', '2025-02-27', 'Delivered', '136 Balboa Court', NULL, 2, 30, '2025-02-16 06:22:01.0000000');
INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (8, 101, 4, 3, '2025-02-18', '2025-02-27', 'Shipped', '2947 Vine Lane', '4311 Clay Rd', 3, 90, '2025-02-18 10:45:22.0000000');
INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (9, 101, 2, 3, '2025-03-10', '2025-03-15', 'Shipped', '3768 Door Way', NULL, 2, 20, '2025-03-10 12:59:04.0000000');
INSERT INTO Orders (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (10, 102, 3, 5, '2025-03-15', '2025-03-20', 'Shipped', NULL, NULL, 0, 60, '2025-03-16 23:25:15.0000000');



CREATE TABLE OrdersArchive (
    OrderID INT,
    ProductID INT,
    CustomerID INT,
    SalesPersonID INT,
    OrderDate VARCHAR(50),
    ShipDate VARCHAR(50),
    OrderStatus VARCHAR(50),
    ShipAddress VARCHAR(50),
    BillAddress VARCHAR(50),
    Quantity INT,
    Sales INT,
    CreationTime VARCHAR(54)
);

-- Insert statements for OrdersArchive
INSERT INTO OrdersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (1, 101, 2, 3, '2024-04-01', '2024-04-05', 'Shipped', '123 Main St', '456 Billing St', 1, 10, '2024-04-01 12:34:56.0000000');
INSERT INTO OrdersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (2, 102, 3, 3, '2024-04-05', '2024-04-10', 'Shipped', '456 Elm St', '789 Billing St', 1, 15, '2024-04-05 23:22:04.0000000');
INSERT INTO OrdersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (3, 101, 1, 4, '2024-04-10', '2024-04-25', 'Shipped', '789 Maple St', '789 Maple St', 2, 20, '2024-04-10 18:24:08.0000000');
INSERT INTO OrdersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Shipped', '987 Victory Lane', NULL, 2, 60, '2024-04-20 05:50:33.0000000');
INSERT INTO OrdersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (4, 105, 1, 3, '2024-04-20', '2024-04-25', 'Delivered', '987 Victory Lane', NULL, 2, 60, '2024-04-20 14:50:33.0000000');
INSERT INTO OrdersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (5, 104, 2, 5, '2024-05-01', '2024-05-05', 'Shipped', '345 Oak St', '678 Pine St', 1, 25, '2024-05-01 14:02:41.0000000');
INSERT INTO OrdersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', NULL, 2, 50, '2024-05-06 15:34:57.0000000');
INSERT INTO OrdersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (6, 104, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-07 13:22:05.0000000');
INSERT INTO OrdersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (6, 101, 3, 5, '2024-05-05', '2024-05-10', 'Delivered', '543 Belmont Rd.', '3768 Door Way', 2, 50, '2024-05-12 20:36:55.0000000');
INSERT INTO OrdersArchive (OrderID, ProductID, CustomerID, SalesPersonID, OrderDate, ShipDate, OrderStatus, ShipAddress, BillAddress, Quantity, Sales, CreationTime) VALUES (7, 102, 3, 5, '2024-06-15', '2024-06-20', 'Shipped', '111 Main St', '222 Billing St', 0, 60, '2024-06-16 23:25:15.0000000');



CREATE TABLE Products (
    ProductID INT,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Price INT
);

-- Insert statements for Products
INSERT INTO Products (ProductID, Product, Category, Price) VALUES (101, 'Bottle', 'Accessories', 10);
INSERT INTO Products (ProductID, Product, Category, Price) VALUES (102, 'Tire', 'Accessories', 15);
INSERT INTO Products (ProductID, Product, Category, Price) VALUES (103, 'Socks', 'Clothing', 20);
INSERT INTO Products (ProductID, Product, Category, Price) VALUES (104, 'Caps', 'Clothing', 25);
INSERT INTO Products (ProductID, Product, Category, Price) VALUES (105, 'Gloves', 'Clothing', 30);


--Running Total Query:
SELECT 
    OrderDate,
    Sales,
    SUM(Sales) OVER (ORDER BY OrderDate) AS RunningTotal
FROM Orders;


--Moving Average (3-Order Rolling Average)
SELECT 
    OrderID,
    OrderDate,
    Sales,
    AVG(Sales) OVER (
        ORDER BY OrderDate 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAvg_3Orders
FROM Orders;

-- Step 1: Create a virtual table (CTE) to get total sales per month
WITH MonthlySales AS (
    SELECT 
        MONTH(OrderDate) AS SalesMonth,
        SUM(Sales) AS CurrentSales
    FROM Orders
    GROUP BY MONTH(OrderDate)
)
-- Step 2: Use LAG on the virtual table to get the previous month's sales
SELECT 
    SalesMonth,
    CurrentSales,
    LAG(CurrentSales, 1) OVER (ORDER BY SalesMonth) AS PrevSales,
    CAST((CurrentSales - LAG(CurrentSales, 1) OVER (ORDER BY SalesMonth)) * 100.0 / 
         NULLIF(LAG(CurrentSales, 1) OVER (ORDER BY SalesMonth), 0) AS DECIMAL(5,2)) AS MoM_Growth_Pct
FROM MonthlySales;














