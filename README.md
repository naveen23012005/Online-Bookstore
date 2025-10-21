## SQL Project: Online Bookstore
### Overview

This project demonstrates SQL query skills by analyzing and managing data from an Online Bookstore.
It involves working with three CSV datasets — Books, Customers, and Orders — that share common keys to establish relationships between the tables.

### Dataset Information

| File Name       | Description                                                                                | Key Columns                          |
| --------------- | ------------------------------------------------------------------------------------------ | ------------------------------------ |
| `Books.csv`     | Contains details about books including title, author, genre, price, and stock.             | `Book_ID`                            |
| `Customers.csv` | Contains customer information such as name, city, and country.                             | `Customer_ID`                        |
| `Orders.csv`    | Records order details, including book IDs, customer IDs, quantity, date, and total amount. | `Order_ID`, `Book_ID`, `Customer_ID` |

### Basic SQL Queries

1)Retrieve all books in the “Fiction” genre.

2)Find books published after 1950.

3)List all customers from Canada.

4)Show orders placed in November 2023.

5)Retrieve the total stock of books available.

6)Find details of the most expensive book.

7)Show all customers who ordered more than 1 quantity of a book.

8)Retrieve all orders where the total amount exceeds $20.

9) List all genres available in the Books table.

10)Find the book with the lowest stock.

11)Calculate the total revenue generated from all orders.

### Advanced SQL Queries

12)Retrieve the total number of books sold for each genre.

13)Find the average price of books in the "Fantasy" genre.

14)List customers who have placed at least 2 orders.

15) Find the most frequently ordered book.

16)Show the top 3 most expensive books in the Fantasy genre.

17)Retrieve the total quantity of books sold by each author.

18)List the cities where customers who spent over $30 are located.

19) Find the customer who spent the most on orders.

20)Calculate the stock remaining after fulfilling all orders.

### Concepts Covered

-
-  SQL SELECT, WHERE, GROUP BY, HAVING, ORDER BY

- JOINs (INNER, LEFT, RIGHT)

- Aggregate functions: SUM(), COUNT(), AVG(), MAX(), MIN()

- Subqueries and Nested Queries

- Data filtering and sorting

- Basic data cleaning and relationship setup between tables

### Expected Outcome

- By completing this project, you will:

- Gain hands-on experience with real-world SQL operations.

- Understand data relationships and query optimization.

- Be able to write both basic and advanced SQL queries for data analysis.

