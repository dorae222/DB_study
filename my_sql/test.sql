create database study_db default character set UTF8;
show databases;
use study_db;

DROP TABLE MEMBER;
CREATE TABLE MEMBER(
id CHAR(40) NOT NULL,
pwd CHAR(40) NOT NULL,
name CHAR(20) NOT NULL,
email CHAR(60),
PRIMARY KEY(id)
) CHARSET=utf8;
show tables;
INSERT INTO MEMBER(id, pwd, name, email)
VALUES('ss', 'wish', 'kim', 'korea@gmail.com');
INSERT INTO MEMBER(id, pwd, name, email)
VALUES('dd', 'aaaa', 'park', 'rere@gmail.com');
INSERT INTO MEMBER(id, pwd, name, email)
VALUES('ee', 'bbbb', 'lee', 'test@gmail.com');
select * from member;

DROP TABLE `department`;
CREATE TABLE `study_db`.`department` (
id int auto_increment primary key,
name varchar(20) not null,
code char(13) not null unique key
);
DROP TABLE `employee`;
CREATE TABLE `study_db`. `employee`(
id int auto_increment primary key,
name varchar(20) not null,
code char(13) not null unique key,
dept_id int,
foreign key(dept_id) references department(id)
);
########################################
INSERT INTO customer_info
VALUES
('1000000', 2000000, 'dw12345', 'Do','01','seoul'),
('1000001', 2000001, 'dw12346', 'Kim','01','pusan'),
('1000002', 2000002, 'dw12347', 'Park','01','daejeon'),
('1000003', 2000003, 'dw12348', 'Gu','02','daegu'),
('1000004', 2000004, 'dw12349', 'Na','02','incheon')
;

CREATE TABLE `study_db`.`customer_info`(
customer_id varchar(7) not null primary key,
id int(7) not null,
pw varchar(20) not null,
customer_name varchar(20) not null,
sex char(2) not null,
delivery_destination varchar(20) not null
);
########################################
-- CREATE TABLE `study_db`.`shopping_basket`(
-- customer_id varchar(7) not null primary key,
-- product_code int(7) not null,
-- input_date int(8) not null
-- );
########################################
INSERT INTO customer_manage_info
VALUES
('1000000', 10000, 123, 01),
('1000001', 20000, 456, 01),
('1000002', 30000, 908, 01),
('1000003', 40000, 777, 01),
('1000004', 50000, 197, 02)
;

CREATE TABLE `study_db`.`customer_manage_info`(
customer_id varchar(7) not null,
customer_rating int(5) not null primary key,
shopping_point varchar(10) not null,
blacklist_customer int(2) not null,
foreign key(customer_id) references customer_info(customer_id)
);

########################################
INSERT INTO `order`
VALUES
(1000000,10000000,20221219,'seoul',11,'1000000'),
(1000001,10000001,20221218,'seoul',10,'1000001'),
(1000002,10000000,20221218,'seoul',02,'1000002'),
(1000003,10000001,20221219,'seoul',03,'1000003'),
(1000004,10000002,20221219,'seoul',05,'1000004');

CREATE TABLE `study_db`.`order`(
order_code int(7) not null primary key,
product_code int(7) not null,
invoice_date int(8) not null,
delivery_destination varchar(20) not null,
order_num int(2) not null,
customer_id varchar(7) not null,
foreign key(customer_id) references customer_info(customer_id)
);

########################################
INSERT INTO `promotion`
VALUES
(11,1234567,20),
(12,2345678,10),
(13,3456789,30);

CREATE TABLE `study_db`.`promotion`(
promition_code int(2) not null primary key,
card_code int(20) not null,
discount_rate int(2) not null
);
########################################
INSERT INTO `manager`
VALUES
(9000000,1,10,8000000),
(9000001,1,10,8000001),
(9000002,1,10,8000002),
(9000003,1,20,8000003),
(9000004,1,20,8000004);

CREATE TABLE `study_db`.`manager`(
manager_code int(7) not null primary key,
dept_code int(1) not null,
promition_code int(2) not null,
superior_code int(7) not null,
foreign key(promition_code) references promotion(promition_code)
);
########################################
INSERT INTO `product`
VALUES
(1000000,2000000,10000,'OIO',10,4000000),
(1000001,2000001,20000,'OIO2',10,4000000),
(1000002,2000002,30000,'OIO3',10,4000000),
(1000003,2000003,40000,'OIO4',20,4000000),
(1000004,2000004,50000,'OIO5',20,4000000);

CREATE TABLE `study_db`.`product`(
product_code int(7) not null primary key,
order_code int(7) not null,
price int(5) not null,
brand varchar(10) not null,
promition_code int(2) not null,
sales_code int(7) not null,
foreign key(promition_code) references promotion(promition_code),
foreign key(sales_code) references sales(sales_code),
foreign key(order_code) references `order`(order_code)
);
########################################
INSERT INTO `saler_info`
VALUES
(40000000,'1000000000','2000000000','Do'),
(40000001,'1000000001','2000000001','Gu'),
(40000002,'1000000002','2000000002','Na'),
(40000003,'1000000003','2000000003','Oh'),
(40000004,'1000000004','2000000004','Da');

CREATE TABLE `study_db`.`saler_info`(
saler_code int(7) not null primary key,
saler_id varchar(10) not null,
saler_pw varchar(10) not null,
saler_name varchar(10) not null
);
########################################
INSERT INTO `sales`
VALUES
(1000000,20000000,30000000),
(1000001,20000001,30000001),
(1000002,20000002,30000002),
(1000003,20000003,30000003),
(1000004,20000004,30000004);
CREATE TABLE `study_db`.`sales`(
sales_code int(7) not null primary key,
saler_code int(7) not null,
product_code int(7) not null,
foreign key(saler_code) references saler_info(saler_code)
);
########################################
INSERT INTO `saler_manage_info`
VALUES
(01,2000000,500,'01'),
(02,2000000,400,'01'),
(03,2000000,300,'01'),
(04,2000000,200,'01'),
(05,2000000,100,'02');

CREATE TABLE `study_db`.`saler_manage_info`(
saler_rating int(2) primary key,
saler_code int(7) not null,
sales_score int(3) not null,
blacklist_saler varchar(2) not null,
foreign key(saler_code) references saler_info(saler_code)
);

########################################
SELECT * FROM `saler_manage_info`;
########################################
SELECT AVG(saler_rating) AS AVG_saler_rating, MAX(saler_rating) AS MAX_saler_rating
FROM `saler_manage_info`
GROUP BY blacklist_saler
HAVING AVG(sales_score) >= 200;
########################################
SELECT *
FROM customer_info
INNER JOIN customer_manage_info
ON customer_info.customer_id = customer_manage_info.customer_id
WHERE delivery_destination='seoul';
########################################
SELECT *
FROM customer_info
WHERE customer_id IN
(SELECT customer_id
FROM customer_manage_info
WHERE delivery_destination = 'seoul' or delivery_destination='pusan');
########################################
