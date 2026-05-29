CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    category VARCHAR(30),
    price FLOAT NOT NULL,
    stock INT NOT NULL
);

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

INSERT INTO Products (name, category, price, stock)
VALUES 
('Shirt', 'Clothing', 20.00, 50),
('Pants', 'Clothing', 25.00, 30),
('Shoes', 'Footwear', 40.00, 20),
('Scarf', 'Accessories', 10.00, 100);

SELECT * FROM Products;

CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(20)
);

INSERT INTO Customers (name, email, phone)
VALUES 
('Juan Perez', 'juan.perez@gmail.com', '555-1234'),
('Maria Lopez', 'maria.lopez@hotmail.com', '555-5678'),
('Ana Gomez', 'ana.gomez@yahoo.com', '555-8765');

SELECT * FROM Customers;

CREATE TABLE Sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Sales (customer_id, product_id, quantity, sale_date)
VALUES 
(1, 1, 2, '2024-11-01'),
(2, 3, 1, '2024-11-05'),
(3, 2, 4, '2024-11-10');

SELECT * FROM Sales;

SELECT * FROM Customers;

SELECT * FROM Products;

SELECT name, phone FROM Customers;

SELECT name, phone 
FROM Customers 
WHERE name = 'Juan Perez';

SELECT name, phone 
FROM Customers c 
WHERE c.name = 'Juan Perez';

SELECT * 
FROM Customers c 
WHERE c.name = 'Juan Perez';

SELECT * 
FROM Products 
ORDER BY price DESC;

SELECT name, phone 
FROM Customers 
ORDER BY name;

ALTER TABLE Customers 
ADD address VARCHAR(50);

SELECT * FROM Customers;

UPDATE Customers
SET address = '742 Evergreen Avenue'
WHERE customer_id = 1;

SELECT * FROM Customers;

UPDATE Customers AS c 
SET address = '759 Mariscal Lopez' 
FROM Customers AS orig 
WHERE c.customer_id = orig.customer_id 
AND c.customer_id = 2;

SELECT * FROM Customers;

UPDATE Customers
SET address = '123 Central Avenue',
    phone = '555-1234'
WHERE customer_id = 3;

SELECT * FROM Customers;

SELECT * FROM Products;

INSERT INTO Products (name, category, price, stock)
VALUES 
('Hat', 'Accessories', 15.00, 40),
('Sneakers', 'Footwear', 35.00, 25),
('Belt', 'Accessories', 12.00, 60),
('Dress', 'Clothing', 50.00, 15),
('Backpack', 'Accessories', 45.00, 10),
('Sandals', 'Footwear', 20.00, 35);

SELECT * FROM Products;

DELETE FROM Products
WHERE product_id = 6;

SELECT * FROM Products;

SELECT * FROM Sales;

INSERT INTO Customers (name, email, phone)
VALUES 
('Carlos Diaz', 'carlos.diaz@gmail.com', '555-2222'),
('Laura Martinez', 'laura.martinez@gmail.com', '555-3333');

INSERT INTO Sales (customer_id, product_id, quantity, sale_date)
VALUES 
(4, 4, 3, '2024-11-15'),
(5, 2, 5, '2024-11-18'),
(1, 5, 2, '2024-11-20'),
(3, 1, 1, '2024-11-22'),
(2, 4, 2, '2024-11-25'),
(4, 3, 6, '2024-11-28'),
(5, 5, 4, '2024-12-01'),
(1, 2, 3, '2024-12-05');

SELECT * FROM Sales;

DELETE FROM Sales 
WHERE product_id = 4;

SELECT * FROM Sales;

SELECT * 
FROM Products
WHERE name LIKE '%Hat%';

SELECT * 
FROM Products
WHERE price BETWEEN 10 AND 30;

SELECT category, COUNT(*) AS total_products
FROM Products
GROUP BY category;

SELECT p.name,
       SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

SELECT p.category,
       SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p
ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT c.name AS customer,
       p.name AS product,
       s.quantity,
       s.sale_date
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
JOIN products p
ON s.product_id = p.product_id
ORDER BY s.sale_date;