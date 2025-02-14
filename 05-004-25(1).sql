CREATE DATABASE Travel_Management_System;



CREATE TABLE company (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    contact VARCHAR(100) NOT NULL
);


CREATE TABLE bus (
    bus_id INT PRIMARY KEY AUTO_INCREMENT,
    bus_name VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES company(id)
);


CREATE TABLE driver (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    license_no VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    bus_id INT,
    FOREIGN KEY (bus_id) REFERENCES bus(bus_id)
);


CREATE TABLE passenger (
    p_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    gender VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL
);


CREATE TABLE book_ticket (
    t_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    bus_id INT,
    journey_date DATE NOT NULL,
    seat_no VARCHAR(255) NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES passenger(p_id),
    FOREIGN KEY (bus_id) REFERENCES bus(bus_id)
);


CREATE TABLE payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    bus_id INT,
    amount DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES passenger(p_id),
    FOREIGN KEY (bus_id) REFERENCES bus(bus_id)
);






DATA INSERT-----------------


INSERT INTO company (id, name, city, contact) VALUES
(1, 'SR Group', 'Dhaka', '80988789'),
(2, 'Karim Group', 'Faridpur', '576577867'),
(3, 'Hanif Travel', 'Dhaka', '57678677');


INSERT INTO bus (bus_id, bus_name, model, company_id) VALUES
(1, 'Hanif', 'volvo', 3),
(2, 'Nabil', 'scania', 1),
(3, 'Alam', 'volvo', 1),
(4, 'SR', 'sarkar', 3),
(5, 'Hanif Scania', 'Scania', 3);


INSERT INTO driver (d_id, name, phone, license_no, city, bus_id) VALUES
(1, 'Habib', '198398409', 'A125679', 'Dhaka', 1),
(2, 'Kamal', '1374577567', 'A125622', 'Barishal', 2),
(3, 'Nabab', '1983984409', 'A12534', 'Rajshahi', 5),
(4, 'Jamal', '1374877567', 'BA125679', 'Dhaka', 4);


INSERT INTO passenger (p_id, first_name, last_name, gender, email, phone) VALUES
(1, 'nasir', 'Hossain', 'male', 'nasir@gmail.com', '1900987654'),
(2, 'azim', 'Uddin', 'male', 'azim@gmail.com', '9876262636'),
(3, 'bina', 'Kabir', 'female', 'bina@gmail.com', '1933987654'),
(4, 'aslam', 'Khan', 'male', 'aslam@gmail.com', '9876266636');


INSERT INTO book_ticket (t_id, passenger_id, bus_id, route_id,  journey_date, seat_no) VALUES
(1, 1, 3, 1, '2019-11-15', 'A3'),
(2, 2, 3, 2, '2019-11-15', 'A4'),
(3, 3, 3, 1,  '2019-11-15', 'A8'),
(4, 4, 3, 1, '2019-11-15', 'B4');





INSERT INTO payment (passenger_id, bus_id, amount) VALUES 
(1, 4, 500.00),
(2, 2, 500.00);




Ans-1
SELECT bus.bus_name, company.name AS company_name
FROM bus
JOIN company ON bus.company_id = company.id;

ans -2
SELECT driver.name AS driver_name
FROM driver
JOIN bus ON driver.bus_id = bus.bus_id
JOIN company ON bus.company_id = company.id
WHERE company.name = 'SR Group';

3.
SELECT COUNT(passenger.p_id) AS number_of_passengers
FROM passenger
JOIN book_ticket ON passenger.p_id = book_ticket.passenger_id
JOIN bus ON book_ticket.bus_id = bus.bus_id
WHERE bus.bus_name = 'Alam';

4. 
SELECT passenger.first_name, passenger.last_name, AVG(payment.amount) AS average_payment
FROM passenger
JOIN payment ON passenger.p_id = payment.passenger_id
GROUP BY passenger.first_name, passenger.last_name;

5. 
SELECT company.name AS company_name, COUNT(bus.bus_id) AS total_buses
FROM company
LEFT JOIN bus ON company.id = bus.company_id
GROUP BY company.name;


6. 
SELECT first_name, last_name, phone
FROM passenger
WHERE phone LIKE '019%' OR phone LIKE '014%';

7. 
SELECT passenger.first_name, passenger.last_name, passenger.email, passenger.phone
FROM passenger
JOIN payment ON passenger.p_id = payment.passenger_id
GROUP BY passenger.p_id
HAVING COUNT(payment.payment_id) > 1;

8. 
SELECT passenger.first_name, passenger.last_name, COUNT(book_ticket.t_id) AS travel_count
FROM passenger
JOIN book_ticket ON passenger.p_id = book_ticket.passenger_id
GROUP BY passenger.p_id
ORDER BY travel_count DESC
LIMIT 3;

9. 
CREATE VIEW passenger_contact_details AS
SELECT first_name, last_name, email, phone
FROM passenger;

10. 
SELECT company.name AS company_name, SUM(payment.amount) AS total_revenue
FROM company
JOIN bus ON company.id = bus.company_id
JOIN payment ON bus.bus_id = payment.bus_id
GROUP BY company.name;
