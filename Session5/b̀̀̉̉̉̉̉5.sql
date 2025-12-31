create database b5_s5;
use b5_s5;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('pending', 'completed', 'cancelled') NOT NULL
);

INSERT INTO orders (order_id, customer_id, total_amount, order_date, status) VALUES
(1, 101, 3000000, '2024-01-01', 'completed'),
(2, 102, 4500000, '2024-01-02', 'pending'),
(3, 103, 6000000, '2024-01-03', 'completed'),
(4, 104, 2500000, '2024-01-04', 'cancelled'),
(5, 105, 8000000, '2024-01-05', 'completed'),
(6, 106, 1500000, '2024-01-06', 'pending'),
(7, 107, 9000000, '2024-01-07', 'completed'),
(8, 108, 1200000, '2024-01-08', 'pending'),
(9, 109, 7000000, '2024-01-09', 'completed'),
(10, 110, 5000000, '2024-01-10', 'completed'),
(11, 111, 2000000, '2024-01-11', 'pending'),
(12, 112, 10000000, '2024-01-12', 'completed'),
(13, 113, 1800000, '2024-01-13', 'pending'),
(14, 114, 4000000, '2024-01-14', 'completed'),
(15, 115, 2200000, '2024-01-15', 'cancelled');

SELECT *
FROM orders
WHERE status != 'cancelled'
ORDER BY order_date DESC
LIMIT 5 OFFSET 0;

SELECT *
FROM orders
WHERE status IN ('pending', 'completed')
ORDER BY order_date DESC
LIMIT 5 OFFSET 5;

SELECT *
FROM orders
WHERE status NOT IN ('cancelled')
ORDER BY order_date DESC
LIMIT 5 OFFSET 10;

SELECT
    order_id     AS 'Mã đơn hàng',
    customer_id  AS 'Mã khách hàng',
    total_amount AS 'Tổng tiền',
    order_date   AS 'Ngày đặt',
    CASE
        WHEN status = 'pending'   THEN 'Chờ xử lý'
        WHEN status = 'completed' THEN 'Hoàn thành'
        WHEN status = 'cancelled' THEN 'Đã hủy'
        ELSE 'Không xác định'
    END AS 'Trạng thái'
FROM orders;
