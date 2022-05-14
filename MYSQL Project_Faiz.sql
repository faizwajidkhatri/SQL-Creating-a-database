create database project;
use project;

CREATE TABLE `Employee_Details` (
    `Emp_ID` INT(5) AUTO_INCREMENT PRIMARY KEY,
    `Emp_NAME` VARCHAR(30),
    `Emp_BRANCH` VARCHAR(15),
    `Emp_DESIGNATION` VARCHAR(40),
    `Emp_ADDR` VARCHAR(100),
    `Emp_CONT_NO` VARCHAR(10)
);
describe `Employee_Details`;

insert into `Employee_Details`(`Emp_NAME`,`Emp_BRANCH`,`Emp_DESIGNATION`,`Emp_ADDR`,`Emp_CONT_NO`)
values ('Faiz','Data Science','Data Engineer','Dadar East Mumbai-400014','8779834739');

SELECT 
    *
FROM
    `Employee_Details`;
    
CREATE TABLE `Membership` (
    `M_ID` INT PRIMARY KEY,
    `START_DATE` text,
    `END_DATE` text
);

describe Membership;

insert into `Membership`(`M_ID`,`START_DATE`,`END_DATE`)
values(1,'2021-05-14','2022-05-13');

SELECT 
    *
FROM
    Membership;
    
CREATE TABLE Customer (
    `Cust_ID` INT(4) PRIMARY KEY,
    `Cust_NAME` VARCHAR(40),
    `Cust_EMAIL_ID` VARCHAR(50),
    `Cust_CONT_NO` VARCHAR(10),
    `Cust_ADDR` VARCHAR(100),
    `Cust_TYPE` VARCHAR(30),
    `M_ID` INT,
    FOREIGN KEY (M_ID)
        REFERENCES Membership (M_ID)
);

SELECT 
    *
FROM
    customer;
describe customer;

insert into customer(`Cust_ID`,`Cust_NAME`,`Cust_EMAIL_ID`,`Cust_CONT_NO`,`Cust_ADDR`,`Cust_TYPE`,`M_ID`)
values('2','Faiz','faizkhatri27@gmail.com','8779834739','Dadar East Mumbai-400014','Retail','1');

SELECT 
    *
FROM
    customer;

CREATE TABLE `Payment_Details` (
    `PAYMENT_ID` VARCHAR(40) PRIMARY KEY,
    `AMOUNT` INT,
    `PAYMENT_STATUS` VARCHAR(10),
    `PAYMENT_DATE` TEXT,
    `PAYMENT_MODE` VARCHAR(25),
    `SH_ID` VARCHAR(6),
    `C_ID` INT(4)
);

alter table Payment_Details add foreign key (SH_ID) references Shipment_Details (SH_ID);
alter table Payment_Details add foreign key (C_ID) references Customer (Cust_ID);

SET FOREIGN_KEY_CHECKS=0;

describe Payment_Details;

insert into `Payment_Details`(`PAYMENT_ID`,`AMOUNT`,`PAYMENT_STATUS`,`PAYMENT_DATE`,`PAYMENT_MODE`,`SH_ID`,`C_ID`)
values ('101','529','paid','2021-10-11','COD','2','2');

SELECT 
    *
FROM
    `Payment_Details`;
    
    alter table `Payment_Details` add constraint foreign key (`SH_ID`) references `status`(`SH_ID`);

CREATE TABLE `Shipment_Details` (
    `SH_ID` VARCHAR(6) PRIMARY KEY,
    `SH_CONTENT` VARCHAR(40),
    `SH_DOMAIN` VARCHAR(15),
    `SER_TYPE` VARCHAR(15),
    `SH_WEIGHT` VARCHAR(10),
    `SH_CHARGES` INT(10),
    `SR_ADDR` VARCHAR(100),
    `DS_ADDR` VARCHAR(100),
    `Cust_ID` INT(4),
    FOREIGN KEY (`Cust_ID`)
        REFERENCES customer (`Cust_ID`)
);

describe `Shipment_Details`;

SELECT 
    *
FROM
    `Shipment_details`;

insert into `Shipment_Details`(`SH_ID`,`SH_CONTENT`,`SH_DOMAIN`,`SER_TYPE`,`SH_WEIGHT`,`SH_CHARGES`,`SR_ADDR`,`DS_ADDR`,`Cust_ID`)
values ('143','Industrial Equipments','Domestic','Regular','367','1467','100 Block of NEWMONTGOMERY ST','2600 Block of MISSION ST','1');

CREATE TABLE `Status` (
    `CURRENT_ST` VARCHAR(15),
    `SENT_DATE` TEXT,
    `DELIVERY_DATE` TEXT,
    `SH_ID` VARCHAR(6) PRIMARY KEY
);

SELECT 
    *
FROM
    status;
insert into `Status`(`CURRENT_ST`,`SENT_DATE` ,`DELIVERY_DATE` ,`SH_ID`)
values ('DELIVERED',1/12/2009,2/12/2009,'2');

insert into `Status`(`CURRENT_ST`,`SENT_DATE` ,`DELIVERY_DATE` ,`SH_ID`)
values ('NOT DELIVERED',1/12/2009,2/12/2009,'3');
    
describe status;

CREATE TABLE `employee_manages_shipment` (
    `Employee_E_ID` INT(5),
    `Shipment_SH_ID` VARCHAR(6),
    `SH_ID` VARCHAR(6)
);

insert into `employee_manages_shipment`(`Employee_E_ID`,`Shipment_SH_ID`,`SH_ID`)
values('1','234','432');

insert into `employee_manages_shipment`(`Employee_E_ID`,`Shipment_SH_ID`,`SH_ID`)
values('2','324','342');

alter table employee_manages_shipment add foreign key(SH_ID) references `Status`(`SH_ID`);
alter table employee_manages_shipment add foreign key (Employee_E_ID) references Employee_Details(Emp_ID);
alter table employee_manages_shipment  add foreign key (Shipment_SH_ID) references Shipment_Details(SH_ID);

SELECT 
    *
FROM
    employee_manages_shipment;
    
describe employee_manages_shipment;
