create database b2_s6;
use b2_s6;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, full_name, city) VALUES
(1, 'Nguyễn Văn An', 'Hà Nội'),
(2, 'Trần Thị Bình', 'Hồ Chí Minh'),
(3, 'Lê Văn Cường', 'Đà Nẵng'),
(4, 'Phạm Thị Dung', 'Hà Nội'),
(5, 'Hoàng Văn Em', 'Cần Thơ');

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(101, 1, '2025-01-01', 'completed'),
(102, 1, '2025-01-05', 'pending'),
(103, 2, '2025-01-03', 'completed'),
(104, 3, '2025-01-06', 'cancelled'),
(105, 4, '2025-01-07', 'pending');

alter table orders
add total_amount decimal(10,2);

update orders set total_amount = 5500000 where order_id = 101;
update orders set total_amount = 4800000 where order_id = 102;
update orders set total_amount = 6200000 where order_id = 103;
update orders set total_amount = 3500000 where order_id = 104;
update orders set total_amount = 7000000 where order_id = 105;

select
    c.customer_id,
    c.full_name,
    sum(o.total_amount) as total_spent
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

select
    c.customer_id,
    c.full_name,
    max(o.total_amount) as max_order_value
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

select
    c.customer_id,
    c.full_name,
    sum(o.total_amount) as total_spent
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name
order by total_spent desc;