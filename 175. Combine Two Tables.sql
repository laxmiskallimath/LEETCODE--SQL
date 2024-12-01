create database leetcode;
use leetcode;

-- 175. Combine Two Tables
/*Table: Person
+-------------+---------+
| Column Name | Type |
+-------------+---------+
| PersonId | int |
| FirstName | varchar |
| LastName | varchar |
+-------------+---------+
PersonId is the primary key column for this table.

Table: Address
+-------------+---------+
| Column Name | Type |
+-------------+---------+
| AddressId | int |
| PersonId | int |
| City | varchar |
| State | varchar |
+-------------+---------+
AddressId is the primary key column for this table.
Write a SQL query for a report that provides the following information for each
person in the Person table, regardless if there is an address for each of those
people:
FirstName, LastName, City, State 
*/

DROP TABLE IF EXISTS PERSON;

DROP TABLE IF EXISTS ADDRESS;

create table person(
PersonId int primary key,
FirstName varchar(100),
LastName varchar(100)
);

create table address(
AddressId int primary key,
PersonID int,
City varchar(100),
State varchar(100),
foreign key(PersonId) references Person(PersonId)
);

INSERT INTO Person (PersonId, FirstName, LastName)
VALUES 
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Mike', 'Johnson');

INSERT INTO Address (AddressId, PersonId, City, State)
VALUES 
(1, 1, 'New York', 'NY'),
(2, 2, 'Los Angeles', 'CA'),
(3, 3, 'Chicago', 'IL');

select * from person;

select * from address;

/*Write a SQL query for a report that provides the following information for each
person in the Person table, regardless if there is an address for each of those
people:
FirstName, LastName, City, State */

select 
      FirstName, 
	  LastName, 
      City,
      State
from 
     person p1
left join 
     address a1
on 
    p1.PersonId = a1. PersonId;
     
-- A LEFT JOIN ensures that all rows from the Person table are included, 
-- even if there is no matching row in the Address table.
