/* Dropping previously created tables named Authors */
DROP TABLE Authors CASCADE CONSTRAINTS;

/* Creating table named Authors */
CREATE TABLE Authors
(
author_id int NOT NULL PRIMARY KEY,
author_fname varchar(15) NOT NULL,
author_initals varchar(3) NOT NULL,
author_lname varchar(15) NOT NULL,
author_dob date NOT NULL,
author_gender varchar(1) NOT NULL,
author_contact_details varchar(100) NOT NULL
);
/* populating authors table */ 
INSERT into authors values(1, 'Mark', 'MT', 'Twain', to_date('1835-11-30','yyyy-mm-dd'), 'M', 'No Longer Living');
INSERT into authors values(2, 'J. K.', 'JKR', 'Rowlings', to_date('1965-07-31','yyyy-mm-dd'), 'F', 'Twitter - @jk_rowling, Mail- J.K. Rowling c/o Arthur A Levine Books 557 Broadway New York, NY 10012');
INSERT into authors values(3, 'Dr.', 'TSG', 'Suess', to_date('1904-03-02','yyyy-mm-dd'), 'M', 'No Longer Living');
INSERT into authors values(4, 'Edgar Allen', 'EAP', 'Poe', to_date('1809-01-19','yyyy-mm-dd'), 'M', 'No Longer Living');
INSERT into authors values(5, 'F. Scott', 'FSF', 'Fitzgerald', to_date('1940-12-21','yyyy-mm-dd'), 'M', 'No Longer Living');

/* Displaying table contents from Authors */
Select * from Authors;

/* Dropping previously created tables named Book_Categories */
DROP TABLE Book_Categories CASCADE CONSTRAINTS;

/* Creating table named Book_Categories */
CREATE TABLE Book_Categories
(
Book_cat_id int NOT NULL PRIMARY KEY,
Book_category varchar(25) NOT NULL
);
/* populating book_categories table */ 
INSERT into book_categories values(1, 'Fantasy');
INSERT into book_categories values(2, 'Childrens literature');
INSERT into book_categories values(3, 'Historical Fiction');
INSERT into book_categories values(4, 'Non-Fiction');
INSERT into book_categories values(5, 'Poem');

/* Displaying table contents from book_categories */
Select * from book_categories;

/* Dropping previously created tables named Books */
DROP TABLE Books CASCADE CONSTRAINTS;

/* Creating table named Books */
CREATE TABLE Books
(
book_id int NOT NULL PRIMARY KEY,
author_id int NOT NULL,
book_cat_id int NOT NULL,
ISBN varchar(14) NOT NULL,
date_publication date NOT NULL,
book_title varchar(80) NOT NULL,
book_profit_price decimal(5,2) NOT NULL,
FOREIGN KEY(author_id) REFERENCES Authors(author_id),
FOREIGN KEY(book_cat_id) REFERENCES Book_Categories(book_cat_id)
);
/* populating books table */ 
INSERT into books values(1, 1, 2, '978-1503215672', to_date('2018-08-25','yyyy-mm-dd'), 'The Adventures of Tom Sawyer', 8.99);
INSERT into books values(2, 2, 1, '978-1338263893', to_date('2018-11-18','yyyy-mm-dd'), 'Fantastic Beasts: The Crimes of Grindelwald - The Original Screenplay', 16.50);
INSERT into books values(3, 3, 2, '978-0394800134', to_date('1960-03-12','yyyy-mm-dd'), 'One Fish Two Fish Red Fish Blue Fish', 9.15);
INSERT into books values(4, 4, 5, '978-1512399042', to_date('2015-05-29','yyyy-mm-dd'), 'The Raven', 6.95);
INSERT into books values(5, 5, 3, '978-0743273565', to_date('2004-09-30','yyyy-mm-dd'), 'The Great Gatsby', 12.21);

/* Displaying table contents from books */
Select * from books;

/* Dropping previously created tables named Customers */
DROP TABLE Customers CASCADE CONSTRAINTS;

