CREATE DATABASE tv_db;
USE tv_db;

-- CREATE TABLE reviewers (
-- id INT PRIMARY KEY AUTO_INCREMENT,
-- first_name VARCHAR(50) NOT NULL ,
-- last_name VARCHAR(50) NOT NULL );

CREATE TABLE series(
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100),
released_year YEAR,
genre VARCHAR(100));

-- CREATE TABLE reviews (
-- id INT PRIMARY KEY AUTO_INCREMENT,
-- rating DECIMAL(2,1),
-- series_id INT,
-- reviewer_id INT ,
-- FOREIGN KEY (series_id) REFERENCES series(id),
-- FOREIGN KEY (reviewer_id) REFERENCES reviewers(id));

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

-- INSERT INTO reviewers (first_name, last_name) VALUES
--     ('Thomas', 'Stoneman'),
--     ('Wyatt', 'Skaggs'),
--     ('Kimbra', 'Masters'),
--     ('Domingo', 'Cortes'),
--     ('Colt', 'Steele'),
--     ('Pinkie', 'Petit'),
--     ('Marlon', 'Crafford');

-- INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
--     (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
--     (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
--     (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
--     (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
--     (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
--     (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
--     (7,2,9.1),(7,5,9.7),
--     (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
--     (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
--     (10,5,9.9),
--     (13,3,8.0),(13,4,7.2),
--     (14,2,8.5),(14,3,8.9),(14,4,8.9);

SELECT title, avg(rating) AS avg_rating FROM series JOIN  reviews ON series.id = reviews.series_id 
GROUP BY title 
ORDER BY  avg_rating ;

-- SELECT  first_name, last_name, rating FROM reviewers JOIN reviews ON  reviews.reviewer_id=reviewers.id ;

SELECT  titlE AS unreviewed_series FROM series LEFT  JOIN reviews ON series.id= reviews.series_id WHERE rating IS NULL  ;

-- SELECT genre, ROUND(avg(rating),2) AS avg_rating FROM series JOIN reviews ON series.id=reviews.series_id GROUP BY genre ;

SELECT first_name,last_name,COUNT(rating) AS COUNT , IFNULL(MIN(rating),0) AS MIN,IFNULL(MAX(rating),0) AS MAX ,IFNULL(AVG(rating),0) AS AVG,
CASE WHEN IFNULL(MIN(rating),0) = 0 THEN 'INACTIVE' 
ELSE 'ACTIVE'
END AS status
 FROM reviewers LEFT JOIN reviews ON reviewers.id= reviews.reviewer_id GROUP BY first_name,last_name;

SELECT 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    series
        JOIN
    reviews ON series.id = reviews.series_id
        JOIN
    reviewers ON reviewers.id = reviews.reviewer_id;

-- SELECT title,released_year,genre,first_name ,last_name FROM reviews 
-- JOIN  series ON series.id= reviews.series_id 
-- JOIN  reviewers ON reviewers.id= reviews.reviewer_id;

CREATE  OR REPLACE  VIEW full_reviews AS SELECT title,released_year,genre,first_name ,last_name, rating FROM reviews 
JOIN  series ON series.id= reviews.series_id 
JOIN  reviewers ON reviewers.id= reviews.reviewer_id;
SHOW tables;
-- SELECT * FROM full_reviews;
-- select title,avg(rating) from full_reviews group by title having count(rating)>1;






