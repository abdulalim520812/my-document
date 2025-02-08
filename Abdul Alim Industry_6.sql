
Industry_6
------------------------------------------------------------

create database e_com_2;
create database db_e_com;

CREATE TABLE users(
    id int PRIMARY KEY auto_increment,
    name varchar(100) NOT null,
    contact varchar(100) NOT null UNIQUE,
    mail varchar(100),
    role int NOT null DEFAULT 1,
    status boolean DEFAULT true
);



DELIMITER $$
CREATE PROCEDURE addNewUser(IN u_name varchar(100), IN u_contact varchar(100))
BEGIN
INSERT INTO users(name, contact) VALUES(u_name, u_contact);
END $$
DELIMITER ;

CREATE TABLE logs(
    id int PRIMARY KEY auto_increment,
    message varchar(255) NOT null
);





DELIMITER $$

CREATE TRIGGER LogNewUser AFTER
INSERT ON users
FOR EACH ROW

BEGIN
   INSERT INTO logs(message) VALUES(CONCAT('New user added successfully:', NEW.name));
END $$

DELIMITER ;



CALL addNewUser('Alim','01837763581')
CALL addNewUser('Fahim','01837763582')


CREATE TABLE shops(
id int PRIMARY KEY auto_increment,
    name varchar(100) NOT null,
    contact varchar(100)
);


CREATE TABLE categories(
    id int PRIMARY KEY auto_increment,
     name varchar(100) NOT null UNIQUE
    );
	
	
CREATE TABLE shops(
	id int PRIMARY KEY auto_increment,
    name varchar(100) NOT null,
    contact varchar(100),
    user_id int,
    FOREIGN KEY (user_id) REFERENCES users(id)
);



DELIMITER $$
CREATE PROCEDURE addNeweShop(IN s_name varchar(100), IN s_user_id int )
BEGIN
INSERT INTO shops(name, user_id) VALUES(s_name, s_user_id);
END $$
DELIMITER ;





DELIMITER $$
CREATE PROCEDURE addNeweCategory(IN c_name varchar(100), OUT msg varchar(100))
BEGIN
DECLARE exist int;
SELECT COUNT(*) INTO exist  FROM categories WHERE name = c_name;

IF exist > 0 THEN
SET msg = 'Category already exists';

ELSE
INSERT INTO categories(name) VALUES(c_name);
SET msg = 'Category added successfully';
END IF;

END $$
DELIMITER ;




CALL addNeweCategory('vegetables', @msg);
SELECT @msg;


DELIMITER $$
CREATE PROCEDURE addNeweCategory(IN c_name varchar(100), OUT msg varchar(100))
BEGIN
DECLARE exist int;
SELECT COUNT(*) INTO exist  FROM categories WHERE name = c_name;

IF exist > 0 THEN
SET msg = 'Category already exists';

ELSE
START TRANSACTION;
INSERT INTO categories(name) VALUES(c_name);
SET msg = 'Category added successfully';
COMMIT;
END IF;

END $$


DELIMITER ;


CREATE TABLE products(
 id int PRIMARY KEY auto_increment,
    name varchar(100) NOT null,
    description varchar(100),
    price decimal(10,2),
    stock int NOT null DEFAULT 0,
    category_id int,
    FOREIGN KEY (category_id) REFERENCES categories(id),
    shop_id int,
    FOREIGN KEY (shop_id) REFERENCES shops(id)
);





SELECT products.name AS product_name, shops.name AS shop_name, users.name AS user_name
FROM products JOIN shops ON products.shop_id = shops.id
JOIN users ON shops.user_id = users.id;





CREATE VIEW product_shop_user_view AS
SELECT products.name AS product_name, shops.name AS shop_name, users.name AS owner_name
FROM products JOIN shops ON products.shop_id = shops.id
JOIN users ON shops.user_id = users.id;







DELIMITER $$ 

CREATE PROCEDURE  addNewProduct(
IN p_name VARCHAR(100),
IN p_price DECIMAL(10,2),
IN p_stock int,
IN p_category_id int,
IN p_shop_id int
)
BEGIN 
INSERT INTO products(name, price, stock, category_id, shop_id)
VALUES(p_name, p_price, p_stock, p_category_id, p_shop_id);
END$$
DELIMITER ;





CALL addNewShop('Oishe Super Shop', 1);

CALL addNewProduct('potato', 70, 100, 2, 2);


DELIMITER $$
CREATE FUNCTION calculatePrice(p_name varchar(100), p_quantity int)
RETURNS varchar(100)
BEGIN
DECLARE p_price decimal(10,2);
DECLARE p_stock int;
SELECT price, stock INTO p_price, p_stock FROM products WHERE name = p_name;
IF p_stock >= p_quantity THEN
RETURN CONCAT('Total Price: ', p_price * p_quantity) ;


ELSE RETURN 'Product Not Available';
END IF;

END $$
DELIMITER ;



FIND POTATO PRICE?
SELECT calculatePrice('potato', 20);




