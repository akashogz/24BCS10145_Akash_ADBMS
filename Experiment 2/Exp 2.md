# Experiment 2

Name: Akash Gautam
UID: 24BCS10145

## Aim

To perform and understand SQL set operations (UNION, INTERSECT, and EXCEPT) on database tables.

## Question

Write SQL queries to demonstrate the use of set operations for combining and comparing the result sets of two tables:

Ques 1: Use the `UNION` operator to combine all records from the `Arts` and `Science` tables into a single result set.

Ques 3: Use the `INTERSECT` operator to find the common values between the `f_name` column of the `fruit` table and the `inv_name` column of the `inventory` table.

Ques 4: Use the `EXCEPT` operator to find the values present in the `f_name` column of the `fruit` table but not present in the `inv_name` column of the `inventory` table.

## SQL Queries Used

### Ques 1: UNION of Arts and Science

```sql
SELECT * FROM Arts
UNION
SELECT * FROM Science;
```

### Ques 3: INTERSECT of fruit and inventory

```sql
SELECT f_name FROM fruit
INTERSECT
SELECT inv_name FROM inventory;
```

### Ques 4: EXCEPT of fruit and inventory

```sql
SELECT f_name FROM fruit
EXCEPT
SELECT inv_name FROM inventory;
```

## Output Screenshots

### Ques 1: UNION Output

![Ques 1 Output](Ques%201.png)

### Ques 3: INTERSECT Output

![Ques 3 Output](Ques%203.png)

### Ques 4: EXCEPT Output

![Ques 4 Output](Ques%204.png)

## Result

The UNION, INTERSECT, and EXCEPT set operations were successfully executed, combining and comparing records from the respective tables as shown in the output screenshots above.