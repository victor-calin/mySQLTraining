/* Given a Weather table, write a SQL query to find all dates' Ids with higher
        temperature compared to its previous (yesterday's) dates.
+----+------------+-------------+
| Id | RecordDate | Temperature |
+----+------------+-------------+
| 1  | 2015-01-01 |     10      |
| 2  | 2015-01-02 |     25      |
| 3  | 2015-01-03 |     20      |
| 4  | 2015-01-04 |     30      |
+---+-------------+-------------+
*/

CREATE TABLE Weather (Id INT, RecordDate Date, Temperature INT);

INSERT INTO Weather (Id, RecordDate, Temperature)
VALUES (1, '2015-01-01', 10), (2, '2015-01-02', 25),
       (3, '2015-01-03', 20), (4, '2015-01-04', 30);
       
SELECT Weather.Id FROM Weather
JOIN Weather copy 
ON DATEDIFF(Weather.RecordDate, copy.RecordDate) = 1
AND Weather.Temperature > copy.Temperature;