SQL Practice Project: E-Commerce Data Analysis
Beginner to Advanced SQL Queries on a Realistic E-Commerce Dataset
SQL Database Status
Overview
This repository contains a complete set of 35+ SQL queries ranging from beginner to advanced/analyst level, practiced on a simple yet realistic e-commerce dataset consisting of two tables:
Tables

customer_data
customer_id (PK)
customer_name
city
signup_date

order_data
order_id (PK)
customer_id (FK → customer_data)
order_date
amount
status ('delivered', 'cancelled', 'processing')


Sample Data
SQL-- Customers
(1, 'Rajesh Kumar',   'Delhi',     '2023-01-12'),
(2, 'Neha Sharma',    'Mumbai',    '2023-03-08'),
(3, 'Arvind Sharma',  'Bangalore', '2023-04-22'),
(4, 'Simran Kaur',    'Pune',      '2023-06-10');

-- Orders (7 records)
(101,1,'2023-07-01',1500,'delivered'),
(102,2,'2023-07-12',2300,'cancelled'),
(103,3,'2023-08-05',1800,'delivered'),
(104,4,'2023-08-09',2600,'processing'),
(105,3,'2023-08-15',4200,'delivered'),
(106,1,'2023-09-01',3100,'delivered'),
(107,4,'2023-09-03',2700,'cancelled');
Total Revenue: 18,200 | Total Orders: 7 | Delivered: 4 | Cancelled: 2 | Processing: 1
Key Business Insights Derived

































MetricResultAverage Order Value (AOV)2,600Cancellation Rate28.57%Delivery Success Rate57.14%Top Revenue CityBangalore (6,000)Top Spending CustomerArvind Sharma (6,000)Customer Contribution % (Top)~33% of total revenue
Query Categories
Beginner Level

List all customers
Show all orders
Show only customer names and cities
Show only delivered orders
Count delivered orders
6–10. Basic COUNT, MAX, MIN queries

Intermediate Level

Customers sorted by name
Top 3 highest-value orders
Orders between July & August 2023
Total revenue from delivered orders
Count cancelled orders
16–23. JOINs, GROUP BY, MONTH(), LIMIT, ORDER BY, etc.

Advanced / Analyst Level

Count orders by status
Cancellation rate (%)
Delivery success rate (%)
Status-wise percentage distribution
Customer with highest & lowest delivered orders
Average Order Value (AOV)
Customers with more than 1 order
31–32. High-value customers (amount > 2500)
Latest order date for each customer
Revenue contribution % per customer
Oldest order for each customer

Join-Based Analytics

Show orders with customer names
Customers who placed orders / never placed orders
Total amount spent by each customer
Number of orders per customer
City-wise total revenue
Monthly revenue breakdown
Customer who spent the maximum

Full Query List
All queries are organized in the file:
ecommerce_sql_queries.sql
You can copy-paste and run them directly in SQLite, MySQL, PostgreSQL, or any SQL environment.
How to Use This Repo
Bash# 1. Clone the repo
git clone https://github.com/yourusername/sql-ecommerce-analysis.git

# 2. Run in SQLite
sqlite3 ecommerce.db < create_tables_and_data.sql
sqlite3 ecommerce.db < ecommerce_sql_queries.sql
Great For

SQL interview preparation
Data analyst portfolio project
Learning JOINs, aggregations, window functions (can be extended)
Practicing real-world business metrics

Connect & Share
Feel free to fork, star, and improve!
Drop a comment if you add window functions (RANK(), ROW_NUMBER()) or CTEs for more advanced analysis.
Happy querying!
#SQL #DataAnalysis #EcommerceAnalytics #DataAnalytics #PortfolioProject #LearningSQL #100DaysOfCode5.2sFast
