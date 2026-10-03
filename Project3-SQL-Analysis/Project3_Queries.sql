-- ============================================================
-- Project 3: SQL Data Analysis
-- DecodeLabs Industrial Training Kit, Data Analytics Internship
-- Author: Sanni David Semilore
--
-- Table: orders (1,200 rows, same dataset used in Projects 1 and 2)
-- Columns: OrderID, Date, CustomerID, Product, Quantity, UnitPrice,
--          ShippingAddress, PaymentMethod, OrderStatus, TrackingNumber,
--          ItemsInCart, CouponCode, ReferralSource, TotalPrice
-- ============================================================


-- 1. Filtering with WHERE
-- Finds all orders for a single product.
-- Result: 173 rows returned (Laptop orders make up ~14.4% of the dataset)
SELECT *
FROM orders
WHERE Product = 'Laptop';


-- 2. Numeric filtering with WHERE, sorted with ORDER BY
-- Finds high-value orders, sorted from highest to lowest.
-- Result: 180 rows returned; highest single order is ORD200789 (Tablet, 3,456.40)
SELECT OrderID, Product, TotalPrice
FROM orders
WHERE TotalPrice > 2000
ORDER BY TotalPrice DESC;


-- 3. Aggregation with GROUP BY (COUNT, SUM, AVG)
-- Calculates total revenue and average order value per product.
-- Result: Chair leads on total revenue (195,620.11); Laptop leads on
-- average order value (1,110.56) despite having fewer orders.
SELECT
    Product,
    COUNT(*) AS OrderCount,
    ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
    ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM orders
GROUP BY Product
ORDER BY TotalRevenue DESC;


-- 4. Filtering grouped results with HAVING
-- Unlike WHERE, HAVING filters AFTER aggregation, on the computed AVG value.
-- Result: 4 of 7 products (Laptop, Chair, Printer, Monitor) have an
-- average order value above 1,050.
SELECT
    Product,
    ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM orders
GROUP BY Product
HAVING AVG(TotalPrice) > 1050
ORDER BY AvgOrderValue DESC;


-- 5. Top customers by total spend
-- Identifies the highest-spending customers and how many orders they placed.
-- Result: Top customer (C38840) reached the highest spend via 2 orders;
-- the rest of the top 5 reached similar totals via a single large order.
SELECT
    CustomerID,
    COUNT(*) AS NumOrders,
    ROUND(SUM(TotalPrice), 2) AS TotalSpent
FROM orders
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 5;
