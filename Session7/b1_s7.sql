create database b1_s7;
use b1_s7;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(12,2)
);

INSERT INTO customers (id, name, email) VALUES
(1, 'Nguyen Van A', 'a@gmail.com'),
(2, 'Tran Thi B', 'b@gmail.com'),
(3, 'Le Van C', 'c@gmail.com'),
(4, 'Pham Thi D', 'd@gmail.com'),
(5, 'Hoang Van E', 'e@gmail.com'),
(6, 'Do Thi F', 'f@gmail.com'),
(7, 'Bui Van G', 'g@gmail.com');

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-01-01', 1500000),
(2, 2, '2025-01-03', 2500000),
(3, 1, '2025-01-05', 3200000),
(4, 3, '2025-01-07', 1800000),
(5, 5, '2025-01-10', 900000),
(6, 2, '2025-01-12', 1200000),
(7, 4, '2025-01-15', 2100000);

select * from customers where id in (select distinct customer_id from orders);