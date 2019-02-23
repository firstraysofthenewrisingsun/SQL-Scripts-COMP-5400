SELECT SUM(CASE WHEN gender = 'M' THEN 1 END) AS NumOfMales, SUM(CASE WHEN gender = 'F' THEN 1 END) AS NumOfFemales
FROM employees

