-- Ethan Pinto ITCS 6160

/* Delete the tables if they already exist */
DROP DATABASE IF EXISTS social_network;
CREATE DATABASE social_network;
USE social_network;

drop table if exists Highschooler;
drop table if exists Friend;
drop table if exists Likes;

/* Create the schema for our tables */
create table Highschooler(ID int, name text, grade int);
create table Friend(ID1 int, ID2 int);
create table Likes(ID1 int, ID2 int);

/* Populate the tables with our data */
insert into Highschooler values (1510, 'Jordan', 9);
insert into Highschooler values (1689, 'Gabriel', 9);
insert into Highschooler values (1381, 'Tiffany', 9);
insert into Highschooler values (1709, 'Cassandra', 9);
insert into Highschooler values (1101, 'Haley', 10);
insert into Highschooler values (1782, 'Andrew', 10);
insert into Highschooler values (1468, 'Kris', 10);
insert into Highschooler values (1641, 'Brittany', 10);
insert into Highschooler values (1247, 'Alexis', 11);
insert into Highschooler values (1316, 'Austin', 11);
insert into Highschooler values (1911, 'Gabriel', 11);
insert into Highschooler values (1501, 'Jessica', 11);
insert into Highschooler values (1304, 'Jordan', 12);
insert into Highschooler values (1025, 'John', 12);
insert into Highschooler values (1934, 'Kyle', 12);
insert into Highschooler values (1661, 'Logan', 12);

insert into Friend values (1510, 1381);
insert into Friend values (1510, 1689);
insert into Friend values (1689, 1709);
insert into Friend values (1381, 1247);
insert into Friend values (1709, 1247);
insert into Friend values (1689, 1782);
insert into Friend values (1782, 1468);
insert into Friend values (1782, 1316);
insert into Friend values (1782, 1304);
insert into Friend values (1468, 1101);
insert into Friend values (1468, 1641);
insert into Friend values (1101, 1641);
insert into Friend values (1247, 1911);
insert into Friend values (1247, 1501);
insert into Friend values (1911, 1501);
insert into Friend values (1501, 1934);
insert into Friend values (1316, 1934);
insert into Friend values (1934, 1304);
insert into Friend values (1304, 1661);
insert into Friend values (1661, 1025);
insert into Friend select ID2, ID1 from Friend;

insert into Likes values(1689, 1709);
insert into Likes values(1709, 1689);
insert into Likes values(1782, 1709);
insert into Likes values(1911, 1247);
insert into Likes values(1247, 1468);
insert into Likes values(1641, 1468);
insert into Likes values(1316, 1304);
insert into Likes values(1501, 1934);
insert into Likes values(1934, 1501);
insert into Likes values(1025, 1101);

-- Q1
DELIMITER $$

CREATE TRIGGER friendly_trigger AFTER INSERT ON Highschooler
FOR EACH ROW
BEGIN
    DECLARE grade_value INT;
    
    -- Get the grade of the newly inserted student
    SELECT grade INTO grade_value FROM Highschooler WHERE ID = NEW.ID;
    
    -- Insert rows into Likes table for every other Highschooler in the same grade
    INSERT INTO Likes (ID1, ID2)
    SELECT NEW.ID, ID
    FROM Highschooler
    WHERE name <> 'Friendly' AND grade = grade_value;
END $$

DELIMITER ;

-- Q2
DELIMITER $$

CREATE PROCEDURE insert_friend(IN ID1 INT, IN ID2 INT)
BEGIN
    -- Check if the first tuple already exists in the Friend table
    SELECT COUNT(*) INTO @count
    FROM Friend
    WHERE ID1 = ID1 AND ID2 = ID2;
    
    -- If the first tuple does not exist, insert it into the Friend table
    IF @count = 0 THEN
        INSERT INTO Friend (ID1, ID2) VALUES (ID1, ID2);
    END IF;
    
    -- Check if the second tuple already exists in the Friend table
    SELECT COUNT(*) INTO @count
    FROM Friend
    WHERE ID1 = ID2 AND ID2 = ID1;
    
    -- If the second tuple does not exist, insert it into the Friend table
    IF @count = 0 THEN
        INSERT INTO Friend (ID1, ID2) VALUES (ID2, ID1);
    END IF;
END $$

DELIMITER ;

-- call the SP
CALL insert_friend(1934, 1661);

-- Q3
DELIMITER $$
CREATE TRIGGER auto_inc_highschooler
BEFORE INSERT ON Highschooler
FOR EACH ROW
BEGIN
  IF NEW.ID IS NULL THEN
    SET NEW.ID = (SELECT MAX(ID) FROM Highschooler) + 1;
  END IF;
END$$
DELIMITER ;

-- Q4
-- part a
CREATE VIEW full_friend AS
SELECT h1.name AS name1, h1.grade AS grade1, h2.name AS name2, h2.grade AS grade2
FROM Highschooler h1
JOIN Friend f ON h1.ID = f.ID1
JOIN Highschooler h2 ON f.ID2 = h2.ID
WHERE f.ID2 = h1.ID;

-- part b
SELECT CONCAT(f.name1, ', ', f.name2) AS friends
FROM full_friend f
WHERE f.grade1 <> f.grade2;