create database b4_s5;
use b4_s5;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    sold_quantity INT NOT NULL,
    status ENUM('active', 'inactive') NOT NULL
);

INSERT INTO products (product_id, product_name, price, stock, sold_quantity, status) VALUES
(1, 'Laptop Dell', 15000000, 10, 120, 'active'),
(2, 'Laptop HP', 14000000, 8, 95, 'active'),
(3, 'Chuột Logitech', 500000, 50, 300, 'active'),
(4, 'Bàn phím cơ', 1200000, 30, 220, 'active'),
(5, 'Tai nghe Sony', 1800000, 25, 180, 'active'),
(6, 'Màn hình Samsung', 3500000, 15, 160, 'active'),
(7, 'USB 64GB', 300000, 100, 400, 'active'),
(8, 'Ổ cứng SSD', 2500000, 20, 140, 'active'),
(9, 'Webcam', 900000, 40, 130, 'active'),
(10, 'Loa Bluetooth', 1700000, 35, 200, 'active'),
(11, 'Chuột không dây', 700000, 60, 210, 'active'),
(12, 'Balo Laptop', 600000, 45, 190, 'active');

SELECT *
FROM products
ORDER BY sold_quantity DESC
LIMIT 10;

SELECT *
FROM products
ORDER BY sold_quantity DESC
LIMIT 5 OFFSET 10;

SELECT *
FROM products
WHERE price < 2000000
ORDER BY sold_quantity DESC;
