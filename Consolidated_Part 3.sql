use assignment;

 /* Q1- Write a stored procedure that accepts the month and year as inputs and prints the ordernumber,
 orderdate and status of the orders placed in that month
 eg. call order_status(2005, 11);. */
 
/*CREATE DEFINER=`root`@`localhost` PROCEDURE `Q1_Order_status`(year int,month int)
BEGIN
Select ordernumber, orderdate, status
    From orders
    WHERE YEAR(orderdate) = year AND MONTH(orderdate) = month;
END*/
 call assignment.Q1_Order_status(2004, 04); 

 
 /*Q2a- Write function that takes the customernumber as input and returns the purchase_status 
 based on the following criteria . [table:Payments]
if the total purchase amount for the customer is < 25000 status = Silver, 
amount between 25000 and 50000, status = Gold
if amount > 50000 Platinum

stored function code --

CREATE DEFINER=`root`@`localhost` FUNCTION `purchase_function`(cid int) RETURNS varchar(10) CHARSET utf8mb4
BEGIN
declare total_amount int;
declare purchase_status varchar(10);
select sum(amount) into total_amount from Payments where customernumber = cid;
if total_amount < 25000 then
		set purchase_status = 'Silver';
elseif total_amount between 25000 and 50000 then
        set purchase_status = 'Gold';
        else
        set purchase_status = 'Platinum';
    end if;
    RETURN purchase_status;
END */
select customerNumber,purchase_function(customerNumber) as "purchase_status" from payments
group by customerNumber;
select assignment.purchase_function(114);

/*Q2b- . Write a query that displays customerNumber, customername and purchase_status from customers and payments table*/
select c.customerNumber, c.customername, Purchase_function(c.customerNumber) as purchase_status from customers c
join (
    select customernumber, SUM(amount) as total_amount
    from payments
    group by customernumber
) p
 on c.customerNumber = p.customernumber; 
 
 /*Q3- Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. 
 Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.
 
 TRIGGER CODE FOR AFTER DELETE
 
 CREATE DEFINER=`root`@`localhost` TRIGGER `movies_AFTER_DELETE` AFTER DELETE ON `movies` FOR EACH ROW 
 BEGIN
    DELETE FROM rentals 
    WHERE movieid = OLD.id;
 END

TRIGGER CODE FOR AFTER UPDATE

CREATE DEFINER=`root`@`localhost` TRIGGER `movies_AFTER_UPDATE` AFTER UPDATE ON `movies` FOR EACH ROW 
BEGIN
    UPDATE rentals
    SET movieid = new.id
    where movieid = old.id;
END*/
 
/*Q4- Select the first name of the employee who gets the third highest salary. [table: employee]*/
select fname,salary from employee
order by salary desc
limit 1 offset 2; 

/* Q5- Assign a rank to each employee  based on their salary. 
The person having the highest salary has rank 1. [table: employee]*/
select empid,fname,lname,salary,
dense_rank() over(order by salary desc) as "Rank"
from employee; 
