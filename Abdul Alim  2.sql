-----------------------
---Lecture 21----
-------------------------
--write query for the following problems

--Q1: Find the name, phone number, department name, designation and net salary of each employee.

sELECT employee.Name as E_Name, employee.PhoneNumber as E_PhoneNumber, department.DepartmentName, 
designation.DesignationName, salary.NetSalary
FROM employee
JOIN designation ON employee.DesignationID = designation.DesignationID 
JOIN department ON employee.DepartmentID =  department.DepartmentID
JOIN salary ON employee.EmployeeID = salary.EmployeeID;

--Q2: Find the name, designation and basic salary of each employee who are from IT department and receive salary more than 50,000.

SELECT employee.Name, designation.DesignationName, salary.BasicSalary, department.DepartmentName
FROM employee
JOIN designation ON employee.DesignationID = designation.DesignationID 
JOIN department ON employee.DepartmentID =  department.DepartmentID
JOIN salary ON employee.EmployeeID = salary.EmployeeID
WHERE department.DepartmentName = 'IT'
AND salary.BasicSalary > 50000;


--Q3: Count the number of employees in each department.

SELECT DepartmentName, COUNT(*) FROM employee, department
WHERE employee.DepartmentID = department.DepartmentID
GROUP BY DepartmentName;


--Q4: Find the list of employee who received highest salary.

SELECT employee.name, salary.netSalary 
FROM employee, salary
WHERE employee.EmployeeID = salary.EmployeeID
ORDER BY salary.netSalary DESC LIMIT 1;


--Q5: Show the name and salary of each employee with an increment of 10% on Net salary.

sELECT employee.name, salary.netSalary as old_Salary, salary.netSalary*1.10 as New_Salary 
FROM employee, salary
WHERE employee.EmployeeID = salary.EmployeeID;

--Q6: Find the list of employee who took more than 3 leave.


SELECT employee.name, count(leaveapplication.EmployeeID) FROM employee
join leaveapplication
on employee.EmployeeID = leaveapplication.EmployeeID
WHERE leaveapplication.status = 'Approved'
GROUP BY leaveapplication.EmployeeID
HAVING count(leaveapplication.EmployeeID) > 3;

SELECT employee.name, count(leaveapplication.EmployeeID) FROM employee
join leaveapplication
on employee.EmployeeID = leaveapplication.EmployeeID
GROUP BY leaveapplication.EmployeeID
HAVING count(leaveapplication.EmployeeID) > 3;

--Q6.2 Find the number of days leave taken by employee. 
select sum (abs ( datediff(LeaveEndDate,LeaveStartDate)))
from leaveapplication.EmployeeID;

--Q7: Display all employees who joined after January 1, 2020.

SELECT * FROM employee
WHERE joiningDate > '2020-01-01';

--Q8: Fetch employees with the designation "Manager".

SELECT * FROM employee, designation
WHERE employee.DesignationID = designation.DesignationID
AND designation.DesignationName LIKE '%Manager%';

--Q9: Calculate the total salary paid to all employees.

SELECT SUM(NetSalary) FROM salary;

--Q10: Find the highest and lowest net salary among all employees.

SELECT MAX(netsalary), MIN(NetSalary) FROM salary;

--Q11: Display the average salary for each department.

SELECT AVG(salary.NetSalary) FROM employee, salary, department
WHERE 
AND employee.DepartmentID =  department.DepartmentID
AND employee.EmployeeID = salary.EmployeeID
GROUP BY department.DepartmentName;

--Q12: Find the department with the maximum number of employees.

SELECT department.DepartmentName, COUNT(employee.DepartmentID) AS totalEmployee FROM employee, department
 WHERE department.DepartmentID = employee.DepartmentID
 GROUP BY department.DepartmentName;