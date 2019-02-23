SELECT COUNT(emp_no) AS numOfEmployeesInD007
FROM dept_emp
WHERE (from_date <= '1985-01-01' AND to_date >= '1991-03-07') OR 
(from_date BETWEEN '1985-01-01' AND '1991-03-07') OR 
(to_date BETWEEN '1985-01-01' AND '1991-03-07') AND dept_no ='d007'