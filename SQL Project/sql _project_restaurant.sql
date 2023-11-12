https://replit.com/@arrayalukpoo/bootcampbatch08sqlrestaurant#main.sql

-- open database
.open restaurant.db

--Create table customers
CREATE TABLE IF NOT EXISTS customers (
    customerid int,
    name text,
    city text,
    age int
);

INSERT INTO customers values
    (1, 'Ann', 'London', 22),
    (2, 'Yuki', 'Tokyo', 28),
    (3, 'Marry', 'Sydney', 20),
    (4, 'Preaw', 'Bangkok', 24),
    (5, 'James', 'London', 30);
  
--Create table menus
CREATE TABLE IF NOT EXISTS menus (
    menuid int,
    name text,
    type text,
    price real
);

INSERT INTO menus values
    (1, 'Steak', 'Food', 220),
    (2, 'French Fried', 'Snack', 90),
    (3, 'Matcha Latte', 'Drink', 120),
    (4, 'Hamburger', 'Food', 150),
    (5, 'Chocolate Frappe', 'Drink', 110);

--Create table transactions
CREATE TABLE IF NOT EXISTS transactions (
    transactionid int,
    customerid int,
    menuid int,
    method text,
    trans_date text
);

INSERT INTO transactions VALUES 
    (1, 1, 1, 'Cash', '2023-06-02'),
    (2, 2, 3, 'Cash', '2023-06-04'),
    (3, 2, 2, 'Cash', '2023-06-04'),
    (4, 3, 4, 'Credit Card', '2023-06-10'),
    (5, 4, 2, 'Credit Card', '2023-06-11'),
    (6, 4, 5, 'Credit Card', '2023-06-11'),
    (7, 5, 1, 'Credit Card', '2023-06-14');

-- list tables in db
.table

-- display data in terminal/shell
.mode column
SELECT * FROM customers;
SELECT * FROM menus;
SELECT * FROM transactions;

--Aggregate
SELECT AVG(age) AS avg_age FROM customers;

--JOIN
SELECT 
    customers.customerid,
    customers.name AS customers,
    customers.city,
    menus.name AS food,
    menus.price,
    transactions.trans_date AS date
FROM customers 
JOIN transactions
ON customers.customerid = transactions.customerid
JOIN menus
ON transactions.menuid = menus.menuid;

--Aggregate and JOIN
SELECT 
  ROUND(AVG(customers.age),2) AS avg_customers,    
  SUM(menus.price) AS total_price
FROM customers 
JOIN transactions
ON customers.customerid = transactions.customerid
JOIN menus
ON transactions.menuid = menus.menuid;

--Subquery
SELECT 
      sub1.name AS customers,
      sub1.age,
      sub3.name AS food,
      sub2.method,
      sub2.trans_date AS date
FROM (SELECT * FROM customers
      WHERE city = 'London') AS sub1
JOIN (SELECT * FROM transactions
      WHERE method = 'Credit Card') AS sub2
ON sub1.customerid = sub2.customerid
JOIN menus AS sub3
ON sub2.menuid = sub3.menuid;

--Common table expresstion
WITH sub1 AS (
  SELECT * FROM customers
  WHERE age < 25
),  sub2 AS (
  SELECT * FROM transactions
  WHERE trans_date BETWEEN '2023-06-02' AND '2023-06-11'
)   

SELECT 
    sub1.name AS customers,
    sub1.age,
    sub2.trans_date AS date
FROM sub1
JOIN sub2
ON sub1.customerid = sub2.customerid
JOIN menus AS sub3
ON sub2.menuid = sub3.menuid;
