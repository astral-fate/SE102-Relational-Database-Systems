# Content outline

1. Complex Query Features:
  - Nested queries (subqueries) in WHERE, FROM, and SELECT clauses
  - JOIN operations including INNER JOIN, LEFT/RIGHT/FULL OUTER JOIN
  - Correlation between outer and inner queries
  - Aggregate functions (COUNT, SUM, MIN, MAX, AVG)
  - GROUP BY and HAVING clauses
  - Three-valued logic with NULL values
  - Set operations (EXCEPT, UNION)
  - WITH clause for temporary tables
  - CASE statements for conditional logic

2. Comparison Operators:
  - EXISTS and NOT EXISTS
  - IN and NOT IN
  - ANY/SOME and ALL
  - Comparison with NULL using IS NULL and IS NOT NULL

3. Table and View Operations:
  - CREATE VIEW
  - DROP VIEW
  - View updatability rules
  - Inline views in FROM clause
  - View materialization concepts

4. Schema Modification:
  - ALTER TABLE
      - ADD COLUMN
      - DROP COLUMN
      - ALTER COLUMN
      - ADD CONSTRAINT
      - DROP CONSTRAINT
  - DROP TABLE
  - DROP SCHEMA
  - CASCADE vs RESTRICT options

5. Constraint and Trigger Features:
  - CREATE ASSERTION for general constraints
  - CREATE TRIGGER for event-condition-action rules
  - Trigger components:
    - Event specification
    - Condition checking
    - Action execution
    - BEFORE vs AFTER triggers
    - FOR EACH ROW triggers

6. Query Organization:
  - SELECT clause
  - FROM clause
  - WHERE clause
  - GROUP BY clause
  - HAVING clause
  - ORDER BY clause

7. Table Joining Methods:
  - NATURAL JOIN
  - INNER JOIN
  - LEFT/RIGHT/FULL OUTER JOIN
  - CROSS JOIN
  - Multiple table joins
  - Join conditions in ON clause


# Alter table

## Example

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
