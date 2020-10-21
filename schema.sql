CREATE DATABASE OnlineRechargePortal
USE OnlineRechargePortal
-----------------------------------------
CREATE TABLE user_details(
user_id int PRIMARY KEY IDENTITY,
full_name varchar(40) NOT NULL,
email varchar(80) UNIQUE NOT NULL,
mobileno varchar(10) UNIQUE NOT NULL,
username varchar(12) UNIQUE NOT NULL,
password varchar(12) NOT NULL
)

CREATE TABLE operator_details(
operator_id int PRIMARY KEY IDENTITY,
operator_name varchar(40) UNIQUE,
company_name varchar(40)
)

CREATE TABLE recharge_plan_details(
plan_id int PRIMARY KEY IDENTITY,
operator_id int NOT NULL,
plan_details varchar(100) NOT NULL,
plan_validity varchar(40) NOT NULL,
price money UNIQUE NOT NULL,
CONSTRAINT FK_operator_details1 FOREIGN KEY (operator_id)
REFERENCES operator_details(operator_id)
)

CREATE TABLE mobileno_details(
mobile_no varchar(10) PRIMARY KEY,
operator_id int NOT NULL,
owner_name varchar(20) NOT NULL,
CONSTRAINT FK_operator_details FOREIGN KEY (operator_id)
REFERENCES operator_details(operator_id)
)

CREATE TABLE mobile_recharge(
transaction_id int PRIMARY KEY IDENTITY,
operator_id int NOT NULL,
mobile_no varchar(10) NOT NULL,
plan_id int,
amount money NOT NULL,
CONSTRAINT FK_operator_details2 FOREIGN KEY (operator_id) 
REFERENCES operator_details(operator_id),
CONSTRAINT FK_mobileno_details FOREIGN KEY (mobile_no)
REFERENCES mobileno_details(mobile_no),
CONSTRAINT FK_recharge_plan_details FOREIGN KEY (plan_id)
REFERENCES recharge_plan_details(plan_id)
)
---------------------------------------
INSERT INTO operator_details VALUES(101,'VodafoneIdea','VI Limited');
INSERT INTO operator_details VALUES(102,'BSNL','BSNL INDIA');
INSERT INTO operator_details VALUES(103,'Jio','Relience');

INSERT INTO mobileno_details VALUES('8698634713',101,'Avadhoot Chavan');
INSERT INTO mobileno_details VALUES('8329557301',103,'Avadhoot Chavan');
INSERT INTO mobileno_details VALUES('9420439088',102,'Aarti Chavan');
INSERT INTO mobileno_details VALUES('7083823113',101,'A A Chavan');

INSERT INTO user_details (full_name,email,mobileno,username,password) VALUES('Avadhoot Chavan','avadhutch50@gmail.com','8698634713','Avadhutch','Avadhut123');

INSERT INTO mobile_recharge (user_id,operator_id,mobile_no,amount) VALUES(3,103,'8329557301',49);
---------------------------------------

select * from user_details;
select * from operator_details;
select * from recharge_plan_details;
select * from mobileno_details;
select * from mobile_recharge;

select operator_name from operator_details where operator_id=(select operator_id from mobileno_details where mobile_no='7083823113');

------------------
DROP TABLE user_details

DROP TABLE operator_details

DROP TABLE recharge_plan_details

DROP TABLE mobileno_details

DROP TABLE mobile_recharge

DROP DATABASE OnlineRechargePortal
------------------