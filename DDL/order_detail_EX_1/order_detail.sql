create database order_detail;
use order_detail;

-- drop database order_detail;
create table employee (
SSN int primary key,
fname varchar(20), 
lname varchar(20),
zip varchar(15)
);

create table customer(
Cnumber int primary key,
fname varchar(20), 
lname varchar(20),
zipCode varchar(15)
);

create table employee_orders(
order_number int primary key,
reciept_date date not null,
expected_date date,
actual_date date
);

create table product(
p_number int primary key,
p_name varchar(20),
price decimal(10,2) check (price>=0),
quantity int
);

create table orders(
order_number int,
p_number int,
quantity int,
foreign key (order_number) references employee_orders(order_number),
foreign key (p_number) references product(p_number),
primary key (order_number,p_number)
);

create table customer_orders(
employee int,
customer int,
order_number int,
foreign key (employee) references employee(SSN),
foreign key (customer) references customer(Cnumber),
foreign key (order_number) references employee_orders(order_number),
primary key (employee,customer,order_number)
);

