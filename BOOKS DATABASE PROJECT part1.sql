CREATE DATaBASE books;
-- Use books;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
--  INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
--  VALUES
--  ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
--  ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
-- ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
-- ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
-- ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
-- ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
-- ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
-- ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
-- ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
-- ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
-- ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
-- ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
-- ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
-- ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
-- ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
-- ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


 INSERT INTO books
 ( title , author_fname, author_lname, released_year, stock_quantity, pages)
     VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
            ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
            ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
-- SELECT title, released_year FROM books 
-- ORDER BY released_year DESC LIMIT 10;
-- SELECT*FROM books;


 SELECT title from books where title LIKE'%stories%';
-- SELECT title,pages FROM books ORDER BY pages desc LIMIT 0,1;
  SELECT CONCAT(title,' - ',released_year) AS summary FROM  books ORDER BY released_year DESC LIMIT 0,3;
-- SELECT title,author_lname FROM books WHERE author_lname LIKE'% %';
-- SELECT title , released_year, stock_quantity FROM books ORDER BY stock_quantity , title , released_year LIMIT 0,3; 
  SELECT title,author_lname FROM books ORDER BY author_lname,title ;
-- SELECT CONCAT('MY FAVORITE AUTHOR IS', ' ',upper(author_fname),' ',upper(author_lname)) AS yell FROM books ORDER BY author_lname ASC;

--  SELECT COUNT(*) from books;
SELECT released_year, COUNT(*) from books group by released_year ;
 -- SELECT SUM(stock_quantity)FROM books;
 SELECT AVG(released_year),author_lname,author_fname FROM books GROUP BY author_fname,author_lname;
-- SELECT pages,CONCAT( author_fname ,' ',author_lname) AS 'full name' FROM books ORDER BY pages DESC LIMIT 1;
 SELECT AVG(pages) as 'avg pages',released_year as year,COUNT(*) as 'no. of books' FROM  books GROUP BY released_year ORDER BY released_year ; 

