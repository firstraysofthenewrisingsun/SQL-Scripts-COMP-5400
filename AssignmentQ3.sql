SELECT DISTINCT e.emp_no, COUNT(DISTINCT e.emp_no) AS DistinctNum, AVG(s.salary) AS AverSal
FROM employees e LEFT JOIN salaries s
ON e.emp_no = s.emp_no
GROUP BY e.emp_no

