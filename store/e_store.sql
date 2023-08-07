
CREATE DATABASE e_store;

USE e_store;


DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id int(3) unsigned NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  price float(8,2) NOT NULL DEFAULT '0.00',
  stock int(3) unsigned NOT NULL DEFAULT '0',
  created_at datetime NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


LOCK TABLES products WRITE;

INSERT INTO products VALUES (1,'Tablet',145.50,8,'2015-10-09 00:49:30'),(2,'Smartphone',90.80,9,'2015-10-28 04:43:05'),(3,'PC',157.40,1,'2015-10-10 18:13:09'),(4,'Headphones',20.00,6,'2015-10-30 06:30:30'),(5,'Speakers',56.89,4,'2015-10-27 12:24:56'),(6,'Monitor',125.45,7,'2015-10-22 11:32:53');

UNLOCK TABLES;


DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
  id int(3) unsigned NOT NULL AUTO_INCREMENT,
  product_id int(3) unsigned NOT NULL,
  stars tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (id),
  KEY product_id (product_id),
  CONSTRAINT reviews_ibfk_1 FOREIGN KEY (product_id) REFERENCES products (id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


LOCK TABLES reviews WRITE;

INSERT INTO reviews VALUES (1,6,5),(2,4,2),(3,2,1),(4,4,5),(5,1,5),(6,2,4),(7,3,3),(8,2,2),(9,1,3);

UNLOCK TABLES;



