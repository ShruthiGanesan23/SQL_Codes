/*Q1- create a database called 'assignment' */
create database assignment; 

use assignment;

/*Q3a- Create a table called countries with the following columns
name, population, capital - choose appropriate datatypes for the columns*/

create table countries (
name varchar(20),
population integer,
capital varchar (20));

insert into countries values 
('China',1382,'Beijing'),
('India',1326,'Delhi'),
('United States',324,'Washington D.C.'),
('Indonesia',260 ,'Jakarta'),
('Brazil',209 ,'Brasilia'),
('Pakistan',193 ,'Islamabad'),
('Nigeria',187 ,'Abuja'),
('Bangladesh',163 ,'Dhaka'),
('Russia',143 ,'Moscow'),
('Mexico',128 ,'Mexico City'),
('Japan',126 ,'Tokyo'),
('Philippines',102 ,'Manila'),
('Ethiopia',101 ,'Addis Ababa'),
('Vietnam',94,'Hanoi'),
('Egypt',93,'Cairo'),
('Germany',81,'Berlin'),
('Iran',80,'Tehran'),
('Turkey',79,'Ankara'),
('Congo',79,'Kinshasa'),
('France',64,'Paris'),
('United Kingdom',65,'London'),
('Italy',60,'Rome'),
('South Africa',55,'Pretoria'),
('Myanmar',54,'Naypyidaw');

/*Q3b- Add a couple of countries of your choice*/
insert into countries values 
('Srilanka',1200,'Colombo'),
('South Africa',1367,'Cape Town');

/*Q3c- Change ‘Delhi' to ‘New Delhi'*/
update countries set capital = 'New Delhi' where name = 'India';

/*Q4- Rename the table countries to big_countries .*/
rename table countries to Big_countries;

/*Q5a*/
create table Product(
Product_id integer AUTO_INCREMENT, 
Product_name varchar(20) NOT NULL,
Supplier_id integer,
constraint PK_Product_id PRIMARY KEY (Product_id),
constraint UC_Product_name UNIQUE (Product_name),
constraint FK_Supplier_id FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

/*Q5b*/
create table suppliers(
supplier_id integer,
Supplier_name varchar(20),
location varchar(20),
constraint PK_supplier_id PRIMARY KEY (supplier_id)
); 

/*Q5c*/
create table stock(
id integer,
product_id integer,
Balance_stock integer,
constraint PK_id PRIMARY KEY (id),
constraint FK_product_id FOREIGN KEY (product_id) REFERENCES product(product_id)
);

/*Q6- Enter some records into the three tables.*/
insert into product values (1,'Washing Machine',100),
(2,'Refrigerator',101),
(3,'Fax Machine',102),
(4,'Printer',103),
(5,'Air conditioner',104);

insert into suppliers values(100,'Dinesh','CHN'),
(101,'Jake','BLR'),
(102,'Jeff','HYD'),
(103,'Kim','KA'),
(104,'Gils','KL');

insert into stock values (910,1,123),
(911,2,234),
(912,3,345),
(913,4,456),
(914,5,567);

/*Q7- Modify the supplier table to make supplier name unique and not null.*/
alter table suppliers 
modify supplier_name varchar(20) UNIQUE NOT NULL;

/*Q8a- a.	Add a column called deptno*/
alter table emp 
add column dept_no integer ;

/*Q8b- Set the value of deptno in the following order*/
update emp
set dept_no = 
  case
    when emp_no % 2 = 0 then 20
    when emp_no % 3 = 0 then 30
    when emp_no % 4 = 0 then 40
    when emp_no % 5 = 0 then 50
    else 10
  end;

/*Q9- Create a unique index on the emp_id column*/
CREATE UNIQUE INDEX idx_emp_no ON emp(emp_no);

/*Q10- Create a view called emp_sal on the emp table by selecting 
the following fields in the order of highest salary to the lowest salary*/
create view emp_sal as
select emp_no, first_name, last_name, salary
from emp
order by salary desc;

/* OUTPUT FOR ASSIGNMENT 1*/

show databases; /*Q1- create a database called 'assignment' */
show tables; /*Q2- list of tables from the incorporated consolidates table*/
Select * from big_countries; /*Q3a,Q3b,Q3c,Q4- created the table named countries, inserted the given values, inserted 2 more records, changed delhi to new delhi,
renamed the table from countries to big_countries*/
select * from product; /*Q5,Q6- created and inserted values into the product table as per requirements*/
select * from suppliers; /*Q5,Q6- created and inserted values into the suppliers table as per requirements*/
select * from stock; /*Q5,Q6- created and inserted values into the stock table as per requirements*/
desc suppliers; /*Q7- modified the supplier table to make supplier name unique and not null*/
select * from emp; /*Q8a,Q8b- Added a column called deptno, had set the value of deptno as per the question*/
show index from emp; /*Q9- Created a unique index on the emp_no column in the table named emp*/
select * from emp_sal; /*Q10- Created a view called emp_sal on the emp table and arranged the salary in desc order*/