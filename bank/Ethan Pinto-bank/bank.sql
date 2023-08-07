DROP DATABASE IF EXISTS Bank;
CREATE DATABASE Bank;
USE Bank;

DROP TABLE IF EXISTS transaction;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS account;


CREATE TABLE customer (
    name VARCHAR(20),
    sex CHAR(1),
    ssn CHAR(9) NOT NULL,
    phone CHAR(15),
    dob DATE,
    address VARCHAR(50),
    PRIMARY KEY(ssn)

);
    
CREATE TABLE account (
    number CHAR(16) UNIQUE NOT NULL,
    open_date DATE,
    type CHAR(20),
    owner_ssn CHAR(9) NOT NULL,
    PRIMARY KEY(number)
    );
    
CREATE TABLE transaction (
    id INT(20) UNIQUE NOT NULL,
    amount DECIMAL(9,2),
    tdate DATE,
    type CHAR(10),
    account_num CHAR(16),
    PRIMARY KEY(id) 
);


INSERT INTO customer VALUE ('John Adam', 'M', '512432341', '(438) 321-2553', '1987-11-15',NULL);
INSERT INTO customer VALUE ('Alexander Felix', 'M', '724432341', '(541) 321-8553', '1991-05-22', NULL);
INSERT INTO customer VALUE ('Andrew William', 'M', '861894272', '(308) 692-1110', '1995-01-04', NULL);
INSERT INTO customer VALUE ('Ana Bert', 'F', '844192241', '(203) 932-7000', '1982-12-07', '23 Boston Post Rd, West Haven, CT 06516');

INSERT INTO account VALUE ('1111222233331441', '2018-12-03', 'Checking', '861894272');
INSERT INTO account VALUE ('2111222233332442', '2019-01-06', 'Saving', '512432341');
INSERT INTO account VALUE ('3111222233333443', '2017-09-22', 'Checking', '844192241');
INSERT INTO account VALUE ('4111222233335444', '2016-04-11', 'Checking', '724432341');
INSERT INTO account VALUE ('5111222233339445', '2018-11-05', 'Saving', '724432341');
INSERT INTO transaction VALUE (1001, 202.50, '2019-08-15', 'Deposit', '5111222233339445');
INSERT INTO transaction VALUE (1002, 100.00, '2019-09-21', 'Deposit','2111222233332442');
INSERT INTO transaction VALUE (1003, 200.00, '2019-09-29', 'Deposit', '2111222233332442');
INSERT INTO transaction VALUE (1004, 50.00, '2019-09-29', 'Deposit', '2111222233332442');
INSERT INTO transaction VALUE (1005, 1000.00, '2019-09-29', 'Deposit','3111222233333443');
INSERT INTO transaction VALUE (1006, -202.50, '2019-08-29', 'Withdraw', '5111222233339445');
INSERT INTO transaction VALUE (1007, 50.00, '2019-09-29', 'Deposit', '2111222233332442');
INSERT INTO transaction VALUE (1008, 50.00, '2019-09-29', 'Deposit', '2111222233332442');
INSERT INTO transaction VALUE (1009, -10.00, '2019-09-26', 'Withdraw', '2111222233332442');
INSERT INTO transaction VALUE (1010, 50.00, '2019-09-29', 'Deposit', '4111222233335444');
INSERT INTO transaction VALUE (1011, 320.00, '2019-09-29', 'Deposit', '5111222233339445');
INSERT INTO transaction VALUE (1012, 50.00, '2019-09-18', 'Deposit', '4111222233335444');
INSERT INTO transaction VALUE (1013, 5000.00, '2019-06-21', 'Deposit', '1111222233331441');
INSERT INTO transaction VALUE (1014, -100.00, '2019-09-02', 'Withdraw', '1111222233331441');
INSERT INTO transaction VALUE (1015, -200.00, '2019-09-08', 'Withdraw', '1111222233331441');

-- Q1
select count(id) as Number_of_Deposits from transaction
where type = 'Deposit'
and account_num is not null

-- Q2
select * from transaction
where account_num = '1111222233331441'
and tdate >= '2019-09-01' and tdate <= '2019-09-30'
and id > 0


-- Q3 
select sum(amount) as balance from transaction
where account_num = '1111222233331441'
and tdate < '2019-09-01'

-- Q4
select name, t.amount  from customer c
join bank.account a on c.ssn = a.owner_ssn
join bank.transaction t on t.account_num = a.number
where t.amount = (select MAX(amount) from transaction where t.type = 'Deposit')

-- Q5
select name from customer c
join bank.account a on c.ssn = a.owner_ssn
where a.type = 'Checking'
and sex = 'M'

-- Q6
select a.number, c.name from customer c
join bank.account a on c.ssn = a.owner_ssn
where name = 'Alexander Felix'

-- Q7
select number, a.type, sum(amount) as balance from account a
join bank.transaction t on t.account_num = a.number
where number = '4111222233335444'
union
select number, a.type, sum(amount) as balance from account a
join bank.transaction t on t.account_num = a.number
where number = '5111222233339445'

-- Q8 A)
select c.name from customer c
where c.ssn in (
select a.owner_ssn from account a
where a.number in (select t.account_num from transaction t
where t.amount >= 1000))

-- Q8 B)
select distinct name from customer c
join bank.account a on c.ssn = a.owner_ssn
join bank.transaction t on t.account_num = a.number
where t.amount >= '1000.00'


-- Q9
select c.name from customer c
inner join bank.account a on c.ssn = a.owner_ssn
inner join bank.transaction t on a.number = t.account_num
where t.type = 'Deposit'
group by c.name
having count(distinct t.id) >= 2;
