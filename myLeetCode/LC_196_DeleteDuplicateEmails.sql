/*  Write a SQL query to delete all duplicate email entries in a table named
        Person, keeping only unique emails based on its smallest Id.
        Id is the primary key column for this table.
        Your output must be the whole Person table after executing your sql.
+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
*/

CREATE TABLE Person (Id INT NOT NULL PRIMARY KEY, Email VARCHAR(50));

INSERT INTO Person (Id, Email) 
VALUES (1, "john@example.com"), (2, "bob@example.com"), (3, "john@example.com");

DELETE p1 FROM Person p1, Person p2
WHERE p1.Email = p2.Email AND p1.Id > p2.Id;

SELECT * FROM Person;
