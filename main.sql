CREATE TABLE customer(
	customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name VARCHAR(255),	
	last_name VARCHAR(255),
	address VARCHAR(255),
	payment_info VARCHAR(255)
);
DROP TABLE customer;



CREATE TABLE destination(
destination_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
cruise_lines VARCHAR(255),
trip_destination VARCHAR(255),
departure_ports VARCHAR(255)
);
DROP TABLE destination;




CREATE TABLE reservation(
room_number INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
room_postion VARCHAR(255)
);
DROP TABLE reservation;


CREATE TABLE customer_destination(
customer_id INTEGER REFERENCES customer(customer_id),
destination_id INTEGER REFERENCES destination (destination_id),
room_number INTEGER REFERENCES reservation (room_number)
);
DROP TABLE customer_destination;



SELECT * FROM customer;

SELECT * FROM destination;

SELECT * FROM reservation;

SELECT * FROM customer_destination;




	
INSERT INTO customer(first_name, last_name, address, payment_info ) VALUES
('Michel', 'Charles', '1 Revature Way', '123 456 789'),
('Tyler', 'The, Creator', '12 Igor Street', '098 765 432'),
('Lionel', 'Messi', '10 Camp Nou Ave', '234 768 901'),
('Jon', 'Doe', '1 Anonymous Blvd', '000 111 222');
	


INSERT INTO destination(cruise_lines, trip_destination, departure_ports) VALUES  
('Royal Caribbean', 'Antigua, Cayman, Bahamas', 'Tampa'),
('Elixir Cruise', 'Île de la Tortue, Cozmuel, Catalina, Aruba', 'Fort Lauderdale'),
('Aladdin Cruise', 'Hawai, Tahiti, New Zealand', 'San Diego'),
('Open Sesame', 'Cancun, Cozumel, Bahamas', 'Baton Rouge');


INSERT INTO reservation (room_postion) VALUES 
('1st Floor, Section A'),
('1st Floor, Section C'),
('2nd Floor, Section B'),
('2nd FLoor, Section A');

INSERT INTO customer_destination (customer_id, destination_id, room_number) VALUES 
('1', '4', '2'),
('2', '3', '4'),
('3', '2', '1'),
('4', '1', '3');











