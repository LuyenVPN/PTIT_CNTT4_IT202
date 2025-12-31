DROP DATABASE b1_s5;
create database b1_s5;
use b1_s5;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    status ENUM('active', 'inactive') NOT NULL
);

INSERT INTO products (product_id, product_name, price, stock, status) VALUES
(1, 'Laptop Dell Inspiron', 15000000, 10, 'active'),
(2, 'Chuột Logitech', 500000, 50, 'active'),
(3, 'Bàn phím cơ', 1200000, 20, 'active'),
(4, 'Màn hình Samsung', 3500000, 0, 'inactive'),
(5, 'Tai nghe Bluetooth', 800000, 30, 'inactive');

SELECT *
FROM products;

SELECT *
FROM products
WHERE status = 'active';

SELECT *
FROM products
WHERE price > 1000000;

SELECT *
FROM products
WHERE status = 'active'
ORDER BY price ASC;

