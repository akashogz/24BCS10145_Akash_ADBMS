# Experiment 3

Name: Akash Gautam
UID: 24BCS10145

## Aim

To perform aggregate functions, GROUP BY, HAVING, and DISTINCT operations, and to write a subquery using NOT IN, in PostgreSQL.

## Question

**Ques 1:** Given a `student` table with `department` and `Marks` columns, find the count of students in each department whose marks are greater than 80.

**Ques 2:** Create an `employees` table with columns `emp_id`, `emp_name`, `emp_salary`, and `emp_city`, insert sample records, and then:
1. Count the number of employees in each city.
2. Count the number of employees in each city and sort the result by count (ascending, then descending with ties broken by city name ascending).
3. Count the number of employees in each city whose salary is greater than or equal to 90000.
4. Using the `HAVING` clause, find the cities that have at least one employee with a salary greater than or equal to 90000.
5. Find the average employee salary for each city.
6. Retrieve the distinct cities, and count the number of distinct cities.

**Ques 3:** Given `Customers` and `Orders` tables, find the names of customers who never placed an order.

## SQL Queries Used

### Ques 1: Count of high scorers per department

```sql
SELECT department,
COUNT(CASE WHEN Marks > 80 THEN 1 ELSE NULL END)
as Dept_HighScore_Count
FROM student
GROUP BY department;
```

### Ques 2: Aggregate functions, GROUP BY, HAVING, DISTINCT

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    emp_salary DECIMAL(10, 2) NOT NULL,
    emp_city VARCHAR(100) NOT NULL
);

INSERT INTO employees (emp_id, emp_name, emp_salary, emp_city) VALUES
(101, 'Amit Sharma', 85000.00, 'Mumbai'),
(102, 'Priya Patel', 95000.00, 'Mumbai'),
(103, 'Rahul Verma', 60000.00, 'Delhi'),
(104, 'Ananya Iyer', 110000.00, 'Bangalore'),
(105, 'Vikram Singh', 55000.00, 'Delhi'),
(106, 'Sneha Reddy', 105000.00, 'Bangalore'),
(107, 'Rohan Das', 72000.00, 'Kolkata');

SELECT * FROM employees;
```

**1. Count the number of employees per city**

```sql
SELECT emp_city, COUNT(*) AS CNT
FROM employees
GROUP BY emp_city;

SELECT emp_city, COUNT(emp_id) AS CNT
FROM employees
GROUP BY emp_city;
```

**2. Count per city, sorted by count**

```sql
-- Ascending
SELECT emp_city, COUNT(emp_id) AS CNT
FROM employees
GROUP BY emp_city
ORDER BY CNT ASC;

-- Descending, ties broken by city name ascending
SELECT emp_city, COUNT(emp_id) AS CNT
FROM employees
GROUP BY emp_city
ORDER BY CNT DESC, emp_city ASC;
```

**3. Count of employees per city with salary >= 90000**

```sql
SELECT emp_city, SUM(CASE WHEN emp_salary >= 90000 THEN 1 ELSE 0 END) AS CNT
FROM employees
GROUP BY emp_city;
```

**4. Cities with at least one employee earning >= 90000 (HAVING clause)**

```sql
SELECT emp_city
FROM employees
GROUP BY emp_city
HAVING SUM(CASE WHEN emp_salary >= 90000 THEN 1 ELSE 0 END) > 0;
```

**5. Average employee salary per city**

```sql
SELECT emp_city, AVG(emp_salary)::NUMERIC(20,2) AS CNT
FROM employees
GROUP BY emp_city;
```

**6. DISTINCT cities**

```sql
SELECT DISTINCT emp_city
FROM employees;

SELECT COUNT(DISTINCT emp_city) AS CNT
FROM employees;
```

### Ques 3: Customers who never placed an order

```sql
-- Write your PostgreSQL query statement below
SELECT name as Customers
FROM Customers
WHERE id NOT IN (
    SELECT customerId FROM Orders
);
```

## Output Screenshots

### Ques 1: Department-wise High Score Count

![Ques 1 Output](Exp%203.1/Ques%201.png)

### Ques 2: Aggregate, GROUP BY, HAVING, DISTINCT

![Ques 2 Output](Exp%203.2/Ques%202.png)

### Ques 3: Customers Without Orders

![Ques 3 Output](Exp%203.3/Ques%203.png)

## Result

The aggregate functions (`COUNT`, `SUM`, `AVG`), `GROUP BY`, `HAVING`, `DISTINCT`, and a `NOT IN` subquery were successfully used to summarize and filter data across the `student`, `employees`, and `Customers`/`Orders` tables, as shown in the output screenshots above.
