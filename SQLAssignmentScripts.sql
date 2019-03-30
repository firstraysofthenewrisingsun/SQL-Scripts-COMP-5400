-- PART 1

-- P1.1
/*Select all columns
and all rows
in the Titles table:*/
SELECT * 
	FROM titles

-- P1.2
/*Select columns emp_no and salary
with all corresponding rows
in the Salaries table:*/
SELECT emp_no, salary
	FROM salaries
    
-- P1.3
/*Select columns emp_no and salary
from records with salaries greater than $50,000 a year
in the Salaries table:*/
SELECT emp_no, salary
	FROM salaries
    WHERE salary > 50000
    
 -- P1.4
 /*Select columns emp_no, last and first name and hire date
for all female employees who were hired before January 1st 1990 from the Employees table:*/
SELECT emp_no, first_name, last_name, hire_date 
FROM employees
WHERE (gender = 'F' AND hire_date > '1990-01-01') OR gender = 'F'

-- P1.5
/*Select and rename columns emp_no and 
salary and retrieve all records*/
SELECT emp_no as Employee_ID, salary as Yearly_Wage
FROM salaries

-- P1.6
/*Select and concatenate the title and emp_no columns,
 rename them as engineers due for promotion*/
SELECT concat(title, emp_no) as Engineers_Due_For_Promotion
FROM titles
WHERE from_date >= '1989-01-01' and title = 'Engineer'

-- P1.7
/*Select all records under the emp_no and hire_date columns and annotate records to transfer or delay transfer. */
SELECT emp_no, hire_date,
CASE WHEN hire_date < '1990-05-06' then 'Transfer'
WHEN hire_date > '1980-05-06' then 'Delay Transfer'
ELSE 'Review file'
END as Transfer_Determination
From employees

-- P1.8
/*Select all colum s for 10 row. */

SELECT *
FROM employees
LIMIT 10

-- P1.9
/*Select first name, gender and hire date columns for 20 random rows.*/

SELECT first_name, gender, hire_date
FROM employees
ORDER BY rand() limit 20

-- P1.10
/*Select all columns for all rows with null project numbers.*/

SELECT *
FROM clients
WHERE proNo IS NULL

-- P1.11
/*Select all columns for all rows and transform null values to 0.*/

SELECT *, COALESCE(proNo, 0) AS PRO_NO
FROM clients

-- P1.12
/*Select emp_no, from_date and salary columns for all rows with salaries matching 500,000 or 700,000.*/

SELECT emp_no, from_date, salary
FROM salaries
WHERE salary IN (500000, 700000)

-- P1.13
/*Select first_name, last_name and gender columns for all records with an 'sh' anywhere in the first name.*/

SELECT first_name, last_name, gender
FROM employees
WHERE first_name LIKE '%Sh%'

-- PART 2

-- P2.1
/*Select birth_date, gender and hire_date columns for all 
records with hire dates between "1980-01-01" AND "1995-12-12". List in descending order.*/

SELECT birth_date, gender, hire_date
	FROM employees
    WHERE hire_date BETWEEN "1980-01-01" AND "1995-12-12"
    ORDER BY hire_date asc
    
-- P2.2
/*Select the emp_no, dept_no and from_date columns for all 
records in the dept_emp table with the results grouped by from_date.*/

SELECT emp_no, dept_no, from_date AS StartDate
	FROM dept_emp
    ORDER BY from_date
    
-- P2.3
/*Select emp_no and birth_date from the employee table 
and dept_no from the dept_emp table and order results 
but the last four letter of the last name.*/

SELECT emp.emp_no as EmployeeNumber, dpe.dept_no as DepartmentNumbers, emp.birth_date as EmployeeBirthdays
	FROM employees as emp, dept_emp as dpe
    WHERE emp.emp_no = dpe.emp_no
    ORDER BY SUBSTR(emp.last_name, length(emp.last_name) - 2)
    
-- P2.5
/*Select attributes and rows based on the results of an inner join between the salaries and employee tables*/

SELECT s.emp_no, s.salary, e.gender, e.first_name, s.HighSalaries,
	CASE WHEN e.gender = 'M' then s.HighSalaries
    else s.salary end as ordered
FROM salaries as s
INNER JOIN employees as e
ON s.emp_no = e.emp_no
ORDER BY s.salary DESC

-- P2.6
/*Selects the age at time of hire, name and emp_no of and female employees */

