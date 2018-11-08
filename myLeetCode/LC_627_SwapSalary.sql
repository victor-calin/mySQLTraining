/* Given a table salary, such as the one below, that has m=male and f=female
        values. Swap all f and m values (i.e., change all f values to m and
        vice versa) with a single update query and no intermediate temp table.
| id | name | sex | salary |
|----|------|-----|--------|
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |
*/

CREATE TABLE salary (
    id INT,
    name VARCHAR(20),
    sex CHAR(1),
    salary INT
);

INSERT INTO salary (id, name, sex, salary)
    VALUES
        (1, 'A', 'm', 2500),
        (2, 'B', 'f', 1500),
        (3, 'C', 'm', 5500),
        (4, 'D', 'f', 500);


UPDATE salary
    SET
        sex = CASE
            WHEN sex = 'm' THEN 'f'
            ELSE 'm'
        END;