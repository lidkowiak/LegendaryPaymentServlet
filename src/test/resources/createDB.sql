DROP TABLE IF EXISTS PAYMENT;
CREATE TABLE PAYMENT(
	ID VARCHAR(10), 
	STATUS VARCHAR(32), 
	AMOUNT INT 
);

DROP TABLE IF EXISTS TRANSACTION;
CREATE TABLE TRANSACTION(
	ID VARCHAR(16), 
	ACTIVE CHAR(5), 
	CONTACT_EMAIL VARCHAR(255), 
	CONTACT_PERSON VARCHAR(255), 
	PAYMENT_ID VARCHAR(10) 
);

DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS(
	ID VARCHAR(10), 
	STATUS VARCHAR(32), 
	TOTAL INT,
	EMAIL VARCHAR(64),
	FULL_NAME VARCHAR(64)
);