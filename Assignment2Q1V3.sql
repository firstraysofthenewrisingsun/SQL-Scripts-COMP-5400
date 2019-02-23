SELECT AVG(CASE WHEN b.gender = 'M' THEN p.salary END) AS MaleAverageSalary, 
AVG(CASE WHEN b.gender = 'F' THEN p.salary END) AS FemaleAverageSalary,
MIN(CASE WHEN b.gender = 'M' THEN p.salary END) AS MaleMinimumSalary,
MIN(CASE WHEN b.gender = 'F' THEN p.salary END) AS FemaleMinimumSalary,
MAX(CASE WHEN b.gender = 'M' THEN p.salary END) AS MaleMaximumSalary,
MAX(CASE WHEN b.gender = 'F' THEN p.salary END) AS FemaleMaximumSalary,
COUNT(CASE WHEN b.gender = 'M' THEN 1 END) AS NumOfMales,
COUNT(CASE WHEN b.gender = 'F' THEN 1 END) AS NumOfFemales
FROM employees b LEFT JOIN salaries p
ON b.emp_no = p.emp_no;


