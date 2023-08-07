DROP DATABASE IF EXISTS Company;
CREATE DATABASE Company;
use Company;

SET foreign_key_checks = 0;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS dept_locations;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS works_on;
DROP TABLE IF EXISTS dependent;
SET foreign_key_checks = 1;

CREATE TABLE employee (
  fname    varchar(15) DEFAULT NULL,
  minit    varchar(1) DEFAULT NULL,
  lname    varchar(15) DEFAULT NULL,
  ssn      char(9) NOT NULL,
  bdate    date DEFAULT NULL,
  address  varchar(50) DEFAULT NULL,
  sex      char DEFAULT NULL,
  salary   decimal(10,2) DEFAULT NULL,
  superssn char(9) DEFAULT NULL,
  dno      int(4) DEFAULT NULL,
  PRIMARY KEY (ssn)
);

CREATE TABLE department (
  dname        varchar(25) DEFAULT NULL,
  dnumber      int(4) NOT NULL,
  mgrssn       char(9) DEFAULT NULL, 
  mgrstartdate date DEFAULT NULL,
  PRIMARY KEY (dnumber),
  FOREIGN KEY (mgrssn) REFERENCES employee(ssn)
    
);

ALTER TABLE employee ADD (
  FOREIGN KEY (dno) REFERENCES department(dnumber),
  FOREIGN KEY (superssn) REFERENCES employee(ssn)
);

CREATE TABLE dept_locations (
  dnumber   int(4) NOT NULL,
  dlocation varchar(15) NOT NULL,
  PRIMARY KEY (dnumber, dlocation),
  FOREIGN KEY (dnumber) REFERENCES department(dnumber)
);

CREATE TABLE project (
  pname      varchar(25) DEFAULT NULL,
  pnumber    int(4) NOT NULL,
  plocation  varchar(15) DEFAULT NULL,
  dnum       int(4) NOT NULL,
  PRIMARY KEY (pnumber),
  FOREIGN KEY (dnum) REFERENCES department(dnumber)
);

CREATE TABLE works_on (
  essn   char(9) NOT NULL,
  pno    int(4) NOT NULL,
  hours  decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (essn, pno),
  FOREIGN KEY (essn) REFERENCES employee(ssn),
  FOREIGN KEY (pno) REFERENCES project(pnumber)
);

CREATE TABLE dependent (
  essn           char(9) NOT NULL,
  dependent_name varchar(15) NOT NULL,
  sex            char DEFAULT NULL,
  bdate          date DEFAULT NULL,
  relationship   varchar(8) DEFAULT NULL,
  PRIMARY KEY (essn, dependent_name),
  FOREIGN KEY (essn) REFERENCES employee(ssn)
);


INSERT INTO employee VALUES 
  ('James','E','Borg','888665555', '1927-11-10','450 Stone, Houston, TX','M',55000,null,null);

INSERT INTO employee VALUES
  ('Jared','D','James','111111100','1965-05-12','123 Peachtree, Atlanta, GA','M',85000,null,null);
INSERT INTO employee VALUES
  ('Alex','D','Freed','444444400','1950-09-07','4333 Pillsbury, Milwaukee, WI','M',89000,null,null);
INSERT INTO employee VALUES
  ('John','C','James','555555500','1975-06-30','7676 Bloomington, Sacramento, CA','M',81000,null,null);
INSERT INTO employee VALUES 
  ('Franklin','T','Wong','333445555','1965-05-15','638 Voss, Houston, TX','M',40000,'888665555',null);
INSERT INTO employee VALUES 
  ('Jennifer','S','Wallace','987654321','1955-12-13','291 Berry, Bellaire, TX','F',43000,'888665555',null);



INSERT INTO department VALUES ('Research', 5, '333445555', '1978-05-22');
INSERT INTO department VALUES ('Administration', 4, '987654321',  '1985-01-01');
INSERT INTO department VALUES ('Headquarters', 1, '888665555', '1971-06-19');
INSERT INTO department VALUES ('Software',6,'111111100','1999-05-15');
INSERT INTO department VALUES ('Hardware',7,'444444400','1998-05-15');
INSERT INTO department VALUES ('Sales',8,'555555500','1997-01-01');
--
UPDATE employee SET dno = 5 WHERE ssn = '333445555';
UPDATE employee SET dno = 4 WHERE ssn = '987654321';
UPDATE employee SET dno = 1 WHERE ssn = '888665555';
UPDATE employee SET dno = 6 WHERE ssn = '111111100';
UPDATE employee SET dno = 7 WHERE ssn = '444444400';
UPDATE employee SET dno = 6 WHERE ssn = '555555500';



