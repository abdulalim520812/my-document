
create DATABASE INDUSTRY_CLASS;

create table students(
id int primary key auto_increment,
name VARCHAR(100) not null,
contact VARCHAR(100),
mail VARCHAR(100),
dept_id int,
foreign key (dept_id) REFERENCES departments(id)
);

ALTER TABLE students1 RENAME TO students;
SELECT students.name, departments.title from students,departments;
SELECT students.name, departments.title from students join departments on students.dept_id = departments.id;
CREATE VIEW stu_dept AS SELECT students.name, departments.title from students join departments on students.dept_id = departments.id;
SELECT students.name, departments.title from students join departments on students.dept_id = departments.id;
CREATE VIEW std_dept AS SELECT students.name as student_name, departments.title as department_name from students join departments on students.dept_id = departments.id;
CREATE VIEW stud_dept AS SELECT students.name as student_name, departments.title as department_name from students left join departments on students.dept_id = departments.id;
CREATE VIEW stud_dept AS SELECT students.name as student_name, departments.title as department_name from students right join departments on students.dept_id = departments.id;

SELECT students.name as student_name, departments.title as department_name from students left join departments on students.dept_id = departments.id 
union 
SELECT students.name as student_name, departments.title as department_name from students right join departments on students.dept_id = departments.id;

CREATE VIEW stud_union_dept AS SELECT students.name as student_name, departments.title as department_name from students left join departments on students.dept_id = departments.id 
union 
SELECT students.name as student_name, departments.title as department_name from students right join departments on students.dept_id = departments.id;LTER TABLE students1 RENAME TO students;
SELECT students.name, departments.title from students,departments;
SELECT students.name, departments.title from students join departments on students.dept_id = departments.id;
CREATE VIEW stu_dept AS SELECT students.name, departments.title from students join departments on students.dept_id = departments.id;
SELECT students.name, departments.title from students join departments on students.dept_id = departments.id;
CREATE VIEW std_dept AS SELECT students.name as student_name, departments.title as department_name from students join departments on students.dept_id = departments.id;
CREATE VIEW stud_dept AS SELECT students.name as student_name, departments.title as department_name from students left join departments on students.dept_id = departments.id;
CREATE VIEW stud_dept AS SELECT students.name as student_name, departments.title as department_name from students right join departments on students.dept_id = departments.id;

SELECT students.name as student_name, departments.title as department_name from students left join departments on students.dept_id = departments.id 
union 
SELECT students.name as student_name, departments.title as department_name from students right join departments on students.dept_id = departments.id;

CREATE VIEW stud_union_dept AS 
SELECT students.name as student_name, departments.title as department_name from students left join departments on students.dept_id = departments.id 
union 
SELECT students.name as student_name, departments.title as department_name from students right join departments on students.dept_id = departments.id;s.name as student_name, departments.title as department_name from students right join departments on students.dept_id = departments.id;LTER TABLE students1 RENAME TO students;
SELECT students.name, departments.title from students,departments;
SELECT students.name, departments.title from students join departments on students.dept_id = departments.id;
CREATE VIEW stu_dept AS SELECT students.name, departments.title from students join departments on students.dept_id = departments.id;
SELECT students.name, departments.title from students join departments on students.dept_id = departments.id;
CREATE VIEW std_dept AS SELECT students.name as student_name, departments.title as department_name from students join departments on students.dept_id = departments.id;
CREATE VIEW stud_dept AS SELECT students.name as student_name, departments.title as department_name from students left join departments on students.dept_id = departments.id;
CREATE VIEW stud_dept AS SELECT students.name as student_name, departments.title as department_name from students right join departments on students.dept_id = departments.id;

SELECT students.name as student_name, departments.title as department_name from students left join departments on students.dept_id = departments.id 
union 
SELECT students.name as student_name, departments.title as department_name from students right join departments on students.dept_id = departments.id;

CREATE VIEW stud_union_dept AS SELECT students.name as student_name, departments.title as department_name from students left join departments on students.dept_id = departments.id 
union 
SELECT students.name as student_name, departments.title as department_name from students right join departments on students.dept_id = departments.id;