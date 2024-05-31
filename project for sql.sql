-- Create Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerEmail VARCHAR(100),
    CustomerPhone VARCHAR(15),
    CustomerAddress VARCHAR(200)
);

-- Create Product Table
CREATE TABLE Product (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductDescription TEXT,
    ProductPrice DECIMAL(10, 2),
    ProductStock INT
);

-- Create Order Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderTotal DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create OrderDetail Table
CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID VARCHAR(10),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES [Orders](OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- Insert data into Customer Table
INSERT INTO Customer VALUES
(1001, 'Alice', 'alice@example.com', '555-1234', '123 A St'),
(1002, 'Bob', 'bob@example.com', '555-5678', '456 B St'),
(1003, 'John Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St, Springfield, IL'),
(1004, 'Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak St, Springfield, IL'),
(1005, 'Alice Johnson', 'alice.johnson@example.com', '555-123-4567', '789 Pine St, Springfield, IL'),
(1006, 'Bob Brown', 'bob.brown@example.com', '444-555-6666', '101 Maple St, Springfield, IL'),
(1007, 'Carol White', 'carol.white@example.com', '333-444-5555', '202 Birch St, Springfield, IL'),
(1008, 'David Black', 'david.black@example.com', '222-333-4444', '303 Cedar St, Springfield, IL'),
(1009, 'Eve Davis', 'eve.davis@example.com', '111-222-3333', '404 Walnut St, Springfield, IL'),
(1010, 'Frank Clark', 'frank.clark@example.com', '777-888-9999', '505 Cherry St, Springfield, IL'),
(1011, 'Grace Lewis', 'grace.lewis@example.com', '888-999-7777', '606 Aspen St, Springfield, IL'),
(1012, 'Hank Harris', 'hank.harris@example.com', '999-777-8888', '707 Fir St, Springfield, IL');

select * from customer
-- Insert data into Product Table
INSERT INTO Product VALUES
('P101', 'Laptop', 'High-end laptop', 1000.00, 10),
('P102', 'Phone', 'Smartphone', 500.00, 20),
('P103', 'Tablet', 'Android tablet', 300.00, 15),
('P104', 'Monitor', '24-inch monitor', 200.00, 25),
('P105', 'Keyboard', 'Mechanical keyboard', 80.00, 50),
('P106', 'Mouse', 'Wireless mouse', 40.00, 60),
('P107', 'Printer', 'All-in-one printer', 150.00, 30),
('P108', 'Headphones', 'Noise-cancelling headphones', 120.00, 40),
('P109', 'Webcam', 'HD webcam', 70.00, 35),
('P110', 'Router', 'Wi-Fi router', 90.00, 45),
('P111', 'External Hard Drive', '1TB external hard drive', 100.00, 20),
('P112', 'Smartwatch', 'Fitness smartwatch', 250.00, 15),
('P113', 'Speakers', 'Bluetooth speakers', 130.00, 25);

select * from Product
-- Insert data into Order Table
INSERT INTO Orders VALUES
(1, 1001, '2023-01-15', 1000.00),
(2, 1002, '2023-01-16', 1000.00),
(3, 1003, '2023-01-17', 300.00),
(4, 1004, '2023-01-18', 1500.00),
(5, 1005, '2023-01-19', 200.00),
(6, 1006, '2023-01-20', 800.00),
(7, 1007, '2023-01-21', 400.00),
(8, 1008, '2023-01-22', 600.00),
(9, 1009, '2023-01-23', 700.00),
(10, 1010, '2023-01-24', 1200.00),
(11, 1011, '2023-01-25', 900.00),
(12, 1012, '2023-01-26', 500.00);

-- Insert data into OrderDetail Table
INSERT INTO OrderDetail VALUES
(1, 1, 'P101', 1, 1000.00),
(2, 2, 'P102', 2, 500.00),
(3, 3, 'P103', 1, 300.00);


                                         


                                            --Query to List All Products in Each Order

SELECT od.OrderID, p.ProductName, od.Quantity, od.UnitPrice
FROM OrderDetail od
JOIN Product p ON od.ProductID = p.ProductID;
 
  
                                            -- Query to Calculate Total Sales for Each Product
SELECT p.ProductName, SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM OrderDetail od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;
                                               --Query to Find the Most Popular Product
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetail od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantity DESC  ;
                                              --Query to List Customers and Their Total Orders Amount
SELECT c.CustomerName, SUM(o.OrderTotal) AS TotalSpent
FROM [Orders] o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName;
                                              --Query to Find Orders with More Than One Product
SELECT od.OrderID, COUNT(od.ProductID) AS NumberOfProducts
FROM OrderDetail od
GROUP BY od.OrderID
HAVING COUNT(od.ProductID) > 1;












