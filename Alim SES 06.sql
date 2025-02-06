
Industry class_5


DElimiter $$
CREATE PROCEDURE getDeptName(IN dept_id int, OUT dept_name VARCHAR(100))
BEGIN
SELECT title FROM departments WHERE id = dept_id;
end $$
DElimiter ;


call getDeptName(1, @name)

SELECT @name;

call addLog(1, @name)

SELECT COUNT(title) FROM departments WHERE id = dept_id;

IF ... THEN
....
ELSE
......
END IF;


BEGIN 
START TRANSACTION;
INSERT INTO ...;
 INSERT INTO ...;
INSERT INTO ...;
COMMIT
END$$


BEGIN 
START TRANSACTION;
INSERT INTO ...;
 INSERT INTO ...;
INSERT INTO ...;
ROLLBACK; 

END$$