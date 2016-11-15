CREATE DATABASE company;
USE company;

CREATE TABLE department( 
  dname varchar(20),
  dnumber int,
  mgrstartdate date,
  mgrssn int
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;

CREATE TABLE dependent( 
  bdate date,
  dependent_name varchar(20),
  sex char(1),
  relationship varchar(20),
  essn int
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;

CREATE TABLE dept_locations( 
  dnumber int,
  dlocation varchar(20)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;

CREATE TABLE employee( 
  salary int,
  bdate date,
  dno int,
  superssn int,
  sex char(1),
  lname varchar(20),
  ssn int,
  fname varchar(20),
  address varchar(50), 
  minit varchar(1)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;

CREATE TABLE project( 
  dnum int,
  pnumber int,
  plocation varchar(20),
  pname varchar(20)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;

CREATE TABLE works_on( 
  hours float,
  pno int,
  essn int
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;


CREATE DATABASE premiere;
USE premiere;

CREATE TABLE customer(
  city varchar(20),
  customernum int,
  customername varchar(30),
  zip int,
  state varchar(2),
  street varchar(30),
  repnum int,
  creditlimit float,
  balance float
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;

CREATE TABLE orderline(
  ordernum int,
  numordered int,
  quotedprice float,
  partnum varchar(4)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;

CREATE TABLE orders(
  ordernum int,
  customernum int,
  orderdate date
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;

CREATE TABLE part(
  description varchar(20),
  price float,
  partnum varchar(10),
  warehouse int,
  onhand int,
  class varchar(5)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;

CREATE TABLE rep(
  city varchar(20), 
  zip int, 
  firstname varchar(20),
  lastname varchar(20), 
  rate float, 
  commission float, 
  state varchar(2), 
  street varchar(20), 
  repnum int
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
STORED AS textfile
tblproperties("skip.header.line.count"="1")
;

USE company;
LOAD DATA LOCAL INPATH '/data/company/department.csv' OVERWRITE INTO TABLE department;
LOAD DATA LOCAL INPATH '/data/company/dependent.csv' OVERWRITE INTO TABLE dependent;
LOAD DATA LOCAL INPATH '/data/company/dept_locations.csv' OVERWRITE INTO TABLE dept_locations;
LOAD DATA LOCAL INPATH '/data/company/employee.csv' OVERWRITE INTO TABLE employee;
LOAD DATA LOCAL INPATH '/data/company/project.csv' OVERWRITE INTO TABLE project;
LOAD DATA LOCAL INPATH '/data/company/works_on.csv' OVERWRITE INTO TABLE works_on;

USE premiere;
LOAD DATA LOCAL INPATH '/data/premiere/customer.csv' OVERWRITE INTO TABLE customer;
LOAD DATA LOCAL INPATH '/data/premiere/orderline.csv' OVERWRITE INTO TABLE orderline;
LOAD DATA LOCAL INPATH '/data/premiere/orders.csv' OVERWRITE INTO TABLE orders;
LOAD DATA LOCAL INPATH '/data/premiere/part.csv' OVERWRITE INTO TABLE part;
LOAD DATA LOCAL INPATH '/data/premiere/rep.csv' OVERWRITE INTO TABLE rep;

USE company;
