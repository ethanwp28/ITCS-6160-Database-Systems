/*** create database ****/

drop database if exists salesdw;
create database salesdw;
use salesdw;

drop table if exists Store;
drop table if exists Item;
drop table if exists Sales;
drop table if exists Customer;

create table Store(storeID char(6) primary key, city text, county text, state text);
create table Item(itemID char(6) primary key, category text, color text);
create table Customer(custID char(6) primary key, cName text, gender char, age int);
create table Sales(storeID char(6) references Store, itemID char(6) references Item, custID char(6) references Customer, price text);

/*** Data for OLAP demo on MySQL ***/

delete from Store;
delete from Item;
delete from Customer;
delete from Sales;

insert into Store values ('store1', 'Palo Alto', 'Santa Clara', 'CA');
insert into Store values ('store2', 'Mountain View', 'Santa Clara', 'CA');
insert into Store values ('store3', 'Menlo Park', 'San Mateo', 'CA');
insert into Store values ('store4', 'Belmont', 'San Mateo', 'CA');
insert into Store values ('store5', 'Seattle', 'King', 'WA');
insert into Store values ('store6', 'Redmond', 'King', 'WA');

insert into Item values ('item1', 'Tshirt', 'blue');
insert into Item values ('item2', 'Jacket', 'blue');
insert into Item values ('item3', 'Tshirt', 'red');
insert into Item values ('item4', 'Jacket', 'blue');
insert into Item values ('item5', 'Jacket', 'red');

insert into Customer values ('cust1', 'Amy', 'F', 20);
insert into Customer values ('cust2', 'Bob', 'M', 21);
insert into Customer values ('cust3', 'Craig', 'M', 25);
insert into Customer values ('cust4', 'Doris', 'F', 22);

insert into Sales values ('store1', 'item1', 'cust1', 10);
insert into Sales values ('store1', 'item1', 'cust2', 15);
insert into Sales values ('store1', 'item1', 'cust3', 20);
insert into Sales values ('store1', 'item1', 'cust3', 25);
insert into Sales values ('store1', 'item2', 'cust1', 30);
insert into Sales values ('store1', 'item2', 'cust2', 35);
insert into Sales values ('store1', 'item2', 'cust3', 40);
insert into Sales values ('store1', 'item2', 'cust2', 45);
insert into Sales values ('store1', 'item3', 'cust1', 50);
insert into Sales values ('store1', 'item3', 'cust1', 55);
insert into Sales values ('store2', 'item3', 'cust2', 60);
insert into Sales values ('store2', 'item1', 'cust2', 65);
insert into Sales values ('store2', 'item2', 'cust3', 70);
insert into Sales values ('store2', 'item2', 'cust3', 75);
insert into Sales values ('store2', 'item2', 'cust4', 80);
insert into Sales values ('store2', 'item2', 'cust4', 85);
insert into Sales values ('store2', 'item2', 'cust1', 90);
insert into Sales values ('store2', 'item2', 'cust1', 95);
insert into Sales values ('store2', 'item2', 'cust1', 95);
insert into Sales values ('store2', 'item2', 'cust2', 90);
insert into Sales values ('store3', 'item2', 'cust2', 85);
insert into Sales values ('store3', 'item2', 'cust2', 80);
insert into Sales values ('store3', 'item2', 'cust3', 75);
insert into Sales values ('store3', 'item2', 'cust3', 70);
insert into Sales values ('store3', 'item3', 'cust3', 65);
insert into Sales values ('store3', 'item3', 'cust2', 60);
insert into Sales values ('store3', 'item3', 'cust2', 55);
insert into Sales values ('store3', 'item3', 'cust2', 50);
insert into Sales values ('store3', 'item3', 'cust3', 45);
insert into Sales values ('store3', 'item3', 'cust3', 40);
insert into Sales values ('store4', 'item3', 'cust1', 35);
insert into Sales values ('store4', 'item3', 'cust1', 30);
insert into Sales values ('store4', 'item3', 'cust2', 25);
insert into Sales values ('store4', 'item3', 'cust2', 20);
insert into Sales values ('store4', 'item3', 'cust2', 15);
insert into Sales values ('store4', 'item3', 'cust2', 10);
insert into Sales values ('store4', 'item4', 'cust3', 15);
insert into Sales values ('store4', 'item4', 'cust3', 20);
insert into Sales values ('store4', 'item4', 'cust3', 25);
insert into Sales values ('store4', 'item4', 'cust3', 30);
insert into Sales values ('store5', 'item4', 'cust4', 35);
insert into Sales values ('store5', 'item4', 'cust4', 40);
insert into Sales values ('store5', 'item4', 'cust4', 45);
insert into Sales values ('store5', 'item4', 'cust4', 50);
insert into Sales values ('store5', 'item4', 'cust1', 55);
insert into Sales values ('store5', 'item4', 'cust1', 60);
insert into Sales values ('store5', 'item4', 'cust1', 65);
insert into Sales values ('store5', 'item4', 'cust2', 70);
insert into Sales values ('store5', 'item5', 'cust2', 75);
insert into Sales values ('store5', 'item5', 'cust2', 80);
insert into Sales values ('store6', 'item5', 'cust3', 85);
insert into Sales values ('store6', 'item5', 'cust3', 90);
insert into Sales values ('store6', 'item2', 'cust3', 95);
insert into Sales values ('store6', 'item2', 'cust4', 90);
insert into Sales values ('store6', 'item3', 'cust4', 85);
insert into Sales values ('store6', 'item3', 'cust4', 80);
insert into Sales values ('store6', 'item4', 'cust4', 75);
insert into Sales values ('store6', 'item4', 'cust4', 70);
insert into Sales values ('store6', 'item5', 'cust4', 65);
insert into Sales values ('store6', 'item5', 'cust4', 60);
