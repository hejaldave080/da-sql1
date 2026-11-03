--  Display all columns and all records from the employees table.
select * from employees;
--  Display only employee_name, department, city, and salary
select employee_name,department,city,salary from employees;
--  Display all unique departments.
select distinct department from employees;
--  Display all unique cities.
select distinct city from employees;
--  Display employee_name and salary along with a calculated column showing salary
-- after a 10% increase.
select employee_name, salary,salary*1.1 as increasedSalary from employees;
-- Display the employee records sorted by salary from highest to lowest.
select * from employees order by salary desc;
-- Display the top 5 highest-paid employees.
select * from employees order by salary desc limit 0,5;
--  Display employee_name, department, and experience for employees having more than
-- 5 years of experience.
select employee_name,department,experience from employees where experience >5;
-- Find employees whose salary is greater than ₹60,000.
select * from employees where salary>60000;
--  Find employees whose salary is between ₹50,000 and ₹70,000.
select * from employees where salary between 50000 and 70000;
--  Find employees whose age is greater than 30 and salary is greater than ₹60,000
select * from employees where salary> 60000 and age>30;
--  Find employees who belong to either IT or Finance.
select * from employees where department = 'IT' or 'Finance';
--  Find employees who are not from Delhi or Mumbai.
select * from employees where city not in ('Delhi','Mumbai');
-- Find employees whose experience is between 5 and 10 years.
select * from employees where experience between 5 and 10;
--  Find employees who joined between 2018 and 2022
select * from employees where joining_year between 2018 and 2022;
--  Find employees whose salary is not equal to ₹60,000
select * from employees where salary!=60000;
-- Find employees whose department is in IT, HR, or Finance
select * from employees where department in('IT' ,'HR','Finance');
--  Find employees whose department is not in Sales or HR.
select * from employees where department !='Sales' and department!='HR';
-- Find employees who are from Delhi and either work in IT or Finance
select * from employees where city='Delhi' and department in ('IT','Finance');
--  Find employees whose salary is greater than ₹60,000 but less than ₹80,000.
select * from employees where salary between 60000 and 80000;
--  Find employees who have more than 5 years of experience but joined after 2020.
select * from employees where experience>5 and joining_year>2020;
--  Find employees who are younger than 30 or have more than 8 years of experience.
select * from employees where age<30 or experience>8;
--  Find employees whose salary is greater than ₹70,000 and who are not fromBangalore.
select * from employees where salary >70000 and city !='Bangalore';
--  Find employees whose name starts with the letter A.
select * from employees where employee_name regexp "^A";
--  Find employees whose name ends with the letter a.
select * from employees where employee_name regexp "a$";
--  Find employees whose name contains only alphabets and spaces.
select * from employees where employee_name regexp'^[A-Za-z ]*$';
--  Find employees whose name contains at least one vowel.
select * from employees where employee_name regexp'^[AEIOUaeiou]*$';-- '[AEIOUaeiou]'
--  Find employees whose name has exactly 5 characters.
select * from employees where employee_name regexp '^.....$';--
select * from employees where employee_name regexp '^[A-Za-z]{5} [A-Za-z]*$';
--  Find employees whose name starts with a vowel.
select * from employees where employee_name regexp'^[AEIOUaeiou]';
--  Find employees whose name starts with a vowel and ends with a vowel
select * from employees where employee_name regexp'^[AEIOUaeiou].*[AEIOUaeiou]$';
--  Find employees whose name contains no numbers or special characters.
select * from employees where employee_name regexp '^[A-Za-z]*$'; -- '^[A-Za-z ]*$' , '^[A-Za-z ]+$'
-- Find employees whose city contains only alphabets.
select * from employees where city regexp '^[A-Za-z]*$'; -- '[^0-9]*$'
--  Find employees whose name contains the letter a or A
select * from employees where employee_name like '%a%'; -- '[Aa]'
-- Find employees whose name has at least two vowels
select * from employees where employee_name regexp'^[AEIOUaeiou]{2}$'; -- '^[AEIOUaeiou].*[AEIOUaeiou]$'
-- Find employees whose name starts with A, E, I, O, or U
select * from employees where employee_name regexp'^[AEIOU]';
-- SECTION D
-- Find the number of employees in each department.
select department, count(employee_name) as numEmp from employees
group by department;
 -- Find the number of employees in each city.
select city, count(employee_name) as numEmp from employees group by city;
--  Find the total salary paid by each department.
select department, sum(salary) as numEmp from employees
group by department;
 -- Find the average salary of each department
select department, avg(salary) as avgEmp from employees
group by department;
-- Find the maximum salary in each department
select department, max(salary) as maxEmp from employees
group by department;
-- Find the minimum salary in each department.
select department, min(salary) as minEmp from employees
group by department;
-- Find the average age of employees in each department.
select department, avg(salary) as avgEmp from employees
group by department;
-- Find the total experience of employees in each department
select department, sum(experience) as numEmp from employees group by department ;
-- Find the number of employees hired in each joining year
select joining_year, count(employee_name) as countEmp from employees group by joining_year;
--  Find the average salary for each city.
select city, avg(salary) as AvgEmp from employees group by city;

-- 46. Find departments having more than 100 employees.
select department , count(employee_name) as Countemp from employees group by department having Countemp>100;
-- 47. Find departments where the average salary is greater than ₹65,000.
select department , avg(salary) as avgsalary from employees group by department having avgsalary>65000;
-- 48. Find cities where the total salary expense is greater than ₹10,000,000.
select city , sum(salary)as totalsalary from employees group by city having totalsalary>10000000;
-- 49. Find departments where the maximum salary is greater than ₹100,000. 
select department , max(salary) as maxsalary from employees group by department having maxsalary> 100000;
-- 50. Find departments where the minimum salary is greater than ₹40,000.
select department , min(salary) as minsalary from employees group by department having minsalary> 40000;
-- 51. Find the department with the highest average salary. 
select department , avg(salary) as avgsalary from employees group by department order by avgsalary;
-- 52. Find the city with the highest number of employees.
select city,count(*)as employe from employees group by city order by employe desc;
-- 53. Find employees whose salary is higher than the overall average salary.
select * from employees where salary> (select *,avg(salary) from employees group by ;
-- 54. Find employees whose salary is higher than the average salary of their department.

-- 55. Find departments where the average salary is greater than ₹70,000 OR employee count is greater than 300
select department , avg(salary) as avgsalary from employees group by department having avgsalary >70000 or count(*)>300;