--
insert into employee values
  ('Bob','B','Bender','666666600','1984-04-23','8794 Garfield, Chicago, IL','M',96000,null,8);
insert into employee values
  ('Kim','C','Grace','333333300','1988-12-08','6677 Mills Ave, Sacramento, CA','F',79000,null,6);
insert into employee values
  ('Evan','E','Wallis','222222200','1990-10-14','134 Pelham, Milwaukee, WI','M',92000,null,7);


INSERT INTO employee VALUES 
  ('John','B','Smith','123456789','1955-01-09','731 Fondren, Houston, TX','M',30000,'333445555',5);
INSERT INTO employee VALUES 
  ('Alicia','J','Zelaya','999887777','1958-07-21','3321 Castle, Spring, TX','F',25000,'987654321',4);
INSERT INTO employee VALUES 
  ('Ramesh','K','Narayan','666884444','1952-09-27','971 Fire Oak, Humble, TX','M',38000,'333445555',5);
INSERT INTO employee VALUES 
  ('Joyce','A','English','453453453','1983-04-26','5631 Rice Oak, Houston, TX','F',25000,'333445555',5);
INSERT INTO employee VALUES 
  ('Ahmad','V','Jabbar','987987987','1979-12-03','980 Dallas, Houston, TX','M',25000,'987654321',4);
insert into employee values
  ('Jon','C','Jones','111111101','1986-11-04','111 Allgood, Atlanta, GA','M',45000,'111111100',6);
insert into employee values
  ('Justin',null,'Mark','111111102','1972-08-04','2342 May, Atlanta, GA','M',40000,'111111100',6);
insert into employee values
  ('Brad','C','Knight','111111103','1988-11-02','176 Main St., Atlanta, GA','M',44000,'111111100',6);

insert into employee values
  ('Josh','U','Zell','222222201','1986-02-22','266 McGrady, Milwaukee, WI','M',56000,'222222200',7);
insert into employee values
  ('Andy','C','Vile','222222202','1966-02-10','1967 Jordan, Milwaukee, WI','M',53000,'222222200',7);
insert into employee values
  ('Tom','G','Brand','222222203','1963-04-12','112 Third St, Milwaukee, WI','M',62500,'222222200',7);
insert into employee values
  ('Jenny','F','Vos','222222204','1956-07-11','263 Mayberry, Milwaukee, WI','F',61000,'222222201',7);
insert into employee values
  ('Chris','A','Carter','222222205','1992-08-17','565 Jordan, Milwaukee, WI','F',43000,'222222201',7);

insert into employee values
  ('Jeff','H','Chase','333333301','1970-05-02','145 Bradbury, Sacramento, CA','M',44000,'333333300',6);
insert into employee values
  ('Bonnie','S','Bays','444444401','1973-06-05','111 Hollow, Milwaukee, WI','F',70000,'444444400',7);
insert into employee values
  ('Alec','C','Best','444444402','1987-10-11','233 Solid, Milwaukee, WI','M',60000,'444444400',7);
insert into employee values
  ('Sam','S','Snedden','444444403','1991-08-12','987 Windy St, Milwaukee, WI','M',48000,'444444400',7);
insert into employee values
  ('Nandita','K','Ball','555555501','1989-07-22','222 Howard, Sacramento, CA','M',62000,'555555500',6);

insert into employee values
  ('Jill','J','Jarvis','666666601','1993-10-01','6234 Lincoln, Chicago, IL','F',36000,'666666600',8);
insert into employee values
  ('Kate','W','King','666666602','1992-07-03','1976 Boone Trace, Chicago, IL','F',44000,'666666600',8);
insert into employee values
  ('Lyle','G','Leslie','666666603','1982-11-19','417 Hancock Ave, Chicago, IL','M',41000,'666666601',8);
insert into employee values
  ('Billie','J','King','666666604','1990-10-15','556 Washington, Chicago, IL','F',38000,'666666603',8);
insert into employee values
  ('Jon','A','Kramer','666666605','1981-10-17','1988 Windy Creek, Seattle, WA','M',41500,'666666603',8);
insert into employee values
  ('Ray','H','King','666666606','1978-02-24','213 Delk Road, Seattle, WA','M',44500,'666666604',8);
insert into employee values
  ('Gerald','D','Small','666666607','1976-07-13','122 Ball Street, Dallas, TX','M',29000,'666666602',8);
insert into employee values
  ('Arnold','A','Head','666666608','1977-12-04','233 Spring St, Dallas, TX','M',33000,'666666602',8);
insert into employee values
  ('Helga','C','Pataki','666666609','1981-03-15','101 Holyoke St, Dallas, TX','F',32000,'666666602',8);
