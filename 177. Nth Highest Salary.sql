-- 177. Nth Highest Salary
/*
Write a SQL query to get the nth highest salary from the Employee table.
+----+--------+
| Id | Salary |
+----+--------+
| 1 | 100 |
| 2 | 200 |
| 3 | 300 |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2
is 200. If there is no nth highest salary, then the query should return null.
*/
use leetcode;

drop table if exists Employee;

CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Salary INT
);

INSERT INTO Employee (Id, Salary) VALUES (1, 100);
INSERT INTO Employee (Id, Salary) VALUES (2, 200);
INSERT INTO Employee (Id, Salary) VALUES (3, 300);

select * from Employee_Table;

DELIMITER //

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
DETERMINISTIC
BEGIN
    SET N = N - 1;

    RETURN (
        SELECT DISTINCT Salary
        FROM Employee
        ORDER BY Salary DESC
        LIMIT 1 OFFSET N
    );
END //

DELIMITER ;

SELECT getNthHighestSalary(4);
 
