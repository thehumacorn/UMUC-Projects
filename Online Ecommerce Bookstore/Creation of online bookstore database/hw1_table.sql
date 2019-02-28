DROP TABLE Authors CASCADE CONSTRAINTS;

CREATE TABLE Authors
(
author_id int NOT NULL PRIMARY KEY,
author_fname varchar(15) NOT NULL,
author_initals varchar(3) NOT NULL,
author_lname varchar(15) NOT NULL,
author_dob date NOT NULL,
author_gender varchar(1) NOT NULL,
author_contact_details varchar(30) NOT NULL
);

DROP TABLE Book_Categories CASCADE CONSTRAINTS;
CREATE TABLE Book_Categories
(
Book_cat_id int NOT NULL PRIMARY KEY,
Book_category varchar(15) NOT NULL
);

DROP TABLE Books CASCADE CONSTRAINTS;
CREATE TABLE Books
(
book_id int NOT NULL PRIMARY KEY,
author_id int NOT NULL,
book_cat_id int NOT NULL,
ISBN varchar(13) NOT NULL,
date_publication date NOT NULL,
book_title varchar(30) NOT NULL,
book_profit_price decimal NOT NULL,
FOREIGN KEY(author_id) REFERENCES Authors(author_id),
FOREIGN KEY(book_cat_id) REFERENCES Book_Categories(book_cat_id)
);

DROP TABLE Customers CASCADE CONSTRAINTS;
CREATE TABLE Customers
(
customer_id int NOT NULL PRIMARY KEY,
customer_name varchar(25) NOT NULL,
customer_address varchar(25) NOT NULL,
customer_phone varchar(11) NOT NULL,
customer_email varchar(30) NOT NULL
);

DROP TABLE Orders CASCADE CONSTRAINTS;
CREATE TABLE Orders
(
order_id int NOT NULL PRIMARY KEY,
customer_id int NOT NULL,
order_date date NOT NULL,
order_amount decimal NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

DROP TABLE Ordered_books CASCADE CONSTRAINTS;
CREATE TABLE Ordered_books
(
order_book_number int NOT NULL PRIMARY KEY,
order_id int NOT NULL,
book_id int NOT NULL,
book_ decimal NOT NULL,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
DESCRIBE Authors;
DESCRIBE Book_Categories;
DESCRIBE Books;
DESCRIBE Customers;
DESCRIBE Orders;
DESCRIBE Ordered_books

CREATE USER matt IDENTIFIED BY MyPassword;
GRANT CONNECT, RESOURCE, DBA TO matt;
GRANT CREATE SESSION TO matt; 
GRANT UNLIMITED TABLESPACE TO matt;
DROP USER matt;
