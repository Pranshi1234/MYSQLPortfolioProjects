create database trigger_demo;
use trigger_demo;
create table users(
username varchar(255),
age INT );
DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;
insert into users(username,age) values ('sally',14);
 insert into users(username,age) values ('fred',25);
select * from users;
drop database trigger_demo;