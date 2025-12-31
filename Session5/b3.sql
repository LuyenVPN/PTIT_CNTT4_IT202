create database b3_s5;
use b3_s5;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('pending', 'completed', 'cancelled') NOT NULL
);
INSERT INTO orders (order_id, customer_id, total_amount, order_date, status) VALUES
(1, 101, 3000000, '2024-01-10', 'completed'),
(2, 102, 7000000, '2024-01-12', 'pending'),
(3, 103, 12000000, '2024-01-15', 'completed'),
(4, 104, 4500000, '2024-01-18', 'cancelled'),
(5, 105, 9000000, '2024-01-20', 'completed'),
(6, 106, 2000000, '2024-01-22', 'pending'),
(7, 107, 15000000, '2024-01-25', 'completed');

SELECT 
    order_id     AS 'Mã đơn hàng',
    customer_id  AS 'Mã khách hàng',
    total_amount AS 'Tổng tiền',
    order_date   AS 'Ngày đặt',
    status       AS 'Trạng thái'
FROM orders
WHERE status = 'completed';

SELECT *
FROM orders
WHERE total_amount > 5000000;

SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 5;

SELECT *
FROM orders
WHERE status = 'completed'
ORDER BY total_amount DESC;

