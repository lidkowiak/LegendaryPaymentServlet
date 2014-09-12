DROP TABLE IF EXISTS PAYMENT;
CREATE TABLE PAYMENT(
	ID VARCHAR(10), 
	STATUS VARCHAR(32), 
	AMOUNT INT 
);

INSERT 
	INTO PAYMENT(ID, STATUS, AMOUNT)
	VALUES ('2000042', 'NEW', 7659);

INSERT 
	INTO PAYMENT(ID, STATUS, AMOUNT)
	VALUES ('2000043', 'NEW', 9900);

INSERT 
	INTO PAYMENT(ID, STATUS, AMOUNT)
	VALUES ('2000044', 'COMPLETED', 4549);

DROP TABLE IF EXISTS TRANSACTION;
CREATE TABLE TRANSACTION(
	ID BIGINT auto_increment, 
	ACTIVE CHAR(1), 
	CONTACT_EMAIL VARCHAR(255), 
	CONTACT_PERSON VARCHAR(255), 
	PAYMENT_ID VARCHAR(10) 
);

INSERT 
	INTO TRANSACTION(ID, ACTIVE, CONTACT_EMAIL, CONTACT_PERSON, PAYMENT_ID)
	VALUES (10, 'N', 'alan@customers.com', 'Alan', '2000042');

INSERT 
	INTO TRANSACTION(ID, ACTIVE, CONTACT_EMAIL, CONTACT_PERSON, PAYMENT_ID)
	VALUES (11, 'Y', 'alan@customers.com', 'Alan', '2000042');

INSERT 
	INTO TRANSACTION(ID, ACTIVE, CONTACT_EMAIL, CONTACT_PERSON, PAYMENT_ID)
	VALUES (12, 'Y', 'bob@customers.com', 'Bob', '2000043');

INSERT 
	INTO TRANSACTION(ID, ACTIVE, CONTACT_EMAIL, CONTACT_PERSON, PAYMENT_ID)
	VALUES (13, 'Y', 'bob@customers.com', 'Bob', '2000043');

INSERT 
	INTO TRANSACTION(ID, ACTIVE, CONTACT_EMAIL, CONTACT_PERSON, PAYMENT_ID)
	VALUES (14, 'Y', 'charile@customers.com', 'Charile', '2000044');

DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS(
	ID VARCHAR(10), 
	STATUS VARCHAR(32), 
	TOTAL INT,
	EMAIL VARCHAR(64),
	FULL_NAME VARCHAR(64)
);

INSERT 
	INTO ORDERS(ID, STATUS, TOTAL, EMAIL, FULL_NAME)
	VALUES ('6789', 'PENDING', 12340, 'alan@customers.com', 'Alan');
	
INSERT 
	INTO ORDERS(ID, STATUS, TOTAL, EMAIL, FULL_NAME)
	VALUES ('6790', 'CANCELLED', 299, 'alan@customers.com', 'Alan');
	
INSERT 
	INTO ORDERS(ID, STATUS, TOTAL, EMAIL, FULL_NAME)
	VALUES ('6791', 'COMPLETED', 10000, 'bob@customers.com', 'Bob');

INSERT 
	INTO ORDERS(ID, STATUS, TOTAL, EMAIL, FULL_NAME)
	VALUES ('6792', 'PENDING', 10000, 'charlie@customers.com', 'Charile');

INSERT 
	INTO ORDERS(ID, STATUS, TOTAL, EMAIL, FULL_NAME)
	VALUES ('6793', 'PENDING', 10000, 'dana@customers.com', 'Dana');
