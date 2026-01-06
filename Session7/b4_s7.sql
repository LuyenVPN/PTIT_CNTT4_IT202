use b1_s7;

Select id, name, email, (select count(id) from orders where customer_id = customers.id)
From customers;