/* Creating table named Customers */
CREATE TABLE Customers
(
customer_id int NOT NULL PRIMARY KEY,
customer_name varchar(25) NOT NULL,
customer_address varchar(80) NOT NULL,
customer_phone varchar(25) NOT NULL,
customer_email varchar(30) NOT NULL
);
/* populating customers table */ 
INSERT into customers values(1, 'Stephanie G Stalvey', '2007 Birch Street, El Paso, Texas(TX), 79901', '915-479-6627', 'gerald1982@yahoo.com');
INSERT into customers values(2, 'Adelia C Crenshaw', '3984 Morris Street, Karnes City, Texas(TX), 78118', '830-623-5183', 'baylee1984@hotmail.com');
INSERT into customers values(3, 'Wesley L Brantley', '4762 Coal Road, Lewisburg, Pennsylvania(PA), 17837', '570-939-6062', 'janie1981@yahoo.com');
INSERT into customers values(4, 'Terry T Hyde', '3054 Marshville Road, New York, New York(NY), 10007', '646-841-0599', 'tyler1999@yahoo.com');
INSERT into customers values(5, 'Larry D Rios', '3755 Comfort Court, Wisconsin Dells, Wisconsin(WI), 53965', '414-201-9279', 'cordell.dool@gmail.com');

/* Displaying table contents from customers */
Select * from customers;

/* Dropping previously created tables named Orders */
DROP TABLE Orders CASCADE CONSTRAINTS;

/* Creating table named Orders */
CREATE TABLE Orders
(
order_id int NOT NULL PRIMARY KEY,
customer_id int NOT NULL,
order_date date NOT NULL,
order_amount decimal(5,2) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
/* populating orders table */ 
INSERT into orders values(1, 2, to_date('2010-01-12','yyyy-mm-dd'), 18.14);
INSERT into orders values(2, 3, to_date('2011-01-23','yyyy-mm-dd'), 19.16);
INSERT into orders values(3, 4, to_date('2012-06-16','yyyy-mm-dd'), 25.49);
INSERT into orders values(4, 1, to_date('2015-09-03','yyyy-mm-dd'), 8.99);
INSERT into orders values(5, 5, to_date('2018-03-15','yyyy-mm-dd'), 6.95);

/* Displaying table contents from orders */
Select * from orders;

/* Dropping previously created tables named Ordered_books */
DROP TABLE Ordered_books CASCADE CONSTRAINTS;

/* Creating table named Ordered_books */
CREATE TABLE Ordered_books
(
order_book_number int NOT NULL PRIMARY KEY,
order_id int NOT NULL,
book_id int NOT NULL,
book_price decimal(5,2) NOT NULL,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
/* populating ordered_books table */ 
INSERT into ordered_books values(1, 2, 1 , 8.99);
INSERT into ordered_books values(2, 2, 2 , 16.5);
INSERT into ordered_books values(3, 3, 5, 12.21);
INSERT into ordered_books values(4, 3, 4, 6.95);
INSERT into ordered_books values(5, 4, 1 , 8.99);
INSERT into ordered_books values(6, 1, 1, 8.99);
INSERT into ordered_books values(7, 1, 3, 9.15);
INSERT into ordered_books values(8, 5, 4, 6.95);

/* Displaying table contents from ordered_books */
Select * from ordered_books;

/* Displaying table contents from Authors that is ordered by the authors_id */
SELECT author_id, author_lname, author_fname, author_dob FROM Authors ORDER BY author_id;

/* Displaying table contents from customers that is orderedby the customers_name */
SELECT customer_id, customer_name, customer_address, customer_phone, customer_email FROM customers ORDER BY customer_name;

/* Displaying table contents from books that is ordered by each book's ISBN number */
SELECT ISBN, book_title FROM Books ORDER BY ISBN;

/* Creating a view named view_name that inner joins order_id, customer_name, and order_date */
CREATE VIEW view_name AS
SELECT orders.order_id, customers.customer_name, orders.order_date
From orders
INNER JOIN customers ON orders.customer_id=Customers.customer_id;

/* Displays view_name */
SELECT * FROM view_name;

/* Updates a customers name with another and then displays the change */
UPDATE customers SET customer_name = 'Vickie E Remsberg' WHERE customer_id = 04;
SELECT * FROM Customers;

/* Displays each tables framework */
DESCRIBE Authors;
DESCRIBE Book_Categories;
DESCRIBE Books;
DESCRIBE Customers;
DESCRIBE Orders;
DESCRIBE Ordered_books

/* Creating sql database user named matt with password - MyPassword */
CREATE USER matt IDENTIFIED BY MyPassword;

/* Granting user - matt a connection to sql database and permissions */
GRANT CONNECT, RESOURCE, DBA TO matt;
GRANT CREATE SESSION TO matt;
GRANT UNLIMITED TABLESPACE TO matt;

/* Dropping user - matt */
DROP USER matt;
