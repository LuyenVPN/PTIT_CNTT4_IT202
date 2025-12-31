create database b6_s5;
use b6_s5;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    sold_quantity INT NOT NULL,
    status ENUM('active', 'inactive') NOT NULL
);

INSERT INTO products (product_id, product_name, price, stock, sold_quantity, status) VALUES
(1, 'Chuột Logitech', 500000, 50, 300, 'active'),
(2, 'Bàn phím cơ', 1200000, 30, 220, 'active'),
(3, 'Tai nghe Sony', 1800000, 25, 180, 'active'),
(4, 'Loa Bluetooth', 1700000, 35, 200, 'active'),
(5, 'Webcam Full HD', 900000, 40, 130, 'active'),
(6, 'Ổ cứng SSD 512GB', 2500000, 20, 140, 'active'),
(7, 'Màn hình 24 inch', 3000000, 15, 160, 'active'),
(8, 'USB 64GB', 300000, 100, 400, 'active'),
(9, 'Balo Laptop', 600000, 45, 190, 'inactive'),
(10, 'Tai nghe Gaming', 1500000, 28, 210, 'active'),
(11, 'Chuột không dây', 700000, 60, 250, 'inactive'),
(12, 'Bàn phím văn phòng', 1100000, 70, 170, 'active'),
(13, 'Đế tản nhiệt', 1000000, 55, 160, 'active'),
(14, 'Ổ cứng HDD 1TB', 2000000, 22, 145, 'active'),
(15, 'Loa mini', 1300000, 40, 155, 'active'),
(16, 'Tai nghe Bluetooth', 2200000, 18, 165, 'active'),
(17, 'Chuột Gaming', 1400000, 33, 175, 'active'),
(18, 'Bàn phím Gaming', 2800000, 19, 185, 'active'),
(19, 'Webcam Pro', 3200000, 10, 90, 'active'),
(20, 'Micro thu âm', 2600000, 14, 110, 'active');

SELECT
    product_id     AS 'Mã sản phẩm',
    product_name   AS 'Tên sản phẩm',
    price          AS 'Giá',
    stock          AS 'Tồn kho',
    sold_quantity  AS 'Số lượng đã bán',
    CASE
        WHEN status = 'active'   THEN 'Đang bán'
        WHEN status = 'inactive' THEN 'Ngừng bán'
        ELSE 'Không xác định'
    END AS 'Trạng thái'
FROM products
WHERE status = 'active'
  AND price BETWEEN 1000000 AND 3000000
ORDER BY price ASC
LIMIT 10 OFFSET 0;

SELECT
    product_id     AS 'Mã sản phẩm',
    product_name   AS 'Tên sản phẩm',
    price          AS 'Giá',
    stock          AS 'Tồn kho',
    sold_quantity  AS 'Số lượng đã bán',
    CASE
        WHEN status = 'active'   THEN 'Đang bán'
        WHEN status = 'inactive' THEN 'Ngừng bán'
        ELSE 'Không xác định'
    END AS 'Trạng thái'
FROM products
WHERE status = 'active'
  AND price BETWEEN 1000000 AND 3000000
ORDER BY price ASC
LIMIT 10 OFFSET 10;

