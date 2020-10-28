#create company table:

CREATE TABLE Company (id INT , name varchar(30) NOT NULL, PRIMARY KEY(id));

#Insert values in company table

INSERT INTO Company (id, name) VALUES (1, 'capgemini'), (2, 'microsoft'), (3, 'amazon');

#create employee table

CREATE TABLE Employee (id INT , name varchar(20) NOT NULL, phone_number varchar(10) NOT NULL, address varchar(30) NOT NULL, gender char(1) NOT NULL, PRIMARY KEY(id));

#Insert values in employee table

INSERT INTO Employee (id, name, phone_number, address, gender) VALUES (1, 'Ram', '3421987654', 'SECTOR 5, Delhi', 'm'),
                                                                      (2, 'Raju', '7421987654', 'SECTOR 7, Delhi', 'm'),
                                                                       (3, 'Gopi', '9876542309', 'SECTOR 10, Pune', 'f');

#creating payroll table

CREATE TABLE Payroll (id INT PRIMARY KEY, basic_pay DOUBLE NOT NULL, deductions DOUBLE NOT NULL, net_pay (basic_pay - deductions) DOUBLE);

#inserting values in Payroll table:

INSERT INTO Payroll (id, basic_pay, deductions) VALUES (1, 20000.0, 3000.0), (2, 40000.0, 6000.0), (3, 60000.0, 9000.0);

# creating department table

CREATE TABLE Department (id INT PRIMARY KEY, name VARCHAR(20) NOT NULL);

#INSERTING INTO DEPARTMENT

INSERT INTO Department (id, name) VALUES (1, 'sales'), (2 , 'marketing'), (3, 'development');

# creating employee- department table

CREATE TABLE Employee_Department (deptId INT PRIMARY KEY, empId INT);

#inserting into emp_dept table

INSERT INTO Employee_Department (deptId, empId) VALUES (1, 3), (2, 3), (3, 1), (2, 2);

# redoing all queries

SELECT e.id, e.name, (p.basic_pay - p.deductions) as salary, d.name as department_name FROM Employee as e, Payroll as p, Department d, Employee_Department as ed where e.id = p.id and  e.id = ed.empId and d.id = ed.deptId;   

SELECT (p.basic_pay - p.deductions) as salary FROM Employee as e, Payroll as p WHERE e.id = p.id and e.name = 'Ram';

UPDATE Employee SET gender = 'M' WHERE  name = 'Ram';

SELECT e.gender, SUM(p.basic_pay-p.deductions) FROM Employee as e, Payroll as p WHERE e.id = p.id GROUP BY e.gender; 

SELECT e.gender, AVG(p.basic_pay-p.deductions) FROM Employee as e, Payroll as p WHERE e.id = p.id GROUP BY e.gender; 

SELECT e.gender, MIN(p.basic_pay-p.deductions) FROM Employee as e, Payroll as p WHERE e.id = p.id GROUP BY e.gender; 

SELECT e.gender, MAX(p.basic_pay-p.deductions) FROM Employee as e, Payroll as p WHERE e.id = p.id GROUP BY e.gender; 


