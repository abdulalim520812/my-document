
DELIMITER $$

create procedure getValues()

BEGIN 

SELECT * FROM department;
end $$

DELIMITER ;


DELIMITER $$
create procedure addDepartmentInfo(IN dept_name VARCHAR(100),dept_contact VARCHAR(50))
BEGIN 
INSERT INTO department(name, contact)
VALUES (dept_name,dept_contact);
end $$
DELIMITER ;


CALL addDepartmentInfo('Mathematics', '456787654');


DELIMITER $$
create procedure getDeptInfo(IN dept_id int , OUT dept_name VARCHAR(100))
BEGIN 

SELECT name FROM department WHERE (id= dept_id);

end $$
DELIMITER ;


CALL getDeptInfo(3, @dept_name);