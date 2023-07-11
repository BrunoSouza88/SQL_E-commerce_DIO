CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(20),
    Type VARCHAR(20)
);

CREATE TABLE Order (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Date DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(50),
    Price DECIMAL(10, 2),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Stock (
    ProductID INT PRIMARY KEY,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE PaymentMethod (
    PaymentID INT PRIMARY KEY,
    Description VARCHAR(50)
);

CREATE TABLE Payment (
    OrderID INT,
    PaymentID INT,
    FOREIGN KEY (OrderID) REFERENCES Order(OrderID),
    FOREIGN KEY (PaymentID) REFERENCES PaymentMethod(PaymentID),
    PRIMARY KEY (OrderID, PaymentID)
);

CREATE TABLE Delivery (
    OrderID INT,
    Status VARCHAR(20),
    TrackingCode VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Order(OrderID),
    PRIMARY KEY (OrderID)
);
