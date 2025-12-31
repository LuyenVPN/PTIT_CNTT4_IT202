create database b2_s5;
use b2_s5;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    city VARCHAR(255),
    status ENUM('active', 'inactive') NOT NULL
);

INSERT INTO customers (customer_id, full_name, email, city, status) VALUES
(1, 'Nguyen Van An', 'an@gmail.com', 'TP.HCM', 'active'),
(2, 'Tran Thi Binh', 'binh@gmail.com', 'Hà Nội', 'active'),
(3, 'Le Van Cuong', 'cuong@gmail.com', 'Đà Nẵng', 'inactive'),
(4, 'Pham Thi Dao', 'dao@gmail.com', 'Hà Nội', 'inactive'),
(5, 'Hoang Van Em', 'em@gmail.com', 'TP.HCM', 'active');

SELECT *
FROM customers;

SELECT *
FROM customers
WHERE city = 'TP.HCM';

SELECT *
FROM customers
WHERE status = 'active'
  AND city = 'Hà Nội';

SELECT *
FROM customers
ORDER BY full_name ASC;
