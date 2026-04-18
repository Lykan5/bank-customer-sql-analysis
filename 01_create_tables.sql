--Create customers Tables
CREATE TABLE customers (
    customer_id   NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100),
    city          VARCHAR2(50),
    account_type  VARCHAR2(20)
);

--create transactions Table
CREATE TABLE transactions (
    transaction_id   NUMBER PRIMARY KEY,
    customer_id      NUMBER,
    transaction_date DATE,
    transaction_type VARCHAR2(20),
    amount           NUMBER(10, 2),
    FOREIGN KEY ( customer_id )
        REFERENCES customers ( customer_id )
);
