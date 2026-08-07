# Experiment 4

Name: Akash Gautam
UID: 24BCS10145

## Aim

To study and implement various types of SQL joins — INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN, and SELF JOIN — to combine and query data from multiple related tables in PostgreSQL.

## Question

**Ques 1:** Given `customers`, `orders`, and `products` tables, write queries to:
1. Retrieve the customer name and order date for all matching customers and orders (INNER JOIN).
2. Retrieve the customer name and product name for all customers, including those with no orders (LEFT JOIN).
3. Retrieve the product name and order date for all matching products and orders (INNER JOIN).

**Ques 2:** Given `student` and `course` tables, write queries to:
1. Retrieve all columns for students matched with their course (JOIN).
2. Retrieve all columns for all students, including those without a matching course (LEFT JOIN).

**Ques 3:** Given `customers`, `orders`, `products`, and `categories` tables, write queries to:
1. Retrieve the customer name and all order details for all orders, including those without a matching customer (RIGHT JOIN).
2. Retrieve the product name and category name for all products and categories, including unmatched rows on either side (FULL OUTER JOIN).
3. Retrieve the category name, product name, and price for all categories, including those without a matching product (RIGHT JOIN).

**Ques 4:** Given `student` and `course` tables, retrieve all columns for all students and all courses, including unmatched rows on either side, using a FULL OUTER JOIN.

**Ques 5:** Given an `employees` table (with a self-referencing `manager_id`) and `customers` and `products` tables:
1. Find each employee along with the name of their manager (SELF JOIN using LEFT JOIN).
2. Retrieve every possible combination of customer and product (CROSS JOIN).

**Ques 6:** Given a `student` table that stores each student's `Course_id` (favorite course):
1. Find pairs of students that belong to the same department (SELF JOIN).
2. Identify students who have chosen the same `Course_id` as another student, displaying `St_id`, `St_Name`, and `Course_id`, ordered by increasing `Course_id` (SELF JOIN with `DISTINCT`).

## SQL Queries Used

### Ques 1: INNER JOIN and LEFT JOIN on customers, orders, and products

```sql
SELECT c.customer_name, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.product_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT p.product_name, o.order_date
FROM products p
INNER JOIN orders o ON p.product_name = o.product_name;
```

### Ques 2: JOIN and LEFT JOIN on student and course

```sql
SELECT *
FROM student
JOIN course
ON student.Course_id = course.Course_id;

SELECT *
FROM student
LEFT JOIN course
ON student.Course_id = course.Course_id;
```

### Ques 3: RIGHT JOIN and FULL OUTER JOIN on customers, orders, products, and categories

```sql
SELECT c.customer_name, o.*
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

SELECT p.product_name, c.category_name
FROM products p
FULL OUTER JOIN categories c ON p.category_id = c.category_id;

SELECT c.category_name, p.product_name, p.price
FROM products p
RIGHT JOIN categories c ON p.category_id = c.category_id;
```

### Ques 4: FULL OUTER JOIN on student and course

```sql
SELECT *
FROM student
FULL OUTER JOIN course
ON student.Course_id = course.Course_id;
```

### Ques 5: SELF JOIN (employees-managers) and CROSS JOIN

```sql
SELECT e1.employee_name AS Employee, e2.employee_name AS Manager
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;

SELECT c.customer_name, p.product_name
FROM customers c
CROSS JOIN products p;
```

### Ques 6: SELF JOIN on student table

```sql
-- We have a student table that also stores the Course_id of a student's favorite course. Our task has two parts related to using a SELF JOIN:

--     Find pairs of students that belong to the same department.
--     Identify students who have chosen the same Course_id as their favorite. Display the St_id, St_Name, and Course_id and order it in increasing Course_id.

-- 1. Pairs of students in the same department
SELECT 
    s1.St_id,
    s1.St_Name,
    s1.Department,
    s2.St_id,
    s2.St_Name,
    s2.Department
FROM student AS s1
INNER JOIN student AS s2
ON s1.Department = s2.Department
AND s1.St_id != s2.St_id;

-- 2. Students sharing the same favorite Course_id
SELECT DISTINCT
    s1.St_id,
    s1.St_Name,
    s1.Course_id
FROM student AS s1
INNER JOIN student AS s2
ON s1.Course_id = s2.Course_id
AND s1.St_id != s2.St_id
ORDER BY s1.Course_id;
```

## Output Screenshots

### Ques 1: INNER JOIN / LEFT JOIN — Customers, Orders, Products

![Ques 1 Output](Exp%204.1/Ques.png)

### Ques 2: JOIN / LEFT JOIN — Student, Course

![Ques 2 Output](Exp%204.2/Ques.png)

### Ques 3: RIGHT JOIN / FULL OUTER JOIN — Customers, Orders, Products, Categories

![Ques 3 Output](Exp%204.3/Ques.png)

### Ques 4: FULL OUTER JOIN — Student, Course

![Ques 4 Output](Exp%204.4/Ques.png)

### Ques 5: SELF JOIN / CROSS JOIN — Employees, Customers, Products

![Ques 5 Output](Exp%204.5/Ques.png)

### Ques 6: SELF JOIN — Student

![Ques 6 Output](Exp%204.6/Ques.png)

## Result

The various types of SQL joins — `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN`, and `SELF JOIN` — were successfully implemented to combine and query related data across the `customers`, `orders`, `products`, `categories`, `student`, `course`, and `employees` tables, as shown in the output screenshots above.
