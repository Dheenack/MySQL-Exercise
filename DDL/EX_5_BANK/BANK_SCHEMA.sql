drop database if exists bank;
show databases;
create database bank;
use bank;
CREATE TABLE Customers(
customer_id int,
first_name varchar(50),
last_name varchar(50),
email varchar(100),
phone VARCHAR(20),
address varchar(255),
date_of_birth DATE,
constraint pk_customers primary key(customer_id),
created_at TIMESTAMP default CURRENT_TIMESTAMP()
);

CREATE TABLE Accounts(
account_id int,
customer_id int,
account_type varchar(20),
balance DECIMAL(15,2),
opened_date DATE,
ac_status varchar(20),
constraint pk_acc primary key(account_id),
constraint fk_acc foreign key (customer_id) references Customers(customer_id)
);

CREATE TABLE Transactions(
transaction_id int,
account_id int,
amount DECIMAL(15,2),
transaction_type varchar(20),
transaction_date TIMESTAMP,
tr_description VARCHAR(255),
constraint pk_tr primary key(transaction_id),
constraint fk_tr foreign key(account_id) references Accounts(account_id)
);

CREATE TABLE Loans (
loan_id int,
customer_id int,
loan_amount DECIMAL(15,2),
loan_type VARCHAR(50),
interest_rate DECIMAL(5,2),
loan_term_months INT,
start_date DATE,
due_date DATE,
loan_status VARCHAR(50),
constraint PK_LOANS primary key(loan_id),
constraint fk_loans foreign key(customer_id) references Customers(customer_id)
);