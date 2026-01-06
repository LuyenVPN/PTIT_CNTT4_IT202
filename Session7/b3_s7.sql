use b1_s7;

select * from orders where total_amount > ( select avg(total_amount) from orders );