/*  Write a SQL query to find all duplicate emails in a table named Person.
    Note: All emails are in lowercase.
+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
*/

CREATE TABLE Person (Id INT, Email VARCHAR(20));

INSERT INTO Person (Id, Email)
    VALUES (1, "a@b.com"),
           (2, "c@d.com"),
           (3, "a@b.com");
           
SELECT Email FROM Person
    GROUP BY Email
    HAVING COUNT(Email) > 1;