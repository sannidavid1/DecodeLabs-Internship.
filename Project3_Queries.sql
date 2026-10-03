-- Query 1: Filtering with WHERE
SELECT * FROM orders WHERE Product = 'Laptop';

-- Query 2: Numeric filtering with ORDER BY
SELECT OrderID, Product, TotalPrice FROM orders WHERE TotalPrice > 2000 ORDER BY TotalPrice DESC;

-- Query 3: Aggregation with GROUP BY
SELECT Product, COUNT(*) AS OrderCount, ROUND(SUM(TotalPrice),2) AS TotalRevenue, ROUND(AVG(TotalPrice),2) AS AvgOrderValue FROM orders GROUP BY Product ORDER BY TotalRevenue DESC;

-- Query 4: Filtering grouped results with HAVING
SELECT Product, ROUND(AVG(TotalPrice),2) AS AvgOrderValue FROM orders GROUP BY Product HAVING AVG(TotalPrice) > 1050 ORDER BY AvgOrderValue DESC;

-- Query 5: Top customers by spend
SELECT CustomerID, COUNT(*) AS NumOrders, ROUND(SUM(TotalPrice),2) AS TotalSpent FROM orders GROUP BY CustomerID ORDER BY TotalSpent DESC LIMIT 5;
