-- Creating tables
CREATE TABLE Person (
    taxPayerId CHAR(9) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    paddress VARCHAR(255) NOT NULL
);

CREATE TABLE Customer (
    taxPayerId CHAR(9) PRIMARY KEY,
    sinceYear INT NOT NULL,
    FOREIGN KEY (taxPayerId) REFERENCES Person(taxPayerId)
);

CREATE TABLE Employee (
    taxPayerId CHAR(9) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (taxPayerId) REFERENCES Person(taxPayerId)
);

CREATE TABLE Account (
    accNum CHAR(9) PRIMARY KEY,
    type VARCHAR(20) NOT NULL,
    balance DECIMAL(15,2) NOT NULL
);

CREATE TABLE Owns (
    taxPayerId CHAR(9),
    accNum CHAR(9),
    PRIMARY KEY (taxPayerId, accNum),
    FOREIGN KEY (accNum) REFERENCES Account(accNum),
    FOREIGN KEY (taxPayerId) REFERENCES Customer(taxPayerId)
);

CREATE TABLE Checking (
    accNum CHAR(9) PRIMARY KEY,
    noFreeChecks INT NOT NULL,
    FOREIGN KEY (accNum) REFERENCES Account(accNum)
);

CREATE TABLE Saving (
    accNum CHAR(9) PRIMARY KEY,
    intRate DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (accNum) REFERENCES Account(accNum)
);

CREATE TABLE Loan (
    loanNo CHAR(9) PRIMARY KEY,
    amount DECIMAL(15,2) NOT NULL
);

CREATE TABLE Borrow (
    taxPayerId CHAR(9),
    loanNo CHAR(9),
    PRIMARY KEY (taxPayerId, loanNo),
    FOREIGN KEY (loanNo) REFERENCES Loan(loanNo),
    FOREIGN KEY (taxPayerId) REFERENCES Customer(taxPayerId)
);

CREATE TABLE Acc_transaction (
    accNum CHAR(9),
    tDate DATE NOT NULL,
    tTime TIME NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    type VARCHAR(20) NOT NULL,
    FOREIGN KEY (accNum) REFERENCES Account(accNum)
);

-- Inserting Data into tables
INSERT INTO Person VALUES ('123456789', 'John Doe', '123 Elm St');
INSERT INTO Person VALUES ('987654321', 'Alice Smith', '456 Oak St');
INSERT INTO Person VALUES ('555666777', 'Bob Johnson', '789 Pine St');

INSERT INTO Customer VALUES ('123456789', 2010);
INSERT INTO Customer VALUES ('555666777', 2015);

INSERT INTO Employee VALUES ('987654321', 'Manager', 75000.00);

INSERT INTO Account VALUES ('122456799', 'Checking', 5000.00);
INSERT INTO Account VALUES ('222333444', 'Saving', 12000.00);
INSERT INTO Account VALUES ('333444555', 'Checking', 3000.00);

INSERT INTO Checking VALUES ('122456799', 50);
INSERT INTO Checking VALUES ('333444555', 30);

INSERT INTO Saving VALUES ('222333444', 2.5);

INSERT INTO Owns VALUES ('123456789', '122456799');
INSERT INTO Owns VALUES ('555666777', '222333444');

INSERT INTO Loan VALUES ('L001', 10000.00);
INSERT INTO Loan VALUES ('L002', 5000.00);

INSERT INTO Borrow VALUES ('123456789', 'L001');
INSERT INTO Borrow VALUES ('555666777', 'L002');

INSERT INTO Acc_transaction VALUES ('122456799', '2025-03-10', '14:30:00', 200.00, 'Deposit');
INSERT INTO Acc_transaction VALUES ('222333444', '2025-03-09', '09:15:00', 500.00, 'Withdrawal');
INSERT INTO Acc_transaction VALUES ('333444555', '2025-03-08', '16:45:00', 100.00, 'Deposit');


-- Creating Views
CREATE VIEW employeeView AS 
SELECT p.taxPayerId, p.name, p.paddress, e.title, e.salary
FROM Employee AS e, Person AS p
WHERE e.taxPayerId = p.taxPayerId;

CREATE VIEW customerView AS 
SELECT p.taxPayerId, p.name, p.paddress, c.sinceYear
FROM Person AS p, Customer AS c
WHERE c.taxPayerId = p.taxPayerId;

CREATE VIEW checkingView AS 
SELECT a.accNum, a.type, a.balance, c.noFreeChecks
FROM Account AS a, Checking AS c
WHERE a.accNum = c.accNum;

CREATE VIEW savingView AS 
SELECT a.accNum, a.type, a.balance, s.intRate
FROM Account AS a, Saving AS s
WHERE a.accNum = s.accNum;

SELECT * FROM employeeView;
SELECT * FROM customerView;
SELECT * FROM checkingView;
SELECT * FROM savingView;

-- Dropping everthing
DROP VIEW IF EXISTS employeeView;
DROP VIEW IF EXISTS customerView;
DROP VIEW IF EXISTS checkingView;
DROP VIEW IF EXISTS savingView;

DROP TABLE IF EXISTS Acc_transaction;
DROP TABLE IF EXISTS Borrow;
DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS Checking;
DROP TABLE IF EXISTS Saving;
DROP TABLE IF EXISTS Owns;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Person;
