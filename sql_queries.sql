/*
Author:				Mathapelo Motloung
Date: 				2019-02-14
Filename:			sql_queries.sql
File description: 	Create and maintain records recording the details of Umuzi 
*/

/*Create table to store details for umuzi*/
DROP DATABASE IF EXISTS umuzi;
CREATE DATABASE umuzi;
USE umuzi;

 /*Create table to store customer details*/
CREATE TABLE customers(
  customer_id  INTEGER PRIMARY KEY AUTO_INCREMENT,
  first_name  TEXT,
  last_name   TEXT,
  gender  	  TEXT,
  address	  VARCHAR(100),
  phone		  INTEGER(10),	
  email       VARCHAR(100),
  city        TEXT,
  country     TEXT  
);

/*Populate customer table*/
INSERT INTO customers(first_name, last_name, gender, address,phone,email, city, country  ) 
VALUES
	('John', 'Hibert', 'Male', '284 chaucer st', 084789657,	'john@gmail.com', 'Johannesburg', 'South Africa'),
	('Thando',	'Sithole',	'Female', '240 Sect 1',	0794445584,	'thando@gmail.com',	'Cape Town', 'South Africa'),
	('Leon',	'Glen',	'Male', '81 Everton Rd,Gillits',	0820832830,	'Leon@gmail.com',	'Durban',	'South Africa'),
	('Charl',	'Muller',	'Male', '290A Dorset Ecke',	0856872553,	'Charl.muller@yahoo.com','Berlin',	'Germany'),
	('Julia',	'Stein',	'Female',	'2 Wernerring', 0867244505,	'Js234@yahoo.com',	'Frankfurt', 'Germany')
;

/*Create table to store employee details*/
CREATE TABLE employees(
  employee_id 	INTEGER PRIMARY KEY AUTO_INCREMENT,
  first_name	VARCHAR(50),
  last_name		VARCHAR(50),
  email			VARCHAR(100),
  job_title  	TEXT
);

/*Populate employee table*/
INSERT INTO employees(first_name, last_name,email,job_title ) 
VALUES
	('Kani', 'Matthew', 'Kmat@gmail.com', 'Manager'),
	('Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk'),
	('Gideon', 'Maduku', 'Gm@gmail.com', 'Accountant');


/*Create table to store order details*/
CREATE TABLE orders(
 order_id 		INTEGER PRIMARY KEY AUTO_INCREMENT,
 order_date		DATETIME,
 required_date	DATETIME,
 shipped_date	DATETIME,
 status 		TEXT
); 

/*Populate orderr table*/
INSERT INTO orders(order_date, required_date,shipped_date,status ) 
VALUES
	('2018-09-01', '2018-09-05', '2018-09-02', 'Not Shipped'),
	('2018-09-01', '2018-09-04', '2018-09-03', 'Shipped'),
	('2018-09-01', '2018-09-03', '2018-09-02', 'Not shipped');

/*Create table to store payment details*/
CREATE TABLE payments(
 payment_id 	INTEGER PRIMARY KEY AUTO_INCREMENT,
 customer_id 	INTEGER ,
 payment_date	DATETIME,
 amount 		DECIMAL,
 FOREIGN KEY(customer_id) REFERENCES customers(customer_id));

/*Populate order table*/
INSERT INTO payments( payment_date, amount) 
VALUES
	('2018-09-01', 100.00),
	('2018-09-01', 100.00);
  
/*Create table to store product details*/
CREATE TABLE products(
  product_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  product_name	TEXT,
  description 	TEXT,	
  buy_price 	DECIMAL);

/*Populate product table*/
INSERT INTO products( product_name, description, buy_price) 
VALUES
	('Harley Davidson Chopper',	'This replica features working kickstand, front suspension, gear-shift lever',	150.75),
	('Classic Car', 'Turnable front wheels, steering function', 550.75),
	('Sports car',	'Turnable front wheels, steering function',	700.60);

/*Get all records from the customer table*/
SELECT * 
FROM customers;

/*Get only the first names from the customer table*/
SELECT first_name 
FROM customers;

/*Get a name from the customers table at a specific row*/
SELECT first_name 
FROM customers
WHERE customer_id=1;

/*Update first and last name at a specific row*/
UPDATE customers
SET first_name='Lerato', last_name='Mabitso'
WHERE customer_id=1;

/*Delete a specific row from customers*/
DELETE FROM customers
WHERE customer_id=2;

/*Get all records from the products table*/
SELECT * 
FROM products;

/*Get the maximun price from the products table*/
SELECT MAX(buy_price)
FROM products;

/*Get all details from the custormers ordered by country*/
SELECT *
FROM customers
ORDER BY country;

/*Select details where the price is between R100 and R600*/
SELECT * 
FROM products
WHERE 100>buy_price<600;

/* Select all details at a specific city and country */
SELECT * 
FROM customers
WHERE city='Berlin' AND country='Germany';

/*Select all details at where city is Durban or Cape Town*/
SELECT * 
FROM customers
WHERE city='Durban' OR city='Cape Town';

/*Select all details where price is more that 500*/
SELECT*
FROM products
WHERE buy_price >500;

/*Add all values in the amount field*/
SELECT SUM(amount)
FROM payments;

/*Occurence of shipped orders*/
SELECT COUNT(shipped_date)
FROM orders;

/*Average of price in Rands and Dollars*/
SELECT AVG(buy_price) as Rands,AVG(buy_price *12) as Dollars
FROM products;

/*Get details of all orders with customer information*/
SELECT *
FROM orders
INNER JOIN 	customers ON customers.customer_id=orders.order_id;