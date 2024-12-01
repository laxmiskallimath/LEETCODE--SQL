-- 176 Second Highest Salary

/* Write a SQL query to get the second highest salary from the Employee table.
+----+--------+
| Id | Salary |
+----+--------+
| 1 | 100 |
| 2 | 200 |
| 3 | 300 |
+----+--------+
*/

USE LEETCODE;

DROP TABLE IF EXISTS employee;

Create Table employee(
ID int primary key,
Salary int);


INSERT INTO Employee (Id, Salary)
VALUES 
(1, 100),
(2, 200),
(3, 300);

-- Normal Approach using max,sub query,simple sql with distinct and limit,with cte and rank function 

SELECT MAX(SALARY) FROM EMPLOYEE
WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEE);

-- BUT THIS IS NOT REQUIRED OUTPUT 

-- LESTS TRY WITH SUBQUERY 
SELECT SALARY FROM
(SELECT SALARY FROM EMPLOYEE ORDER BY SALARY DESC LIMIT 2) RESULT 
ORDER BY SALARY 
LIMIT 1;

-- THIS IS ALSO NOT REQUIRED OUTPUT 

-- LETS TRY WITH CTE 
 with cte as
(select *,
       dense_rank()over(order by salary desc) as rankk
from 
      employee)
select salary 
from cte 
where rankk = 2;

-- NO LUCK

-- or 

SELECT DISTINCT SALARY 
FROM EMPLOYEE 
ORDER BY SALARY DESC
LIMIT 1 OFFSET 1;


-- So Requirement is given the above Employee table, the query should return 200 as the second highest salary.
--  If there is no second highest salary, then the query should return null.
-- Here point is If there is no second highest salary, then the query should return null.
-- Our Final Solution will be 
select ifnull((
select distinct salary from employee 
order by salary desc 
limit 1 offset 1),null) as SecondHighestSalary;



-- lets try without second highest salary in a table 

CREATE TABLE Employee_with_no_2nd_highest_salary (
    Id INT PRIMARY KEY,
    Salary INT
);

-- Insert sample data with no distinct second-highest salary
INSERT INTO Employee_with_no_2nd_highest_salary (Id, Salary) VALUES
(1, 100),
(2, 100);


select ifnull((
select distinct salary from Employee_with_no_2nd_highest_salary 
order by salary desc
limit 1 offset 1) ,null) as SecondHighestSalary;












