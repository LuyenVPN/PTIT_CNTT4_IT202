use b1_s7;

select c.*, sum(od.total_amount) as 'Total Money'
from customers c join orders od on c.id = od.customer_id
group by c.id
having sum(od.total_amount) = (
    select sum(total_amount) from orders
    group by customer_id
    order by sum(total_amount) desc
    limit 1
);