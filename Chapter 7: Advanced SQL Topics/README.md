

<details>
<summary><h2>1. Complex Query Features 🔍</h2></summary>

#### Nested Queries
- Subqueries in WHERE clause
- Subqueries in FROM clause 
- Subqueries in SELECT clause

#### Joins and Set Operations
- JOIN types and syntax
- UNION, EXCEPT operations
- Correlation concepts

#### Aggregation and Grouping
- Aggregate functions
- GROUP BY clause
- HAVING clause
- NULL handling
</details>

<details>
<summary><h2>2. Comparison Operators 🔄</h2></summary>

- 2.1 EXISTS/NOT EXISTS
- 2.2 IN/NOT IN 
- 2.3 ANY/SOME/ALL
- 2.4 NULL comparisons
</details>

<details>
<summary><h2>3. Views 👁️</h2></summary>

- View creation and deletion
- Updatability rules
- Materialization concepts
- Inline views
</details>

<details>
<summary><h2>4. Schema Modification 🛠️</h2></summary>

#### ALTER TABLE Operations
- Column modifications
- Constraint handling
- Table/Schema deletion
- CASCADE vs RESTRICT

#### Database Structure
- Table creation/deletion
- Schema management
</details>

<details>
<summary><h2>5. Constraints & Triggers ⚡</h2></summary>

#### Assertions
- General constraints
- Implementation rules

#### Triggers
- Event-Condition-Action rules
- Timing options
- Row-level triggers
</details>

<details>
<summary><h2>6. Query Structure 📝</h2></summary>

- SELECT clause
- FROM clause
- WHERE clause
- GROUP BY/HAVING
- ORDER BY
</details>

<details>
<summary><h2>7. Join Methods 🔗</h2></summary>

- NATURAL JOIN
- INNER JOIN
- OUTER JOINs
- CROSS JOIN
- Multiple table joins
</details>


# Alter table

## Example

<details>
<summary><strong style="color: red; background-color: yellow">Alter Table Example</strong></summary>

```sql
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
```
</details>



# 2.3 Comparison Operators:
<details>
<summary><h2>2. Comparison Operators (ANY/SOME and ALL) 🔄</h2></summary>

### Syntax & Operators
```sql
value comparison_operator ANY (subquery)
value comparison_operator ALL (subquery) 
value comparison_operator SOME (subquery) /* SOME is equivalent to ANY */
```
Operators: `=, >, >=, <, <=, <>`

### Usage
- **ANY/SOME:** True if comparison is true for at least one value
- **ALL:** True if comparison is true for all values
- **Note:** ANY and SOME are functionally identical

### Examples

<details>
<summary><strong>Example 1: Employee Salary Comparison</strong></summary>

```sql
SELECT Lname, Fname
FROM EMPLOYEE
WHERE Salary > ALL (SELECT Salary 
                   FROM EMPLOYEE 
                   WHERE Dno = 5);
```
This query finds employees whose salary is higher than all salaries in department 5.
</details>

<details>
<summary><strong>Example 2: Customer Orders Analysis</strong></summary>

```sql
SELECT DISTINCT CUSTOMER_ID 
FROM SALESMAN S, ORDERS O 
WHERE S.SALESMAN_ID=O.SALESMAN_ID 
AND O.SALESMAN_ID > ALL(5003,5006);
```

#### Result Analysis
- Returns customers whose orders were handled by salesmen with ID > both 5003 and 5006
- Result: CUSTOMER_IDs 3008 and 3005 (handled by SALESMAN_ID 5002)
- Only includes orders with SALESMAN_ID 5002
</details>

<details>
<summary><strong>Example 3: Lowest Commission Query</strong></summary>

```sql
SELECT NAME FROM SALESMAN 
WHERE COMMISSION <= ALL (SELECT COMMISSION FROM SALESMAN);
```

#### Analysis
- Finds salesmen with lowest commission by comparing against ALL other commissions
- Sample data commissions: 0.15, 0.13, 0.11, 0.14, 0.13
- Result: Pit Alex (commission 0.11)

#### Alternative Approach
```sql
SELECT NAME FROM SALESMAN 
WHERE COMMISSION = (SELECT MIN(COMMISSION) FROM SALESMAN);
```
This alternative version using MIN is more straightforward but produces the same result.
</details>

### Best Practices
- Use for comparing single values against result sets
- Consider performance with large datasets
- Handle NULL values appropriately
- Choose between ANY/ALL based on logical needs

</details>
