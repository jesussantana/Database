DROP DATABASE IF EXISTS S17;
CREATE DATABASE S17;
USE S17;

SET NAMES utf8;
SET character_set_client = utf8mb4;

CREATE TABLE CUSTOMERS (
    Customer_id INT(11) NOT NULL,
    Customer_Name VARCHAR(50),
    Mail VARCHAR(50),
    Phone_customer VARCHAR(50),
    PRIMARY KEY (Customer_id)
);
   
CREATE TABLE ESTABLISHMENTS (
    Establishment_id INT(11) NOT NULL,
    Establishment_name VARCHAR(50),
    Location VARCHAR(50),
    Surface VARCHAR(50),
    PRIMARY KEY (Establishment_id)
);
    
CREATE TABLE WORKERS (
    Worker_id INT(11) NOT NULL,
    Worker_Name VARCHAR(50),
    Establiment_id INT(11) NOT NULL,
    Data_contract DATETIME,
    Phone_worker VARCHAR(50),
    PRIMARY KEY (Worker_id),
    FOREIGN KEY (Establishment_id)
        REFERENCES ESTABLISHMENT (Establishment_id)
);
    
CREATE TABLE PRODUCT_TYPE (
    Type_id INT(11) NOT NULL,
    Type_Name VARCHAR(50),
    PRIMARY KEY (Type_id)
);
   
CREATE TABLE PRODUCTS (
    Product_id INT(11) NOT NULL,
    Product_Name VARCHAR(50),
    Type_id INT(11) NOT NULL,
    Price INT(11) NOT NULL,
    Datetime_production DATETIME,
    PRIMARY KEY (Product_id),
    FOREIGN KEY (Type_id)
        REFERENCES PRODUCT_TYPE (Type_id)
);
   

CREATE TABLE PURCHASES (
    Purchase_id INT(11) NOT NULL,
    Product_id INT(11) NOT NULL,
    Industry_Worker INT(11) NOT NULL,
    Customer_id INT(11) NOT NULL,
    Price_sum INT(11) NOT NULL,
    Date_Purchase DATETIME,
    PRIMARY KEY (Purchase_id),
    FOREIGN KEY (Product_id)
        REFERENCES PRODUCTS (Product_id),
    FOREIGN KEY (Worker_id)
        REFERENCES WORKERS (Worker_id),
    FOREIGN KEY (Customer_id)
        REFERENCES CUSTOMERS (Customer_id)
);
