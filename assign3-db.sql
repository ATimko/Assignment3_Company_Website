--   Script: COMPANY
--   Assignment 3

-- SQL Script COMPANY database from textbook
DROP DATABASE IF EXISTS COMPANY;
CREATE DATABASE COMPANY;
USE COMPANY;

CREATE TABLE DEPARTMENT( 
  Dname  VARCHAR(15)  NOT NULL, 
  Dnumber  INT  NOT NULL, 
  Mgr_ssn  CHAR(9)  NOT NULL, 
  Mgr_start_date DATE, 
  PRIMARY KEY (Dnumber), 
  UNIQUE (Dname) ) ;


CREATE TABLE EMPLOYEE( 
  Fname  VARCHAR(10)  NOT NULL,  
  Minit  CHAR,  
  Lname  VARCHAR(10)  NOT NULL, 
  Ssn  CHAR(9)  NOT NULL PRIMARY KEY, 
  Bdate  DATE, 
  Address  VARCHAR(50), 
  Sex  CHAR, 
  Salary  DECIMAL(10,2), 
  Super_ssn  CHAR(9), 
  Dno  INT  NOT NULL, 
  FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn) ON DELETE CASCADE ON UPDATE CASCADE, 
  FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE DEPT_LOCATIONS( 
  Dnumber  INT  NOT NULL, 
  Dlocation  VARCHAR(20)  NOT NULL , 
  PRIMARY KEY (Dnumber, Dlocation),  
  FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE PROJECT( 
  Pname  VARCHAR(20)  NOT NULL, 
  Pnumber  INT  NOT NULL  PRIMARY KEY, 
  Plocation  VARCHAR(20), 
  Dnum  INT  NOT NULL, 
  UNIQUE (Pname), 
  FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE WORKS_ON( 
  Essn CHAR(9)  NOT NULL, 
  Pno  INT  NOT NULL, 
  Hours  DECIMAL(3,1)  NOT NULL, 
  PRIMARY KEY(Essn, Pno), 
  FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn) ON DELETE CASCADE ON UPDATE CASCADE, 
  FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE DEPENDENT( 
  Essn  CHAR(9)  NOT NULL, 
  Dependent_name VARCHAR(20)  NOT NULL, 
  Sex  CHAR, 
  Bdate  DATE, 
  Relationship  VARCHAR(20), 
  PRIMARY KEY (Essn, Dependent_name), 
  FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn) ON DELETE CASCADE ON UPDATE CASCADE);


INSERT INTO DEPARTMENT VALUES ('Research', 5, '333445555', '1988-05-22');
INSERT INTO DEPARTMENT VALUES ('Administration', 4, '987654321', '1995-01-01');
INSERT INTO DEPARTMENT VALUES ('Headquarters', 1, '888665555', '1981-06-19');

INSERT INTO DEPT_LOCATIONS VALUES (1, 'Houston') ;
INSERT INTO DEPT_LOCATIONS VALUES (4, 'Stafford');
INSERT INTO DEPT_LOCATIONS VALUES (5, 'Bellaire');
INSERT INTO DEPT_LOCATIONS VALUES (5, 'Sugarland');
INSERT INTO DEPT_LOCATIONS VALUES (5, 'Houston');

INSERT INTO EMPLOYEE VALUES ('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000, NULL, 1);
INSERT INTO EMPLOYEE VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20' , '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
INSERT INTO EMPLOYEE VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);
INSERT INTO EMPLOYEE VALUES ('Franklin', 'T', 'Wong', '333445555', '1955-12-08' , '638 Voss, Houston, TX', 'M', 40000 , '888665555', 5);
INSERT INTO EMPLOYEE VALUES ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humble, Tx', 'M', 38000 , '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5);
INSERT INTO EMPLOYEE VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19' , '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);


INSERT INTO PROJECT VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO PROJECT VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO PROJECT VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO PROJECT VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO PROJECT VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO PROJECT VALUES ('Newbenefits', 30, 'Stafford', 4);

INSERT INTO DEPENDENT VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter');
INSERT INTO DEPENDENT VALUES ('333445555', 'Theodore', 'M', '1983-10-25', 'Son');
INSERT INTO DEPENDENT VALUES ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse');
INSERT INTO DEPENDENT VALUES ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');
INSERT INTO DEPENDENT VALUES ('123456789', 'Michael', 'M', '1988-01-04', 'Son');
INSERT INTO DEPENDENT VALUES ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter');
INSERT INTO DEPENDENT VALUES ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

INSERT INTO WORKS_ON VALUES ('123456789', 1, 32.5);
INSERT INTO WORKS_ON VALUES ('123456789', 2, 7.5);
INSERT INTO WORKS_ON VALUES ('666884444', 3, 40);
INSERT INTO WORKS_ON VALUES ('453453453', 1, 20);
INSERT INTO WORKS_ON VALUES ('453453453', 2, 20);
INSERT INTO WORKS_ON VALUES ('333445555', 2, 10);
INSERT INTO WORKS_ON VALUES ('333445555', 3, 10);
INSERT INTO WORKS_ON VALUES ('333445555', 10, 10);
INSERT INTO WORKS_ON VALUES ('333445555', 20, 10);
INSERT INTO WORKS_ON VALUES ('999887777', 30, 30);
INSERT INTO WORKS_ON VALUES ('999887777', 10, 10);
INSERT INTO WORKS_ON VALUES ('987987987', 10, 35);
INSERT INTO WORKS_ON VALUES ('987987987', 30, 5);
INSERT INTO WORKS_ON VALUES ('987654321', 30, 20);
INSERT INTO WORKS_ON VALUES ('987654321', 20, 15);
INSERT INTO WORKS_ON VALUES ('888665555', 20, 10);

ALTER TABLE DEPARTMENT ADD FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn) ON DELETE CASCADE ON UPDATE CASCADE;
