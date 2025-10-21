-- creating data base
create database onlinestore;

use onlinestore;

-- creating book table
drop table if exists books;

create table book(
book_id serial primary key,
title varchar(100),
author varchar(100),
genre varchar(50),
Published_Year int,
Price NUMERIC(10, 2),
stock int);

-- creating customers table

DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
 
 drop table if exists orders;
 
 create table orders(
	Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);
SHOW VARIABLES LIKE 'secure_file_priv';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
-- loading books data
LOAD DATA LOCAL INFILE "C://Users//lenovo//Downloads//Books (2).csv"
INTO TABLE book
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- loading customers data

LOAD DATA LOCAL INFILE "C://Users//lenovo//Downloads//Customers (2).csv"
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- loading orders data

LOAD DATA LOCAL INFILE "C://Users//lenovo//Downloads//Orders (3).csv"
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 1) Retrieve all books in the "Fiction" genre:

select * from book
where genre="fiction";

-- 2) Find books published after the year 1950:

select * from book
where published_year>1950;

-- 3) List all customers from the Denmark:
SET SQL_SAFE_UPDATES = 0;

UPDATE customers
SET country = TRIM(country);


select* from customers;
SELECT  * 
FROM customers
WHERE country="denmark";

-- 4) Show orders placed in November 2023:
select * from orders
where Order_Date>="2023-11-01" and Order_Date<="2023-11-30";

-- 5) Retrieve the total stock of books available:

select sum(stock) as total_stock from book;

-- 6) Find the details of the most expensive book:

select * from  book
where price=(select max(price) from book);

-- 7) Show all customers who ordered more than 1 quantity of a book:

select * from orders
where Quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:

select * from orders
where Total_Amount>20;

-- 9)List all genres available in the Books table:

select distinct genre from book;

-- 10) Find the book with the lowest stock:

select * from book
where stock=0;

-- 11) Calculate the total revenue generated from all orders:

select sum(Total_Amount) as revenue from orders;

-- 12) Retrieve the total number of books sold for each genre:

select genre,sum(Quantity) as total_no_of_books from orders
join book
using(book_id)
group by genre;

-- 13)  Find the average price of books in the "Fantasy" genre:

select avg(price) as average from book
where genre="Fantasy";

-- 14)  List customers who have placed at least 2 orders:

select Customer_ID,name,count(*) as no_of_orders from customers
join orders
using(customer_id)
group by Customer_ID
having count(*)>=2;

-- 15) Find the most frequently ordered book:
select title,count(*) as no_of_times_ordered from orders
join book
using(book_id)
group by book_id
order by no_of_times_ordered desc
limit 1;

-- 16) Show the top 3 most expensive books of 'Fantasy' Genre :

select * from book
where genre='Fantasy'
order by price desc
limit 3;

-- 17) Retrieve the total quantity of books sold by each author:

select author,sum(Quantity) as total_quantity from book
join orders
using(book_id)
group by author;

-- 18) List the cities where customers who spent over $30 are located:
select city from orders
join customers
using(customer_id)
where Total_Amount>30;

-- 19)Find the customer who spent the most on orders:
select name from customers
join orders
using(customer_id)
group by Customer_ID
order by sum(total_amount) desc
limit 1;

-- 20)Calculate the stock remaining after fulfilling all orders:

select book_id,title,sum(stock)-sum(Quantity) as remaining_stock from book
join orders
using(book_id)
group by book_id;
-- or
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM book b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;