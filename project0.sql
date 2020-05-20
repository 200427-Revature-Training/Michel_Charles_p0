CREATE TABLE passengers(
	
	passenger_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email_address VARCHAR(255) NOT NULL,
	street_address VARCHAR(255) NOT NULL,
	city VARCHAR(255) NOT NULL, 
	state VARCHAR (255), -- No 'NOT NULL' constraints because a customer's address might be one of a foreign country (not US based)--
	postal_code CHAR (10), -- Not every country has a postal_code system --
	country VARCHAR (255) NOT NULL,
	payment_info INTEGER REFERENCES payment (payment_confirmation)
); DROP TABLE passengers


CREATE TABLE destinations(
	
	destination_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	destination_to VARCHAR (255) NOT NULL,
	departure_port VARCHAR (255) NOT NULL,
	departure_date TIMESTAMP NOT NULL,
	duration VARCHAR (255) NOT NULL
); DROP TABLE destinations


CREATE TABLE rooms(
	room_number INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	room_count INTEGER NOT NULL,
	guest_accommodation INTEGER NOT NULL, -- Maximum of 4, check will be applied below --
	CHECK (guest_accommodation <= 4),
	room_type VARCHAR(255) NOT NULL -- 4 rooms type: Interior, Ocean View, Balcony and suites --
); DROP TABLE rooms



CREATE TABLE payment(
	
	payment_confirmation INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
	card_number VARCHAR (16) NOT NULL,
	expiration_date DATE NOT NULL,
	cvv_number CHAR(4) NOT NULL
); DROP TABLE payment 


CREATE TABLE reservation(
	passenger_id INTEGER REFERENCES passengers (passenger_id),
	payment_confirmation INTEGER REFERENCES payment (payment_confirmation) UNIQUE,
	destination_id INTEGER REFERENCES destinations (destination_id),
	room_number INTEGER REFERENCES rooms (room_number) UNIQUE
); DROP TABLE reservation


SELECT * FROM passengers 

insert into passengers (first_name, last_name, email_address, street_address, city, state, postal_code, country, payment_info)
values ('Gauthier', 'Pendle', 'gpendle0@sfgate.com', '3 Pearson Road', 'Batulawang', null, null, 'Indonesia', 1);

insert into passengers (first_name, last_name, email_address, street_address, city, state, postal_code, country, payment_info) 
values ('Alejandrina', 'Stansbie', 'astansbie1@pbs.org', '7735 Pond Junction', 'C?u G?', null, null, 'Vietnam', 2);

insert into passengers (first_name, last_name, email_address, street_address, city, state, postal_code, country, payment_info) 
values ('Blair', 'Collop', 'bcollop2@weather.com', '0712 Autumn Leaf Alley', 'Krásná Hora nad Vltavou', null, '262 56', 'Czech Republic', 3);

insert into passengers (first_name, last_name, email_address, street_address, city, state, postal_code, country, payment_info)
values ('Homerus', 'Verillo', 'hverillo3@sciencedaily.com', '9963 Bay Court', 'Kraków', null, '31-999', 'Poland', 4);

insert into passengers (first_name, last_name, email_address, street_address, city, state, postal_code, country, payment_info) 
values ('Aylmar', 'Kilfedder', 'akilfedder4@myspace.com', '3 Victoria Hill', 'Casal Velho', 'Leiria', '3100-327', 'Portugal', 5);




SELECT * FROM destinations


insert into destinations (destination_to, departure_port, departure_date, duration) 
values ('Brazil', 'Santa Rosa de Viterbo', '2021-05-13 23:47:03', '3-5 days');

insert into destinations (destination_to, departure_port, departure_date, duration) 
values ('Tunisia', 'El Kef', '2020-11-21 10:37:31', '13+ days');

insert into destinations (destination_to, departure_port, departure_date, duration) 
values ('China', 'Huquan', '2020-12-22 06:57:16', '6-8 days');

insert into destinations (destination_to, departure_port, departure_date, duration) 
values ('Aland Islands', 'Kumlinge', '2020-11-02 02:25:34', '13+ days');

insert into destinations (destination_to, departure_port, departure_date, duration) 
values ('Ukraine', 'Pidhaytsi', '2021-05-06 20:12:22', '2-3 days');


SELECT * FROM rooms 

INSERT INTO rooms (room_count, guest_accommodation, room_type) VALUES
(1, 4, 'Balcony'),
(1, 0, 'Suite'),
(2, 2, 'Balcony'),
(1, 3, 'Ocean View'),
(3, 4, 'Interior')



SELECT * FROM payment

INSERT INTO payment (card_number, expiration_date, cvv_number) VALUES 
('5610922449017645', '2020-02-23', '1245'),
('3579420080982452', '2021-04-15', '4568'),
('201631308701050', '2022-02-16', '1111'),
('201886625610182', '2023-03-16', '7894'),
('676132738880529', '2025-01-01', '6935')

SELECT * FROM reservation


INSERT INTO reservation (passenger_id, payment_confirmation, destination_id, room_number) VALUES 
(3, 1, 1, 1),
(4, 2, 2, 2),
(5, 3, 3, 3),
(6, 4, 4, 4),
(7, 5, 5, 5)


SELECT * FROM public.reservation r 



