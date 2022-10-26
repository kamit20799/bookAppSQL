create database bookstore1;										#created a new database of name: bookstore1
use bookstore1;													#it specifies the file
create table authors1(											#creates a new table, it has 3 columns: authors_id, authors_name, authors_email
	authors_id int not null auto_increment primary key,			# primary key avoid dublications
	authors_name varchar(20) not null,							# int or varchar are datatype parameters
    authors_email varchar(200) not null							
);

insert into authors1 values 									# 'insert into' means insert new item in the records
(1, 'Premchand', 'abs@gmail.com'),
(2, 'J.K. Rowling', 'abq@gmail.com'),
(3, 'Willam Shakespare', 'asd@gmail.com'),
(4, 'Yashpal', 'sf@gmail.com');

create table books1 (											# 'books1' table created
book_id int not null auto_increment primary key,
book_name varchar(50) not null,
book_type varchar(20) not null,
book_price float not null, 
book_stock varchar(20) not null,
auth_id int,
foreign key(auth_id) references authors1(authors_id)			#foreign key is a field, that refers the primary key to the another table
);

insert into books1 values										# data inserted into the 'books1' table
(1, 'Vardaan', 'Autobiography', 220 , 500, 1),
(2, 'Seva Sadan', 'Poetry', 5485 , 500,2),
(3, 'Harry Potter', 'Novels', 54 , 4,3),
(4, 'King Lear', 'Autobiography', 3 , 4,4),
(5, 'Works', 'Romance', 5 , 542,3),
(6, 'As you like it', 'Horror', 215 , 54,1),
(7, 'Divya', 'Autobiography', 2000 , 500,4),
(8, 'Desh Ka Bhavishya', 'Novel', 21 , 500,3),
(9, 'Jhutha Sach', 'Horror', 954 , 0,3);

select * from books1;
select * from authors1 JOIN books1 ON authors1.authors_id = books1.auth_id;

create table customers1(										# 'customers1' table created
cust_id int not null auto_increment primary key,
cust_name varchar(255) not null,
cust_no varchar(255) not null
);

insert into customers1 values 									# data inserted into the 'customers1' table
(1, 'Amit Kumar', '8787878778'),
(2, 'Deepak', '989898998'),
(3, 'Ashish', '9779979797'),
(4, 'Suresh', '7997979797'),
(5, 'Ramesh', '676767677667');

create table favourites1(										# 'favourites1' table created
fav_id int not null auto_increment primary key,
fav_book_name varchar(50) not null,
fav_book_type varchar(20) not null,
c1_id int,
foreign key(c1_id) references customers1(cust_id)
);

insert into favourites1 values 									# data inserted into the 'favourites1' table
(1, 'Vardaan', 'Autobiography', 1),
(2, 'Seva Sadan', 'Poetry', 2),
(3, 'Harry Potter', 'Novels', 3),
(4, 'Divya', 'Autobiography', 4),
(5, 'As you like it', 'Horror', 1),
(6, 'Jutha Sach', 'Horror', 4),
(7, 'Works', 'Romance', 1);

select * from favourites1 JOIN customers1 ON favourites1.fav_id = customers1.cust_id;

select cust_id, cust_name 
from customers1
LEFT JOIN favourites1
ON customers1.cust_id = favourites1.fav_id;

#inner join-> shows only commen between two tables
select * from customers1, favourites1 where customers1.cust_id = favourites1.c1_id;
#or(other way)
select * from customers1
JOIN favourites1
ON customers1.cust_id = favourites1.c1_id;

select customers1.cust_id, cust_name, fav_book_name
from customers1
JOIN  favourites1
ON  customers1.cust_id = favourites1.c1_id;