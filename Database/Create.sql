CREATE DATABASE IF NOT EXISTS Accounts;

USE Accounts;

CREATE TABLE IF NOT EXISTS University_List
(
    University_ID   int         NOT NULL unique,
    University_Name varchar(50) NOT NULL,
    PRIMARY KEY (University_ID)

);

CREATE TABLE IF NOT EXISTS Desired_Gender
(
    Gender    varchar(50) NOT NULL,
    Gender_ID int         NOT NULL,
    PRIMARY KEY (Gender_ID)
);

INSERT INTO Desired_Gender
VALUES ("Male", 1);

INSERT INTO Desired_Gender
    VALUE ("Female", 2);

INSERT INTO Desired_Gender
    VALUE ("Trans", 3);

INSERT INTO Desired_Gender
    VALUE ("NonBinary", 4);


CREATE TABLE IF NOT EXISTS Customer
(
    Customer_ID            int          NOT NULL,
    Customer_First_Name    varchar(100) NOT NULL,
    Customer_Last_Name     varchar(100) NOT NULL,
    Customer_Address_1     varchar(100) NOT NULL,
    Customer_Address_2     varchar(100),
    Customer_City          varchar(50)  NOT NULL,
    Customer_State         varchar(50)  NOT NULL,
    Customer_Zip           varchar(5)   NOT NULL,
    Customer_Email         varchar(50)  NOT NULL,
    Customer_Password_Hash varchar(50)  NOT NULL,
    Customer_University_ID    int  NOT NULL,
    Customer_Class_Rank    varchar(10)  NOT NULL,
    Customer_Gender_ID     int  NOT NULL,

    PRIMARY KEY (Customer_ID),
    FOREIGN KEY (Customer_University_ID) REFERENCES University_List(University_ID),
    FOREIGN KEY (Customer_Gender_ID) REFERENCES Desired_Gender(Gender_ID)

);



CREATE TABLE IF NOT EXISTS Customer_Desired_Match_Info
(
    Customer_Id       int     NOT NULL,
    Desired_Gender_ID int     NOT NULL,
    Is_Extroverted    boolean NOT NULL,
    PRIMARY KEY (Customer_Id),
    FOREIGN KEY (Customer_Id) REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Desired_Gender_ID) REFERENCES Desired_Gender (Gender_ID)

);


CREATE TABLE IF NOT EXISTS Interests_List
(
    Interest_ID   int         NOT NULL,
    Interest_Name varchar(50) NOT NULL,
    PRIMARY KEY (Interest_ID)
);

CREATE TABLE IF NOT EXISTS Customer_Interests_List
(
    Customer_ID int NOT NULL,
    Interest_ID int NOT NULL,
    PRIMARY KEY (Customer_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Interest_ID) REFERENCES Interests_List (Interest_ID)
);

CREATE TABLE IF NOT EXISTS Dorm_Rank_Values
(
    Rank_Value int NOT NULL,
    PRIMARY KEY (Rank_Value)
);

INSERT INTO Dorm_Rank_Values
VALUES (1);

INSERT INTO Dorm_Rank_Values
VALUES (2);

INSERT INTO Dorm_Rank_Values
VALUES (3);




CREATE TABLE IF NOT EXISTS Dorm_List
(
    Dorm_ID       int          not null UNIQUE,
    Dorm_Name     varchar(100) NOT NULL UNIQUE,
    University_ID int          NOT NULL UNIQUE,
    PRIMARY KEY (Dorm_ID),
    FOREIGN KEY (University_ID) REFERENCES University_List (University_ID)

);


CREATE TABLE IF NOT EXISTS Customer_Top_Three_Dorms
(
    Customer_ID int not null,
    Dorm_ID     int not null,
    Rank_Value  int not null,
    Primary Key (Customer_ID, Dorm_ID, Rank_Value),
    FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Dorm_ID) REFERENCES Dorm_List (Dorm_ID),
    FOREIGN KEY (Rank_Value) REFERENCES Dorm_Rank_Values (Rank_Value)
);


CREATE TABLE IF NOT EXISTS Matches
(
    Customer_ID_1 int not null,
    Customer_ID_2 int not null,
    PRIMARY KEY (Customer_ID_1, Customer_ID_2),
    FOREIGN KEY (Customer_ID_1) REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Customer_ID_2) REFERENCES Customer (Customer_ID)
);


CREATE TABLE IF NOT EXISTS Potential_Matches
(
    Customer_ID        int not null,
    Potential_Match_ID int not null,
    PRIMARY KEY (Customer_ID, Potential_Match_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Potential_Match_ID) REFERENCES Customer (Customer_ID)
);

CREATE TABLE IF NOT EXISTS Customer_Swiped_Accounts
(
    Customer_ID        int       not null,
    Potential_Match_ID int       not null,
    Response_Time      TIMESTAMP NOT NULL,
    isLiked            BOOLEAN   NOT NULL,
    PRIMARY KEY (Customer_ID, Potential_Match_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
    FOREIGN KEY (Potential_Match_ID) REFERENCES Customer (Customer_ID)
);



