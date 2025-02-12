--Q1: Find the name, phone number, department name, designation and net salary of each employee.

SELECT employee.Name, employee.PhoneNumber, DepartmentName, 
designation.DesignationName, salary.NetSalary
FROM employee
JOIN designation ON employee.DesignationID = designation.DesignationID 
JOIN department ON employee.DepartmentID =  department.DepartmentID
JOIN salary ON employee.EmployeeID = salary.EmployeeID

SELECT employee.Name, employee.PhoneNumber, DepartmentName, 
designation.DesignationName, salary.NetSalary
FROM employee, department, designation, salary
WHERE
employee.DesignationID = designation.DesignationID 
AND employee.DepartmentID =  department.DepartmentID
AND employee.EmployeeID = salary.EmployeeID

--Q2: Find the name, designation and basic salary of each employee who are from IT department and receive salary more than 50,000.

SELECT employee.Name, designation.DesignationName, salary.BasicSalary, department.DepartmentName
FROM employee
JOIN designation ON employee.DesignationID = designation.DesignationID 
JOIN department ON employee.DepartmentID =  department.DepartmentID
JOIN salary ON employee.EmployeeID = salary.EmployeeID
WHERE department.DepartmentName = 'IT'
AND salary.BasicSalary > 50000


SELECT employee.Name, designation.DesignationName, salary.BasicSalary
FROM employee, designation, salary, department
WHERE employee.DesignationID = designation.DesignationID 
AND employee.DepartmentID =  department.DepartmentID
AND employee.EmployeeID = salary.EmployeeID
AND department.DepartmentName = 'IT'
AND salary.BasicSalary > 50000


--Q3: Count the number of employees in each department.

SELECT DepartmentName, COUNT(*) FROM employee, department
WHERE employee.DepartmentID = department.DepartmentID
GROUP BY DepartmentName

--Q4: Find the list of employee who received highest salary.
SELECT employee.name, salary.netSalary 
FROM employee, salary
WHERE employee.EmployeeID = salary.EmployeeID
ORDER BY salary.netSalary DESC LIMIT 1

SELECT employee.name, salary.netSalary 
FROM employee, salary
WHERE employee.EmployeeID = salary.EmployeeID
ORDER BY salary.netSalary DESC LIMIT 1 OFFSET 1

--Q5: Show the name and salary of each employee with an increment of 10% on Net salary.
SELECT employee.name, salary.netSalary as oldSalary, salary.netSalary*1.10 as incrementtedSalary 
FROM employee, salary
WHERE employee.EmployeeID = salary.EmployeeID


--Q6: Find the list of employee who took more than 3 leave.
SELECT employee.name, count(leaveapplication.EmployeeID) FROM employee, leaveapplication
WHERE employee.EmployeeID = leaveapplication.EmployeeID
AND leaveapplication.status = 'Approved'
GROUP BY leaveapplication.EmployeeID
HAVING count(leaveapplication.EmployeeID) > 3

--Q7: Display all employees who joined after January 1, 2020.
SELECT * FROM employee
WHERE joiningDate > '2020-01-01'

--Q8: Fetch employees with the designation "Manager".
SELECT * FROM employee, designation
WHERE employee.DesignationID = designation.DesignationID
AND designation.DesignationName LIKE '%Manager%'

--Q9: Calculate the total salary paid to all employees.
SELECT SUM(NetSalary) FROM salary;

--Q10: Find the highest and lowest net salary among all employees.
SELECT MAX(netsalary), MIN(NetSalary) FROM salary 

--Q11: Display the average salary for each department.
SELECT AVG(salary.NetSalary) FROM employee, salary, department
WHERE 
AND employee.DepartmentID =  department.DepartmentID
AND employee.EmployeeID = salary.EmployeeID
GROUP BY department.DepartmentName

--Q12: Find the department with the maximum number of employees.
 SELECT department.DepartmentName, COUNT(employee.DepartmentID) AS totalEmployee FROM employee, department
 WHERE department.DepartmentID = employee.DepartmentID
 GROUP BY department.DepartmentName

