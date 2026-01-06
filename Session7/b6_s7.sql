use b1_s7;

Select * from customers where id in(
    Select customer_id from orders
    Group by customer_id
    Having sum(total_amount) > (select avg(total_amount) from orders)
);
