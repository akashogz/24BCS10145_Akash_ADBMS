```sql
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department VARCHAR(50)
);

INSERT INTO employee (employee_id, employee_name, salary, department)
VALUES
    (1, 'Aman', 90000, 'IT'),
    (2, 'Rahul', 80000, 'HR'),
    (3, 'Priya', 70000, 'IT'),
    (4, 'Simran', 70000, 'Finance'),
    (5, 'Karan', 60000, 'HR'),
    (6, 'Neha', 50000, 'Finance');

SELECT DISTINCT salary
FROM employee
ORDER BY salary DESC
LIMIT 2 OFFSET 1;
```
