/*  X city opened a new cinema, many people would like to go to this cinema. 
    The cinema also gives out a poster indicating the movies’ ratings and
        descriptions. Please write a SQL query to output movies with an odd
        numbered ID and a description that is not 'boring'. 
    Order the result by rating.
+---------+-----------+--------------+-----------+
|   id    | movie     |  description |  rating   |
+---------+-----------+--------------+-----------+
|   1     | War       |   great 3D   |   8.9     |
|   2     | Science   |   fiction    |   8.5     |
|   3     | irish     |   boring     |   6.2     |
|   4     | Ice song  |   Fantasy    |   8.6     |
|   5     | House card|   Interesting|   9.1     |
+---------+-----------+--------------+-----------+
*/

CREATE TABLE cinema 
    (id INT, movie VARCHAR(50), description VARCHAR(100), rating float(2, 1));
    
INSERT INTO cinema (id, movie, description, rating)
VALUES (1, "War", "great 3D", 8.9),
       (2, "Science", "fiction", 8.5),
       (3, "irish", "boring", 6.2),
       (4, "Ice song", "Fantasy", 8.6),
       (5, "House card", "Interesting", 9.1);


SELECT * FROM cinema
    WHERE id % 2 != 0 AND description != "boring"
    ORDER BY rating DESC;

    

