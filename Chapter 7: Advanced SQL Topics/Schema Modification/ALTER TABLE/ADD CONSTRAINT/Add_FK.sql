-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE (
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Ssn VARCHAR(11) PRIMARY KEY,
    Salary DECIMAL(10,2),
    Super_ssn VARCHAR(11),
    Dno INTEGER
);

-- Create DEPENDENT table
CREATE TABLE DEPENDENT (
    Essn VARCHAR(11),
    Dependent_name VARCHAR(50),
    Relationship VARCHAR(50),
    PRIMARY KEY (Essn, Dependent_name)
);

-- Insert Employee data
INSERT INTO EMPLOYEE (Fname, Lname, Ssn, Salary, Super_ssn, Dno) VALUES
('John', 'Smith', '123456789', 75000.00, '333445555', 5),
('Franklin', 'Wong', '333445555', 90000.00, '888665555', 5),
('Jennifer', 'Wallace', '987654321', 85000.00, '888665555', 4),
('Ahmad', 'Jabbar', '987987987', 70000.00, '987654321', 4);

-- Insert Dependent data
INSERT INTO DEPENDENT (Essn, Dependent_name, Relationship) VALUES
('123456789', 'Alice Smith', 'Daughter'),
('123456789', 'Elizabeth Smith', 'Spouse'),
('333445555', 'Joy Wong', 'Spouse'),
('333445555', 'Theodore Wong', 'Son'),
('987654321', 'Abner Wallace', 'Spouse');

-- Add the foreign key constraint separately
ALTER TABLE DEPENDENT ADD CONSTRAINT FK FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn);
