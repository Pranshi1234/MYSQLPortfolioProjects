CREATE DATABASE shop;
USE shop;
-- CREATE TABLE customers(
-- id INT PRIMARY KEY AUTO_INCREMENT,
-- first_name VARCHAR(50),
-- last_name VARCHAR(50),
-- email VARCHAR(50)
-- );
CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
amount DECIMAL(8,2),
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(id) );
-- INSERT INTO customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
--        
       INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
 DROP TABLE orders;
DROP TABLE customers;

CREATE TABLE STUDENTS (
id INT  PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50));
CREATE TABLE PAPERS (
title VARCHAR (500),
grade INT ,
student_id INT ,
FOREIGN KEY(student_id) REFERENCES STUDENTS(id) );
-- INSERT INTO STUDENTS (first_name) VALUES 
-- ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');
-- INSERT INTO PAPERS (student_id, title, grade ) VALUES
-- (1, 'My First Book Report', 60),
-- (1, 'My Second Book Report', 75),
-- (2, 'Russian Lit Through The Ages', 94),
-- (2, 'De Montaigne and The Art of The Essay', 98),
-- (4, 'Borges and Magical Realism', 89);
SELECT first_name,title,grade FROM STUDENTS JOIN PAPERS ON STUDENTS.id = PAPERS.student_id ORDER BY grade DESC;
-- SELECT first_name,title,grade FROM STUDENTS  LEFT JOIN PAPERS ON STUDENTS.id = PAPERS.student_id ;
SELECT first_name,IFNULL(title,'MISSING') AS title ,IFNULL(grade,0) AS grade FROM STUDENTS  LEFT JOIN PAPERS ON STUDENTS.id = PAPERS.student_id ;
-- SELECT first_name ,IFNULL(AVG(grade),0) AS average FROM STUDENTS LEFT JOIN PAPERS ON STUDENTS.id = PAPERS.student_id  GROUP BY first_name ORDER BY average DESC ;
SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade),0) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM
    STUDENTS
        LEFT JOIN
    PAPERS ON STUDENTS.id = PAPERS.student_id
GROUP BY first_name
ORDER BY average DESC;

