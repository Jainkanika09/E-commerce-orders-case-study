create database e_commerceorders;
USE e_commerceorders;

#customer_data table
create table customer_data(
customer_id int primary key,
customer_name varchar(50),
city varchar(50),
signup_date date );

insert into  customer_data(customer_id,customer_name,city,signup_date)values
(1,'Rajesh kumar','Delhi','2023-01-12'),
(2,'Neha Sharma','Mumbai','2023-03-08'),
(3,'Arvind Sharma','Bangalore','2023-04-22'),
(4,'Simran kaur','Pune','2023-06-10');

select*from customer_data;

insert into  customer_data(customer_id,customer_name,city,signup_date)values
(5,'John Mathews','Chennai','2023-06-10');

#order_data table
CREATE TABLE order_data (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT,
    status VARCHAR(50),
    CONSTRAINT FK_order_data 
        FOREIGN KEY (customer_id)
        REFERENCES customer_data(customer_id)
        ON DELETE CASCADE
);

select*from order_data;
insert into order_data(order_id,customer_id,order_date,amount,status)values
(101,1,'2023-07-01',1500,'delivered'),
(102,2,'2023-07-12',2300,'cancelled'),
(103,3,'2023-08-05',1800,'delivered'),
(104,4,'2023-08-09',2600,'processing'),
(105,3,'2023-08-15',4200,'delivered'),
(106,1,'2023-09-01',3100,'delivered'),
(107,4,'2023-09-03',2700,'cancelled');

#Beginner Level

#1.List all customers
select*from customer_data;

#2.Show all orders
select*from order_data;

#3.Show only the customer names and cities .
select customer_name, city from customer_data;

#4.Show only  delivered items
SELECT * FROM order_data WHERE status = 'Delivered';

#5.count the number of Delivered orders
SELECT COUNT(*) AS delivered_count
FROM order_data
WHERE status = 'Delivered';

#6.show only delivered value from staus column from order
select status  from order_data
where status='Delivered';

# 7. Show total customers count .
SELECT COUNT(*) FROM customer_data;

#8.Count total orders
SELECT COUNT(*) FROM order_data;

#9.Find the highest order amount
SELECT MAX(amount) FROM order_data;

#10.Find the lowest order amount
SELECT Min(amount) FROM order_data;

# Intermediate level

#11. Show all customers sorted by name
SELECT * FROM customer_data ORDER BY customer_name ASC;

#12.Show top 3  highest value orders 
SELECT * FROM order_data ORDER BY amount DESC LIMIT 3;

#13.Show orders between July and August 2023 
select*from order_data where order_date between '2023-07-01' AND '2023-08-31';

#14.Show total revenue from delivered orders 
select sum(amount),status from order_data where status='Delivered';

#15.Count cancelled orders
select count(*), status from order_data where status='cancelled';
# Show only count
SELECT COUNT(*) FROM order_data WHERE status = 'Cancelled';
# Show count column and status column (cancelled)

#Join bassed questions
#16.Show each orders with the customers name
SELECT o.order_id, c.customer_name, o.amount, o.status
FROM order_data o
JOIN customer_data c ON o.customer_id = c.customer_id;

#17.Show customers who placed orders
SELECT DISTINCT c.customer_name
FROM customer_data c
JOIN order_data o ON c.customer_id = o.customer_id;

#18. Show customers who have not placed any orders
SELECT c.customer_name
FROM customer_data c
LEFT JOIN order_data o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

#19. Show total amount spent by each customer
select c.customer_name ,sum(o.amount) as t_spent
from customer_data c
LEFT JOIN order_data o ON c.customer_id = o.customer_id
group by c.customer_name ;

#20. Show number of order per customer
select c.customer_name, count(o.order_id) as order_count
from customer_data c
LEFT JOIN order_data o ON c.customer_id = o.customer_id
group by c.customer_name ;

#21. Show each city total revenue 
select c.city, sum(o.amount) as city_revenue
from customer_data c
LEFT JOIN order_data o ON c.customer_id = o.customer_id
group by c.city ;

#22. Show monthly revenue 
SELECT 
    MONTH(order_date) AS order_month,
    SUM(amount) AS revenue
FROM order_data
GROUP BY MONTH(order_date);

#23. Which customer spent the maximum amount
SELECT c.customer_name, SUM(o.amount) AS total_spent
FROM customer_data c
JOIN order_data o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;

#24. COUNT order by status
SELECT status, COUNT(*) AS total
FROM order_data
GROUP BY status;

#Advanced analyst level questions
#25. Calculate cancellation rate(%)
select(sum(case when status ='cancelled'then 1 end)*100.0)
/count(*) as cancellation_rate from order_data ;

SELECT 
    (SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) * 100.0)
/ COUNT(*) AS delivery_cancelled_rate
FROM order_data;

#26. Calculate delivered rate(%)
SELECT 
    (SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) * 100.0)
/ COUNT(*) AS delivery_success_rate
FROM order_data;

#27. Calculate status individal values percentage
SELECT 
    status,
    (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM order_data) AS percentage
FROM order_data
GROUP BY status;

#28. Find the customer with the highest number of delivered orders
SELECT c.customer_name, COUNT(*) AS delivered_orders
FROM customer_data c
JOIN order_data o ON c.customer_id = o.customer_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_name
ORDER BY delivered_orders DESC
LIMIT 1;

#28. Find the customer with the lowest number of delivered orders
SELECT c.customer_name, COUNT(*) AS delivered_orders
FROM customer_data c
JOIN order_data o ON c.customer_id = o.customer_id
WHERE o.status = 'Delivered'
GROUP BY c.customer_name
ORDER BY delivered_orders asc
LIMIT 1;

#29. Calculate Average order value(AOV)
SELECT AVG(amount) AS avg_order_value
FROM order_data;

#30. Find customers who placed more than 1 order
SELECT c.customer_name, COUNT(o.order_id) AS order_count
FROM customer_data c
JOIN order_data o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING COUNT(o.order_id) > 1;

#31. Find customers who ordered only high_value orders(>2500)
SELECT c.customer_id, c.customer_name,o.amount
FROM customer_data c
JOIN order_data o ON c.customer_id = o.customer_id
GROUP BY c.customer_id ,c.customer_name
HAVING MIN(o.amount) > 2500;

#32. Customers who made at least one high-value order (>2500)
SELECT c.customer_id, c.customer_name
FROM customer_data c
JOIN order_data o 
    ON c.customer_id = o.customer_id
WHERE o.amount > 2500
GROUP BY c.customer_id, c.customer_name;

#33. Find the latest order for each customer
SELECT c.customer_name, MAX(o.order_date) AS last_order_date
FROM customer_data c
LEFT JOIN order_data o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

#34. Find revenue contribution % per customer
SELECT 
    c.customer_name,
    SUM(o.amount) AS customer_revenue,
    (SUM(o.amount) / (SELECT SUM(amount) FROM order_data)) * 100 AS contribution_percentage
FROM customer_data c
JOIN order_data o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

#35. Find the oldest order for each customer .
SELECT c.customer_name, Min(o.order_date) AS old_order_date
FROM customer_data c
LEFT JOIN order_data o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;