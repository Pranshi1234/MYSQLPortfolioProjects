 CREATE TABLE people (
name VARCHAR(100),
birthdate DATE ,
birthtime TIME,
birthdt DATETIME 
);
-- DESC people;
INSERT INTO people ( name,birthdate,birthtime,birthdt)
VALUES ('Elton','2000-12-25','11:00:00','2000-12-25 11:00:00');
-- SELECT * FROM people;
INSERT INTO people ( name,birthdate,birthtime,birthdt)
VALUES ('Lulu','1985-04-11','9:45:10','1985-04-11 9:45:10');
-- INSERT INTO people ( name,birthdate,birthtime,birthdt)
-- VALUES ('Juan','2020-08-15','23:59:00','2020-08-15 23:59:00');
-- SELECT*FROM people;
DELETE  FROM people WHERE name='Juan';
-- SELECT curtime();
SELECT CURDATE();
-- SELECT NOW();
SELECT CURRENT_TIMESTAMP();
-- INSERT INTO people (name,birthdate,birthtime,birthdt)
-- VALUES ('Hazel', CURDATE(), CURTIME(), NOW());
-- SELECT * FROM people;
-- SELECT birthdate , DAY(birthdate) FROM people;
SELECT CONCAT(MONTHNAME(birthdate), DAY( birthdate), YEAR( birthdate) )FROM people;
-- SELECT birthdt, DATE_FORMAT(birthdt, 'BORN ON: %r') FROM people;

-- CHAR- HAS FIXED LENGTH ,has length of 0 to255 and trailing spaces are removed 
-- in VARCHAR , the length is bigger than char .
CREATE TABLE inventory (
		     item_name VARCHAR (80),
             price  DECIMAL(7,2),
             quantity INT);
-- SELECT CURTIME();
-- SELECT CURDATE();
-- SELECT DAYOFWEEK(curdate());
 SELECT DATE_FORMAT(NOW(),'%W');
-- SELECT CONCAT(MONTH(CURDATE()),'-', DAY(CURDATE()),'-',YEAR(CURDATE()));
SELECT  CONCAT(MONTHNAME(CURDATE()),' ', DAY(CURDATE()),' ','at',' ',DATE_FORMAT(CURTIME(),'%H:%i'));
-- CREATE TABLE tweets (
-- Thecontent VARCHAR(180),
-- Username VARCHAR(70),
-- created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP )

SELECT * FROM books WHERE released_year < 1980;
-- SELECT * FROM books WHERE author_lname ='Eggers' OR author_lname = 'Chabon';
-- SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;
-- SELECT * FROM books WHERE pages BETWEEN 100 AND 200;
SELECT * FROM books WHERE author_lname LIKE'C%' OR author_lname LIKE'S%';
SELECT title,author_lname,
CASE 
WHEN title LIKE'%stories%' THEN 'Short Stories'
WHEN title LIKE'%Just Kids%' OR title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
ELSE 'Novel'
END AS TYPE 
FROM books;
SELECT author_fname,author_lname, CASE 
WHEN COUNT(*) = 1 THEN '1 book'
ELSE CONCAT( COUNT(*) ,' ', 'books') 
END AS COUNT  
FROM books 
GROUP BY author_fname,author_lname;