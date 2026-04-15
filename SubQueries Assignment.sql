Basic Level

-- Q1:SELECT name, salary
FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- Q2:SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

-- Q3:SELECT DISTINCT e.name
FROM Employee e
WHERE e.emp_id IN (SELECT emp_id FROM Sales);

-- Q4:SELECT e.name
FROM Employee e
JOIN Sales s ON e.emp_id = s.emp_id
WHERE s.sale_amount = (SELECT MAX(sale_amount) FROM Sales);

-- Q5:SELECT name
FROM Employee
WHERE salary > (SELECT salary FROM Employee WHERE name = 'Shubham');


Intermediate Level 

-- Q1:SELECT name
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'Akshat'
);

-- Q2:SELECT DISTINCT department_id
FROM Employee
WHERE salary > 60000;

-- Q3:SELECT department_id
FROM Employee e
WHERE NOT EXISTS (
    SELECT *
    FROM Employee e2
    WHERE e2.department_id = e.department_id
    AND e2.emp_id NOT IN (SELECT emp_id FROM Sales)
);

-- Q4:SELECT DISTINCT e.name
FROM Employee e
JOIN Sales s ON e.emp_id = s.emp_id
WHERE s.sale_amount > (SELECT AVG(sale_amount) FROM Sales);

-- Q5:SELECT SUM(s.sale_amount) AS total_sales
FROM Sales s
JOIN Employee e ON s.emp_id = e.emp_id
WHERE e.salary > (SELECT AVG(salary) FROM Employee);


Advanced Level

-- Q1:SELECT d.department_id
FROM Department d
WHERE d.department_id NOT IN (
    SELECT DISTINCT e.department_id
    FROM Employee e
    JOIN Sales s ON e.emp_id = s.emp_id
);

-- Q2:SELECT department_id
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- Q3:SELECT e.department_id
FROM Employee e
JOIN Sales s ON e.emp_id = s.emp_id
GROUP BY e.department_id
HAVING SUM(s.sale_amount) > 10000;

-- Q4:SELECT name, salary
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE salary < (SELECT MAX(salary) FROM Employee)
);

-- Q5:SELECT name
FROM Employee
WHERE salary > (SELECT MAX(sale_amount) FROM Sales);