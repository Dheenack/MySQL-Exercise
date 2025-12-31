drop database if exists employee_details;
create database employee_details;
use employee_details;
CREATE TABLE EMPLOYEE(
Fname varchar(20),
Minit varchar(15),
Lname varchar(20),
Ssn BIGINT,
Bdate date,
Address TEXT,
Sex ENUM('M','F','O'),
Salary decimal(10,2),
Super_ssn BIGINT,
Dno int,
constraint fk_super_ssn foreign key(Super_ssn) references EMPLOYEE(Ssn),
constraint pk_employee primary key (Ssn)
);

CREATE TABLE DEPARTMENT(
Dname varchar(20),
Dnumber int,
Mgr_ssn BIGINT,
Mgr_start_date date,
constraint pk_department primary key(Dnumber),
constraint fk_mgr_ssn foreign key(Mgr_ssn) references EMPLOYEE(Ssn)
);

ALTER TABLE EMPLOYEE ADD constraint fk_employee_dno foreign key(Dno) references DEPARTMENT(Dnumber);

CREATE TABLE DEPT_LOCATIONS(
Dnumber int,
Dlocation varchar(15),
constraint pk_dept_locations primary key (Dnumber,Dlocation),
constraint fk_Dnumber_dept_locations foreign key(Dnumber) references DEPARTMENT(Dnumber)
);

CREATE TABLE PROJECT(
Pname varchar(20),
Pnumber int ,
Plocation varchar(20),
Dnum int,
constraint pk_project primary key(Pnumber),
constraint fk_Dnum_project foreign key (Dnum) references DEPARTMENT(Dnumber)
);

CREATE TABLE WORKS_ON(
Essn BIGINT,
Pno int,
Hours time,
constraint pk_works_on primary key (Essn,Pno),
constraint fk_Essn_works_on foreign key(Essn) references EMPLOYEE(Ssn),
constraint fk_pno_working_on foreign key (Pno) references PROJECT(Pnumber)
);

CREATE TABLE DEPENDENT(
Essn BIGINT,
Dependent_name varchar(20),
Sex Enum ('M','F','O'),
Bdate date,
Relationship varchar(15),
constraint pk_dependent primary key(Essn,Dependent_name),
constraint fk_Essn_dependent foreign key(Essn) references EMPLOYEE(Ssn)
);