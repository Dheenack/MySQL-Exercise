drop database if exists Sales;
create database Sales;
USE Sales;

CREATE TABLE Sales_table(
Sales_number int,
Sales_date date,
Customer_code varchar(10),
constraint pk_sales_table primary key(Sales_number)
);

CREATE TABLE Sales_detail_table (
Sales_number int,
Product_code varchar(10),
Quantity int,
constraint pk_sales_detail_table primary key(Sales_number,Product_code)
);

CREATE TABLE Product_table(
Product_code varchar(10),
Product_name varchar(20),
Unit_price DECIMAL(10,2),
constraint pk_product_table primary key(Product_code)
);

CREATE TABLE Sales_staff_table(
Sales_staff_code varchar(10),
Sales_staff_name varchar(20),
Phone_number BIGINT,
Email Varchar(20),
constraint pk_sales_staff_table primary key(Sales_staff_code)
);

CREATE TABLE Customer_table(
Customer_code varchar(10),
Customer_name varchar(20),
Customer_address TEXT,
Phone_number BIGINT,
Sales_staff_code varchar(10),
constraint pk_customer_table primary key(Customer_code),
constraint fk_Sales_staff_code_customer_table 
foreign key(Sales_staff_code) references Sales_staff_table(Sales_staff_code)
);

ALTER TABLE Sales_table ADD CONSTRAINT FK_CUSTOMER_CODE_SALES_TABLE 
FOREIGN KEY (Customer_code) REFERENCES Customer_table(Customer_code);
