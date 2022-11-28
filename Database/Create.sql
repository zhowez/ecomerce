CREATE DATABASE IF NOT EXISTS Accounts;

USE Accounts;

# university info
CREATE TABLE IF NOT EXISTS university_list
(
    University_ID   int         NOT NULL unique,
    University_Name varchar(50) NOT NULL,
    PRIMARY KEY (University_ID)

);
# type info
CREATE TABLE IF NOT EXISTS desired_gender
(
    Gender    varchar(50) NOT NULL,
    Gender_ID int         NOT NULL,
    PRIMARY KEY (Gender_ID)
);


INSERT INTO desired_gender
VALUES (Gender="Male", Gender_ID=1);

INSERT INTO desired_gender
    VALUE (Gender="Female", Gender_ID=2);

INSERT INTO desired_gender
    VALUE (Gender="Trans", Gender_ID=3);

INSERT INTO desired_gender
    VALUE (Gender="NonBinary", Gender_ID=4);


# customer info
CREATE TABLE IF NOT EXISTS customer
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
    Customer_University_ID int          NOT NULL,
    Customer_Class_Rank    varchar(10)  NOT NULL,
    Customer_Gender_ID     int          NOT NULL,

    PRIMARY KEY (Customer_ID),
    FOREIGN KEY (Customer_University_ID) REFERENCES university_list (University_ID),
    FOREIGN KEY (Customer_Gender_ID) REFERENCES desired_gender (Gender_ID)

);


# customer info
CREATE TABLE IF NOT EXISTS customer_desired_match_info
(
    Customer_Id       int     NOT NULL,
    Desired_Gender_ID int     NOT NULL,
    Is_Extroverted    boolean NOT NULL,
    PRIMARY KEY (Customer_Id),
    FOREIGN KEY (Customer_Id) REFERENCES customer (Customer_ID),
    FOREIGN KEY (Desired_Gender_ID) REFERENCES desired_gender (Gender_ID)

);

# type info
CREATE TABLE IF NOT EXISTS interests_list
(
    Interest_ID   int         NOT NULL,
    Interest_Name varchar(50) NOT NULL,
    PRIMARY KEY (Interest_ID)
);

# customer info
CREATE TABLE IF NOT EXISTS customer_interests_list
(
    Customer_ID int NOT NULL,
    Interest_ID int NOT NULL,
    PRIMARY KEY (Customer_ID),
    FOREIGN KEY (Customer_ID) REFERENCES customer (Customer_ID),
    FOREIGN KEY (Interest_ID) REFERENCES interests_list (Interest_ID)
);

# type info
CREATE TABLE IF NOT EXISTS dorm_rank_values
(
    Rank_Value int NOT NULL,
    PRIMARY KEY (Rank_Value)
);

INSERT INTO dorm_rank_values
VALUES (1);

INSERT INTO dorm_rank_values
VALUES (2);

INSERT INTO dorm_rank_values
VALUES (3);


# university info
CREATE TABLE IF NOT EXISTS dorm_list
(
    Dorm_ID       int          not null UNIQUE,
    Dorm_Name     varchar(100) NOT NULL UNIQUE,
    University_ID int          NOT NULL UNIQUE,
    PRIMARY KEY (Dorm_ID),
    FOREIGN KEY (University_ID) REFERENCES university_list (University_ID)

);

# customer info
CREATE TABLE IF NOT EXISTS customer_top_three_dorms
(
    Customer_ID int not null,
    Dorm_ID     int not null,
    Rank_Value  int not null,
    Primary Key (Customer_ID, Dorm_ID, Rank_Value),
    FOREIGN KEY (Customer_ID) REFERENCES customer (Customer_ID),
    FOREIGN KEY (Dorm_ID) REFERENCES dorm_list (Dorm_ID),
    FOREIGN KEY (Rank_Value) REFERENCES dorm_rank_values (Rank_Value)
);

# match info
CREATE TABLE IF NOT EXISTS matches
(
    Customer_ID_1 int not null,
    Customer_ID_2 int not null,
    PRIMARY KEY (Customer_ID_1, Customer_ID_2),
    FOREIGN KEY (Customer_ID_1) REFERENCES customer (Customer_ID),
    FOREIGN KEY (Customer_ID_2) REFERENCES customer (Customer_ID)
);

# customer info
CREATE TABLE IF NOT EXISTS potential_matches
(
    Customer_ID        int not null,
    Potential_Match_ID int not null,
    PRIMARY KEY (Customer_ID, Potential_Match_ID),
    FOREIGN KEY (Customer_ID) REFERENCES customer (Customer_ID),
    FOREIGN KEY (Potential_Match_ID) REFERENCES customer (Customer_ID)
);

# customer info
CREATE TABLE IF NOT EXISTS customer_swiped_accounts
(
    Customer_ID        int       not null,
    Potential_Match_ID int       not null,
    Response_Time      TIMESTAMP NOT NULL,
    isLiked            BOOLEAN   NOT NULL,
    PRIMARY KEY (Customer_ID, Potential_Match_ID),
    FOREIGN KEY (Customer_ID) REFERENCES customer (Customer_ID),
    FOREIGN KEY (Potential_Match_ID) REFERENCES customer (Customer_ID)
);



