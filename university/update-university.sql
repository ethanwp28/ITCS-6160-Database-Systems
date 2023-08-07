/* Delete the tables if they already exist */
DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;


DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS prerequisite CASCADE;
DROP TABLE IF EXISTS section CASCADE; 
DROP TABLE IF EXISTS course CASCADE;


CREATE TABLE student (
	name 	  	VARCHAR(50) NOT NULL,
	student_number  CHAR(9) NOT NULL,
	class_year 	CHAR(4),
	major		VARCHAR(20),
	PRIMARY KEY (student_number)
);

CREATE TABLE course (
	course_name 	VARCHAR(50) NOT NULL,
	course_number	INT NOT NULL,
	credit_hours	INT,
	department	VARCHAR(40) NOT NULL,
	PRIMARY KEY (course_number)
--     CONSTRAINT course_number_limit  CHECK (course_number > 1000 AND course_number < 6999)
);


CREATE TABLE prerequisite (
    course_number INT NOT NULL,
    prerequisite_number INT NOT NULL ,
    PRIMARY KEY (course_number, prerequisite_number),
    FOREIGN KEY (course_number) REFERENCES course(course_number),
    FOREIGN KEY (course_number) REFERENCES course(course_number)
);


INSERT INTO course VALUE ('Databases and SQL', 2215, 3, 'Computer Science');
INSERT INTO course VALUE ('Intro to C Programming', 1110, 3, 'Computer Science');
INSERT INTO course VALUE ('Data Structures and Algorithms', 2226, 3, 'Computer Science');

INSERT INTO course (course_name, course_number, department) 
VALUE ('Computer Organization Lab', 3331, 'Computer Science');

-- Q1
INSERT INTO student VALUE ('Ethan','1','2023','Mathematical Finance');
INSERT INTO student VALUE ('John','2','2023','Computer Science');
INSERT INTO student VALUE ('Jane','3','2023','Mathematical Finance');
INSERT INTO student VALUE ('Steve','4','2023','Computer Science');

CREATE TABLE section (
    section_identifier INT NOT NULL,
    course_number INT NOT NULL,
    semester VARCHAR(10),
    year INT,
    instructor VARCHAR(50),
    PRIMARY KEY (section_identifier,course_number),
    FOREIGN KEY (course_number) REFERENCES course(course_number)
);

INSERT INTO section (section_identifier, course_number, semester, year)
SELECT 1, course_number, 'Fall', 2019 FROM course; 

INSERT INTO section VALUE (2, 1110, 'Fall', 2019, NULL);

DELETE FROM section WHERE course_number = 1110;

UPDATE section SET instructor = 'Sara Riazi' 
WHERE course_number = 2215;

ALTER TABLE section
ADD days CHAR(3); 

ALTER TABLE section
ADD fee INT
DEFAULT 240;

ALTER TABLE section
DROP fee;

-- Q2
CREATE TABLE grade_report (
student_number CHAR(9) NOT NULL,
section_identifier INT(2) NOT NULL,
course_number INT(4) NOT NULL,
grade CHAR(1),
PRIMARY KEY (student_number,section_identifier,course_number),
FOREIGN KEY (course_number) REFERENCES course(course_number),
FOREIGN KEY (section_identifier) REFERENCES section(section_identifier),
FOREIGN KEY (student_number) REFERENCES student(student_number)
);

-- Q3
INSERT INTO grade_report values('1',1,2215,NULL);

-- Q4
UPDATE grade_report set grade = 'A' 
WHERE student_number = '1' AND section_identifier = 1
AND course_number = 2215;

-- Q5
ALTER TABLE section
ADD COLUMN location varchar(10);

-- Q6
UPDATE section s
INNER JOIN  
course c
ON c.course_number = s.course_number  
SET s.location = 'BCKM 208' 
WHERE course_name = 'Databases and SQL';

-- Q7
ALTER TABLE section
DROP location;

-- Q8
DELETE FROM grade_report 
WHERE student_number = '1' 
AND section_identifier = 1
and course_number = 2215;

-- Q9
DROP TABLE IF EXISTS grade_report CASCADE;

-- Q10
DELETE FROM student;