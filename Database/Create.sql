CREATE DATABASE IF NOT EXISTS Accounts;

USE Accounts;

CREATE TABLE IF NOT EXISTS CUSTOMER
(
    Customer_ID            int,
    Customer_First_Name    varchar(100),
    Customer_Last_Name     varchar(100),
    Customer_Address_1     varchar(100),
    Customer_Address_2     varchar(100),
    Customer_City          varchar(50),
    Customer_State         varchar(50),
    Customer_Zip           varchar(5),
    Customer_Email         varchar(50),
    Customer_Password_Hash varchar(50),
    Customer_University    varchar(50),
    Customer_Class_Rank    varchar(10),
    Customer_Gender        varchar(10),

    PRIMARY KEY (Customer_ID)

)