insert into employee values
  ('Naveen','B','Drew','666666610','1992-03-14','198 Elm St, Philadelphia, PA','M',34000,'666666607',8);
insert into employee values
  ('Carl','E','Reedy','666666611','1979-01-10','213 Ball St, Philadelphia, PA','M',32000,'666666610',8);
insert into employee values
  ('Sammy','G','Hall','666666612','1970-08-01','433 Main Street, Miami, FL','M',37000,'666666611',8);
insert into employee values
  ('Red','A','Bacher','666666613','1980-05-21','196 Elm Street, Miami, FL','M',33500,'666666612',8);
--





INSERT INTO project VALUES ('ProductX',1,'Bellaire',5);
INSERT INTO project VALUES ('ProductY',2,'Sugarland',5);
INSERT INTO project VALUES ('ProductZ',3,'Houston',5);
INSERT INTO project VALUES ('Computerization',10,'Stafford',4);
INSERT INTO project VALUES ('Reorganization',20,'Houston',1);
INSERT INTO project VALUES ('Newbenefits',30,'Stafford',4);
INSERT INTO project VALUES ('OperatingSystems',61,'Jacksonville',6);
INSERT INTO project VALUES ('DatabaseSystems',62,'Birmingham',6);
INSERT INTO project VALUES ('Middleware',63,'Jackson',6);
INSERT INTO project VALUES ('InkjetPrinters',91,'Phoenix',7);
INSERT INTO project VALUES ('LaserPrinters',92,'LasVegas',7);
--
INSERT INTO dept_locations VALUES (1,'Houston');
INSERT INTO dept_locations VALUES (4,'Stafford');
INSERT INTO dept_locations VALUES (5,'Bellaire');
INSERT INTO dept_locations VALUES (5,'Sugarland');
INSERT INTO dept_locations VALUES (5,'Houston');
INSERT INTO dept_locations VALUES (6,'Atlanta');
INSERT INTO dept_locations VALUES (6,'Sacramento');
INSERT INTO dept_locations VALUES (7,'Milwaukee');
INSERT INTO dept_locations VALUES (8,'Chicago');
INSERT INTO dept_locations VALUES (8,'Dallas');
INSERT INTO dept_locations VALUES (8,'Philadephia');
INSERT INTO dept_locations VALUES (8,'Seattle');
INSERT INTO dept_locations VALUES (8,'Miami');
--
INSERT INTO dependent VALUES ('333445555','Alice','F','1996-03-01-','Daughter');
INSERT INTO dependent VALUES ('333445555','Theodore','M','1993-05-12','Son');
INSERT INTO dependent VALUES ('333445555','Joy','F','1970-08-07','Spouse');
INSERT INTO dependent VALUES ('987654321','Abner','M','1932-02-28','Spouse');
INSERT INTO dependent VALUES ('123456789','Michael','M','1978-01-01','Son');
INSERT INTO dependent VALUES ('123456789','Alice','F', '1978-12-30','Daughter');
INSERT INTO dependent VALUES ('123456789','Elizabeth','F','1957-05-05','Spouse');
INSERT INTO dependent VALUES ('444444400','Johnny','M','1997-04-06','Son');
INSERT INTO dependent VALUES ('444444400','Tommy','M','1999-02-07','Son');
INSERT INTO dependent VALUES ('555555500','Chris','M','1969-04-21','Spouse');
INSERT INTO dependent VALUES ('666884444','Sam','M','1964-03-13','Spouse');
--
INSERT INTO works_on VALUES ('123456789',1, 32.5);
INSERT INTO works_on VALUES ('123456789',2,  7.5);
INSERT INTO works_on VALUES ('666884444',3, 40.0);
INSERT INTO works_on VALUES ('453453453',1, 20.0);
INSERT INTO works_on VALUES ('453453453',2, 20.0);
INSERT INTO works_on VALUES ('333445555',2, 10.0);
INSERT INTO works_on VALUES ('333445555',3, 10.0);
INSERT INTO works_on VALUES ('333445555',10,10.0);
INSERT INTO works_on VALUES ('333445555',20,10.0);
INSERT INTO works_on VALUES ('999887777',30,30.0);
INSERT INTO works_on VALUES ('999887777',10,10.0);
INSERT INTO works_on VALUES ('987987987',10,35.0);
INSERT INTO works_on VALUES ('987987987',30, 5.0);
INSERT INTO works_on VALUES ('987654321',30,20.0);
INSERT INTO works_on VALUES ('987654321',20,15.0);
INSERT INTO works_on VALUES ('888665555',20,null);
INSERT INTO works_on VALUES ('111111100',61,40.0);


