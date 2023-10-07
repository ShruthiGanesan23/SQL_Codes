use assignment;

select * from employee
where deptno=10 and (salary>3000); /* Q1- select all employees in department 10 whose salary is greater than 3000. [table: employee]*/

Select count(*) as FirstClassCount
from students
Where marks >= 50 and marks <= 80; /* Q2.a - How many students have graduated with first class? */

Select count(*) as DistinctionCount
from students
where marks > 80 and marks <= 100; /* Q2.b - How many students have obtained distinction? */

Select distinct city
from station
where id % 2 = 0; /*Q3- list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]*/

Select count(*) - count(distinct city) as difference from station; 
/* Q4- Find the difference between the total number of city entries in the table and the number of distinct city entries in the table*/

Select distinct city from station 
where left(city, 1) in ('a', 'e', 'i', 'o', 'u'); /* Q5a- Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
Your result cannot contain duplicates*/

Select distinct city from station 
where left(city, 1) in ('a', 'e', 'i', 'o', 'u') and 
right(city,1) in ('a', 'e', 'i', 'o', 'u')
order by city asc;
/*Q5b- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
 Your result cannot contain duplicates*/

Select distinct city From station 
where left(city, 1) not in ('a', 'e', 'i', 'o', 'u'); /*Q5c- Query the list of CITY names from STATION that do not start with vowels.
Your result cannot contain duplicates*/

Select distinct city from station 
where left(city, 1) not in ('a', 'e', 'i', 'o', 'u') and 
right(city,1) not in ('a', 'e', 'i', 'o', 'u')
order by city asc; 
/*Q5d- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
Your result cannot contain duplicates. [table: station]*/

select concat(First_name," ",last_name) as emp_name from emp
where salary>2000 and datediff(current_date(),hire_date)<36
order by salary desc; 
/*Q6- Write a query that prints a 
list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. 
Sort your result by descending order of salary. [table: emp]*/

Select deptno, sum(salary) as total_salary
from employee
group by deptno; /*Q7- How much money does the company spend every month on salaries for each department? [table: employee]*/

select count(name) as city_count from city
where population>100000; /*Q8- How many cities in the CITY table have a Population larger than 100000. [table: city]*/

select sum(population) as California_population 
from city
where district = 'california'; /*Q9- What is the total population of California? [table: city]*/

Select countrycode, avg(population) as average_population
from city
group by countrycode; /*Q10- What is the average population of the districts in each country? [table: city]*/

select o.ordernumber, o.status, o.customernumber, c.customername, o.comments
from orders as o 
left join customers as c
on o.customernumber = c.customernumber
where o.status = 'Disputed';
/*Q11- Find the ordernumber, status, customernumber, customername 
and comments for all orders that are ‘Disputed' [table: orders, customers]*/
