CREATE DATABASE proiect_mysql;
USE proiect_mysql;


/* This is a course-training database of a medical clinic in which I added patients, doctors, specialities and the consultation diagnosis. Afterwards I followed the project requirements.
*/

/* Requirment 1: Create a database with 4 tables and the specific links between them.
*/

CREATE TABLE pacienti ( 
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nume VARCHAR(30) NOT NULL,
prenume VARCHAR(30) NOT NULL,
cnp VARCHAR(30) NOT NULL UNIQUE,
data_nasterii DATE NOT NULL,
telefon VARCHAR(30) NOT NULL,
email VARCHAR(30)
);

CREATE TABLE specializare (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
denumire VARCHAR(30) NOT NULL
);

CREATE TABLE doctori (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nume VARCHAR(30) NOT NULL,
prenume VARCHAR(30) NOT NULL,
grad VARCHAR(30),
experienta DATE,
id_specializare INT NOT NULL,
CONSTRAINT id_specialiazare_fk1 FOREIGN KEY (id_specializare) REFERENCES specializare (id)
);

CREATE TABLE diagnostic (
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_pacient INT NOT NULL,
id_doctor INT NOT NULL,
id_specializare INT NOT NULL,
denumire_diagnostic VARCHAR(100) NOT NULL,
data_consult DATE NOT NULL,
CONSTRAINT id_pacient_fk FOREIGN KEY (id_pacient) REFERENCES pacienti(id),
CONSTRAINT id_doctor_fk FOREIGN KEY (id_doctor) REFERENCES doctori(id),
CONSTRAINT id_specialiazare_fk2 FOREIGN KEY (id_specializare) REFERENCES specializare(id)
);


INSERT INTO pacienti (id, nume, prenume, cnp, data_nasterii, telefon, email) VALUES
(1, 'Popescu', 'Mihai', '12345678', '1963-10-01', '02336565', 'PopeM@mail.com'),
(2, 'Pop', 'Viorel', '12345312', '1985-10-22', '02338585', 'PopV@mail.com'),
(3, 'Ionescu', 'Vasile', '12345322', '1991-02-20', '02338747', 'IonV@mail.com'),
(4, 'Cretu', 'Mihai', '12323312', '1978-09-01', '02335545', 'CreM@mail.com'),
(5, 'Dragomir', 'Dumitru', '12345225', '1940-12-12', '02335565', 'DraD@mail.com'),
(6, 'Popescu', 'Cristi', '12342313', '1975-03-25', '02336869', 'PopC@mail.com'),
(7, 'Sandu', 'Elena', '12346321', '1988-10-24', '02333547', 'SanE@mail.com'),
(8, 'Albu', 'Ana', '12342378', '1971-06-01', '02335257', 'AlbA@mail.com'),
(9, 'Negru', 'Oana', '12346978', '1959-04-14', '02336364', 'NegO@mail.com'),
(10, 'Rosu', 'Florin', '12343585', '1980-11-12', '02335875', 'RosF@mail.com');

INSERT INTO specializare (id, denumire) VALUES
(1, 'Chirurgie'),
(2, 'ORL'),
(3, 'Cardiologie'),
(4, 'Oftalmologie'),
(5, 'Stomatologie'),
(6, 'Dermatologie');

INSERT INTO doctori (id, nume, prenume, grad, experienta, id_specializare) VALUES
(1, 'Stan', 'Eugen','primar', '1990-06-20', 1),
(2, 'Stoica', 'Florin','primar', '1998-06-20', 1),
(3, 'Popescu', 'Valerica','specialist', '1987-06-20', 2),
(4, 'Costea', 'Mihai','profesor', '1988-06-20', 3),
(5, 'Codrea', 'Mihaela','rezident', '2017-06-20', 4),
(6, 'Petrescu', 'Stela','specialist', '2000-06-20', 4),
(7, 'Dima', 'Ioana','specialist', '1991-06-20', 5),
(8, 'Petrache', 'Tina','primar', '1978-06-20', 5),
(9, 'Nita', 'Ioan','specialist', '2005-06-20', 6),
(10, 'Neamtu', 'Elena','rezident', '2016-06-20', 6);

