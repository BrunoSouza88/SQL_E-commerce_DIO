-- How many orders were made by each customer? 
SELECT CustomerID, COUNT(*) AS NumberOfOrders
FROM Order
GROUP BY CustomerID;

-- Is any salesperson also a supplier?
SELECT SupplierID
FROM Supplier
WHERE SupplierID IN (
    SELECT CustomerID
    FROM Customer
);

-- List of products, suppliers, and stocks:
SELECT Product.ProductID, Product.Name, Supplier.Name AS SupplierName, Stock.Quantity
FROM Product
INNER JOIN Supplier ON Product.SupplierID = Supplier.SupplierID
INNER JOIN Stock ON Product.ProductID = Stock.ProductID;

-- List of supplier names and product names:
SELECT Supplier.Name AS SupplierName, Product.Name AS ProductName
FROM Supplier
INNER JOIN Product ON Supplier.SupplierID = Product.SupplierID;