SELECT concat(e.first_name, e.last_name), DATEDIFF(d.from_date, e.birth_date)/365 as AgeAtTimeOfManagerialPosition, e.emp_no 
FROM  employees as e
INNER JOIN dept_manager as d
ON e.emp_no = e.emp_no
WHERE e.gender = 'F'

-- P2.7
/*Selects the length of time each manager held their position*/
SELECT DISTINCT e.emp_no, e.first_name, e.last_name, DATEDIFF(e.hire_date, dp.from_date) AS LengthOfTimeAsManager
FROM employees as e, dept_manager as dp
WHERE (DATEDIFF(dp.from_date, e.hire_date))>0

-- PART 3

-- P3.1
/*Stack the employees table on top on the titles table.*/

SELECT concat(first_name, last_name) as NamesAndTitles
	FROM employees
		WHERE emp_no > 3000
UNION
	SELECT title
		FROM titles
        
-- P3.2
/*Select dept_no from departments table and emp_no and from_date from 
dept_emp table for all records with matching dept_no in both tables.*/

SELECT dp.dept_no, dpe.emp_no, dpe.from_date
FROM departments as dp, dept_emp as dpe
WHERE dp.dept_no = dpe.dept_no  

-- P3.3
/*Select all columns for each record with emp_no not in inner query results.*/

SELECT *
FROM employees
WHERE emp_no NOT IN (SELECT emp_no FROM dept_manager)

-- P3.4
/*Count the number of departments in the Departments table*/

SELECT DISTINCT count(dept_name) as TotalNumOfDepartments
FROM departments

-- PART 4

-- P4.1
/*Insert new value into Departments table.*/

INSERT INTO departments (dept_no, dept_name)
	VALUES ('d011', 'SF R&D')

SELECT *
FROM departments  

-- P4.2
/*Create new SF R&D table, insert record with default values then view all added records.*/
CREATE TABLE IF NOT EXISTS SF_Research_Development(
projectNo INT NOT NULL DEFAULT 0,
FName VARCHAR(20) DEFAULT 'John',
LName VARCHAR(20) DEFAULT 'Doe',
proNo VARCHAR(20) DEFAULT NULL, #can take null values
ViewDate DATE DEFAULT NULL,
PRIMARY KEY (projectNo),
FOREIGN KEY (proNo) REFERENCES departments (dept_no)
ON DELETE SET NULL);

INSERT INTO sf_research_development VALUES ()

SELECT *
FROM sf_research_development    

-- P4.3
/*New record is inserted into the SF R&D table and overrride the default values.*/

INSERT INTO sf_research_development VALUES (74646, null, null, null, null)

SELECT *
FROM sf_research_development

-- P4.4
/*Inserts values from the SF R&D table to the Outside R&D table*/
CREATE TABLE IF NOT EXISTS Outside_Research_Development(
projectNo INT NOT NULL DEFAULT 0,
StartDate DATE DEFAULT NULL);

INSERT INTO Outside_Research_Development (projectNo, StartDate) SELECT projectNo, ViewDate
FROM sf_research_development

SELECT * 
FROM Outside_Research_development  

-- P4.5
/*Copy attributes from titles table to Engineers table*/
CREATE TABLE Engineers
AS
SELECT *
	FROM titles
    WHERE 1 = 0
    
SELECT *
FROM Engineers 

-- P4.6
/*Updates record matching the emp_no 1001 with the new title of 'Head Honcho'*/
UPDATE titles
	SET title = 'Head Honcho'
WHERE emp_no = 10001    

SELECT *
FROM titles

-- P4.7
/*All salaries were multiplied by 10 for all regular department employees*/
UPDATE salaries
	SET salary = salary * 10
WHERE emp_no IN (SELECT emp_no FROM dept_emp)  
 
SELECT *
FROM salaries 

-- P4.8
/*Deletes all records based of the results of the inner query on the employees table.*/
DELETE FROM dept_manager 
WHERE emp_no IN (SELECT emp_no FROM employees)

SELECT *
FROM employees

SELECT *
FROM dept_manager

-- P4.9
/*Deletes all records of non managerial staff*/
DELETE FROM salaries
WHERE emp_no NOT IN (SELECT emp_no FROM dept_manager)

SELECT *
FROM salaries

-- P4.10
/*Removes duplicate rows from the query results*/
SELECT min(emp_no), title 
FROM titles
GROUP BY title

-- P4.11
/*Removes all records from the employee table based on the results of an inner query on the titles table*/
DELETE FROM employees
WHERE emp_no IN (SELECT emp_no FROM titles WHERE title Like '%Senior%' GROUP BY emp_no )

    