INSERT INTO diagnostic (id, id_pacient, id_doctor, id_specializare, denumire_diagnostic, data_consult) VALUES
(1, 1, 2, 1, 'ruptura_ligamente', '2017-12-22'),
(2, 2, 4, 3, 'tensiune mare', '2016-02-15'),
(3, 3, 9, 6, 'dermatita', '2016-10-15'),
(4, 3, 6, 4, 'miopie', '2017-03-10'),
(5, 4, 7, 5, 'plomba', '2017-01-05'),
(6, 5, 3, 2, 'sinuzita', '2015-11-30'),
(7, 6, 3, 2, 'sinuzita', '2016-04-24'),
(8, 7, 8, 5, 'abces', '2015-10-19'),
(9, 8, 1, 1, 'fractura', '2017-06-18'),
(10, 9, 4, 3, 'aritmie', '2015-09-21'),
(11, 9, 5, 4, 'strabism', '2015-10-20'),
(12, 10, 1, 1, 'fractura', '2017-05-11');




/* Requirment 2: Change the name of a table, then change it back to it's original name. 
*/

ALTER TABLE specializare RENAME TO specialiare_clinica;
RENAME TABLE specialiare_clinica TO specializare;




/* Requirment 3: Add an additional field into a table, then remove it. 
*/

ALTER TABLE diagnostic ADD COLUMN reteta TEXT AFTER id;
ALTER TABLE diagnostic DROP COLUMN reteta;




/* Requirment 4: Modify the data type of a field, then change it back to the initial type.
*/

ALTER TABLE doctori CHANGE nume nume TEXT NOT NULL;
ALTER TABLE doctori MODIFY nume VARCHAR(30) NOT NULL;




/* Requirment 5: Make 2 updates on 2 different tables and use the UNIQUE clause.
*/

UPDATE pacienti SET nume= 'Cretu' WHERE id=1;
UPDATE diagnostic SET data_consult = '2016-10-16' WHERE id=3;

ALTER TABLE specializare MODIFY denumire VARCHAR(50) NOT NULL UNIQUE; 




/* Requirment 6: Delete 2 entries.
*/

DELETE FROM doctori WHERE id = 10;
DELETE FROM diagnostic WHERE id_pacient = 4;




/* Requirment 7: Make 4 simple queries on your database tables.
*/

SELECT DISTINCT denumire FROM specializare;

SELECT CONCAT(nume,' ', prenume) AS doctori FROM doctori
Order by nume, prenume;

SELECT COUNT(id) AS nr_pacienti FROM pacienti;

SELECT COUNT(id) AS nr_doctori FROM doctori WHERE YEAR(experienta) < 2003;




/* Requirment 8: Make 3 complex queries on your database tables using JOIN.
*/

SELECT CONCAT(d.nume,' ', d.prenume) AS doctor, 
s.denumire AS specializare
FROM doctori AS d
JOIN specializare AS s ON d.id_specializare = s.id;

 
SELECT 
	CONCAT(p.nume,' ', p.prenume) AS pacient,
	CONCAT(d.nume,' ', d.prenume) AS doctor, s.denumire AS specializare FROM diagnostic AS di 
	LEFT JOIN pacienti AS p ON di.id_pacient=p.id
	LEFT JOIN doctori AS d ON di.id_doctor= d.id
 	LEFT JOIN specializare AS s ON di.id_specializare=s.id;
                  

SELECT 
	CONCAT(p.nume,' ', p.prenume) AS pacient,
	CONCAT(d.nume,' ', d.prenume) AS doctor, s.denumire AS specializare, di.denumire_diagnostic AS diagnostic,
 		di.data_consult AS data_consult FROM diagnostic AS di 
 	LEFT JOIN pacienti AS p ON  di.id_pacient= p.id
 	LEFT JOIN doctori AS d ON di.id_doctor= d.id
 	LEFT JOIN specializare AS s ON di.id_specializare= s.id;




/* Requirment 9: Make 1 subquery.
*/

SELECT * FROM pacienti WHERE id IN (
	SELECT  DISTINCT id_pacient FROM diagnostic WHERE data_consult = ( 
    			SELECT data_consult FROM diagnostic WHERE data_consult > '2017-07-01')
    
    	);




/* Requirment 10: Create 2 views based on the last 2 queries from requirment 8. Select, insert and delete data in one view then delete the views. 
*/

CREATE VIEW pacienti_recenti AS 
	SELECT * FROM pacienti WHERE id IN (
		SELECT  DISTINCT id_pacient FROM diagnostic WHERE data_consult = ( 
			SELECT data_consult FROM diagnostic WHERE data_consult > '2017-07-01')
    	);

        
CREATE VIEW doctori_specializare AS   
	SELECT CONCAT(d.nume,' ', d.prenume) AS doctor, 
	s.denumire AS specializare FROM doctori AS d
	JOIN specializare AS s ON d.id_specializare = s.id;


DROP VIEW pacienti_recenti;
DROP VIEW doctori_specializare;
