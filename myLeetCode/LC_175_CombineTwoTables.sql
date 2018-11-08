/*  Table: Person
    PersonId is the primary key column for this table.
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+
    Table: Address
    AddressId is the primary key column for this table.
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
    Write a SQL query for a report that provides the following information
        for each person in the Person table, regardless if there is an address
        for each of those people:
    FirstName, LastName, City, State
*/

CREATE TABLE Person (PersonId INT NOT NULL PRIMARY KEY,
                     FirstName VARCHAR(50), LastName VARCHAR(50));
CREATE TABLE Address (AddressId INT NOT NULL PRIMARY KEY,
                     PersonId INT NOT NULL,
                     City VARCHAR(50), State VARCHAR(50));

SELECT FirstName, LastName, City, State
FROM Person LEFT JOIN Address 
ON Person.PersonId = Address.PersonId;