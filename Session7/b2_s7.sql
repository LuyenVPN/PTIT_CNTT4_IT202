use b1_s7;
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(150),
    price DECIMAL(12,2)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO products (id, name, price) VALUES
(1, 'Laptop Acer Nitro V', 18000000),
(2, 'Chuột Logitech', 350000),
(3, 'Bàn phím cơ', 1200000),
(4, 'Tai nghe gaming', 900000),
(5, 'Màn hình 24 inch', 3200000),
(6, 'USB 64GB', 250000),
(7, 'Webcam HD', 850000);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 1, 1),
(101, 2, 2),
(102, 3, 1),
(103, 1, 1),
(103, 4, 1),
(104, 5, 2),
(105, 2, 1);

select * from products where id in (select distinct product_id from order_items);
