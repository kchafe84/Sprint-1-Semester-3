-- SQL statements form creating my tables 

-- CREATING CITY TABLE

CREATE TABLE public.city
(
    id bigint NOT NULL,
    city_name character varying(225) NOT NULL,
    province character varying(225) NOT NULL,
    population bigint NOT NULL,
    number_of_airportss bigint NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.city
    OWNER to postgres;
	
--CREATING PASSENGERS TALBE

CREATE TABLE public.passenger
(
    id bigint NOT NULL,
    first_name character varying(225) NOT NULL,
    last_name character varying(225) NOT NULL,
    age bigint NOT NULL,
    phone_number character varying(20) NOT NULL,
    email character varying(225),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.passenger
    OWNER to postgres;
	
-- CREATING AIRPORTS TALBE

CREATE TABLE public.airport
(
    id bigint NOT NULL,
    airport_name character varying(225) NOT NULL,
    area_code bigint NOT NULL,
    postal_code character varying(10) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.airport
    OWNER to postgres;
	
-- CREATING AIRCRAFT TALBE

CREATE TABLE public.aircraft
(
    id bigint NOT NULL,
    type character varying(225) NOT NULL,
    airline_name character varying(225) NOT NULL,
    weight_kg bigint NOT NULL,
    number_of_passenger bigint NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.aircraft
    OWNER to postgres;	
	
-- GIVE AIRPORT A CITY_ID FK

ALTER TABLE IF EXISTS public.airport
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id)
    REFERENCES public.city (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
	
-- CREATING A PASSENGER AND CITY RELATION 

CREATE TABLE public.passenger_city
(
    passenger_id bigint NOT NULL,
    city_id bigint NOT NULL,
    CONSTRAINT passenger_fk FOREIGN KEY (passenger_id)
        REFERENCES public.passenger (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT city_fk FOREIGN KEY (city_id)
        REFERENCES public.city (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.passenger_city
    OWNER to postgres;
	
-- CREATING A TABLE THAT KNOWS WHERE AIRCRAFTS CAN TAKE OFF/LAND 

CREATE TABLE public.aircraft_takeoff_land
(
    aircraft_id bigint NOT NULL,
    airport_id bigint NOT NULL,
    CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id)
        REFERENCES public.aircraft (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT airport_fk FOREIGN KEY (airport_id)
        REFERENCES public.airport (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.aircraft_takeoff_land
    OWNER to postgres;
	
	
-- CREATING A TABLE TO KNOW WHICH AIRPORT PASSENGERS HAVE BEEN TO
	
CREATE TABLE public.passenger_airport
(
    passenger_id bigint NOT NULL,
    airport_id bigint NOT NULL,
    CONSTRAINT passenger_fk FOREIGN KEY (passenger_id)
        REFERENCES public.passenger (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT airport_fk FOREIGN KEY (airport_id)
        REFERENCES public.airport (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

ALTER TABLE IF EXISTS public.passenger_airport
    OWNER to postgres;

----------------------------------------------------------------------------------------------------------------

-- ** INSERTING ALL DATA INTO THE TALBES AND ANSWERING ALL THE QAP QUESTIONS ** --

select * from passenger;
select * from airport;
select * from aircraft;
select * from city;

-- adding info into airport table

insert into airport (id, airport_name, area_code, postal_code, city_id) values(1, 'Lucky airport', 709, 'A0A1G0', 1);
insert into airport (id, airport_name, area_code, postal_code, city_id) values(2, 'Wave airport', 805, 'B0X1Z0', 2);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(3, 'Tempa airport', 609, 'B0X1X0', 2);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(4, 'Airrie airport', 000, 'A2VXZ0', 3);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(5, 'SouthPark airport', 001, 'B0X1T2', 3);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(6, 'Flyer airport', 404, 'Q1S5Y9', 4);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(7, 'French airport', 604, 'B1S5Y9', 4);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(8, 'Teryhigh airport', 777, 'R5TSQ0', 5);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(9, 'Flatland airport', 557, 'E4X0D2', 6);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(10, 'Mayweather airport', 667, 'R5TSQ6', 6);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(11, 'Teryhigh airport', 777, 'R5TSQ0', 7);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(12, 'Grand airport', 113, 'R5R4Q0', 8);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(13, 'Dread airport', 555, 'C3X50H', 9);
insert into airport (id, airport_name, area_code,postal_code, city_id) values(14, 'Mercy airport', 432, 'E4F5C0', 9);

-- gets data from citys and airports 

select * from city, airport
where city.id = airport.city_id;

-- pick a city and show how many airports they have 

select * from city, airport
where city.id = airport.city_id
and city.id = 2;

select * from city, airport
where city.id = airport.city_id
and city.id = 1;

-------------------------------------------------------------------------------------------------------------------

-- adding info into airport table

insert into passenger (id, first_name, last_name, age, phone_number, email) values (1, 'kyle', 'snow', 24, '709-683-6666', 'Klyes@keyin.com');
insert into passenger (id, first_name, last_name, age, phone_number, email) values (2, 'Tyler', 'Power', 26, '709-555-6226', 'Tylerp@keyin.com');
insert into passenger (id, first_name, last_name, age, phone_number, email) values (3, 'Ken', 'Chafe', 30, '701-875-6754', 'kenc@keyin.com');
insert into passenger (id, first_name, last_name, age, phone_number, email) values (4, 'Sarah', 'Mercer', 21, '796-853-6556', 'Sarahm@keyin.com');
insert into passenger (id, first_name, last_name, age, phone_number, email) values (5, 'Gary', 'Dover', 17, '788-223-5436', 'GaryB@keyin.com');
insert into passenger (id, first_name, last_name, age, phone_number, email) values (6, 'Frank', 'Rave', 44, '098-893-9999', 'Ffraanky@keyin.com');
insert into passenger (id, first_name, last_name, age, phone_number, email) values (7, 'Sam', 'Mercer', 46, '196-663-1221', 'Sammy@keyin.com');
insert into passenger (id, first_name, last_name, age, phone_number, email) values (8, 'Kate', 'port', 26, '888-657-2256', 'katte@keyin.com');
insert into passenger (id, first_name, last_name, age, phone_number, email) values (9, 'Max', 'Driver', 21, '666-555-6557', 'Mamxm@keyin.com');
insert into passenger (id, first_name, last_name, age, phone_number, email) values (10, 'Arthur', 'Dawe', 21, '996-613-6006', 'Arth@keyin.com');


-- adding info into passenger_city table

insert into passenger_city (passenger_id, city_id) values (1, 1);
insert into passenger_city (passenger_id, city_id) values (2, 1);
insert into passenger_city (passenger_id, city_id) values (3, 2);
insert into passenger_city (passenger_id, city_id) values (4, 4);
insert into passenger_city (passenger_id, city_id) values (5, 1);
insert into passenger_city (passenger_id, city_id) values (6, 4);
insert into passenger_city (passenger_id, city_id) values (7, 7);
insert into passenger_city (passenger_id, city_id) values (8, 5);
insert into passenger_city (passenger_id, city_id) values (9, 5);
insert into passenger_city (passenger_id, city_id) values (10, 8);


select * from passenger;
select * from passenger_city;

-- gets all passengers and where they are from 

select passenger.id, passenger.first_name, passenger.last_name, city_name from  passenger, passenger_city, city
where passenger_city.passenger_id = passenger.id 
and passenger_city.city_id = city.id;

-- gets all passengers from a city

select passenger.id, passenger.first_name, passenger.last_name, city_name from  passenger, passenger_city, city
where passenger_city.passenger_id = passenger.id 
and passenger_city.city_id = city.id
and city.id = 5;

-- get the city that a single passenger is from 

select passenger.id, passenger.first_name, passenger.last_name, city_name from  passenger, passenger_city, city
where passenger_city.passenger_id = passenger.id 
and passenger_city.city_id = city.id
and passenger.id = 1;

----------------------------------------------------------------------------------------------------

-- adding info into aircraft table

insert into aircraft (id, type, airline_name, weight_kg, number_of_passenger) values (1, 'boeing 747-8', 'west jet', 412770, 524);
insert into aircraft (id, type, airline_name, weight_kg, number_of_passenger) values (2, 'AirBus A330', 'air canada', 401000, 424);
insert into aircraft (id, type, airline_name, weight_kg, number_of_passenger) values (3, 'boeing 777', 'west jet', 168560, 224);
insert into aircraft (id, type, airline_name, weight_kg, number_of_passenger) values (4, 'AirBus A340', 'air canada', 368000, 400);
insert into aircraft (id, type, airline_name, weight_kg, number_of_passenger) values (5, 'AirBus A550', 'west jet', 168000, 190);
insert into aircraft (id, type, airline_name, weight_kg, number_of_passenger) values (6, 'BlackBird 87', 'air canada', 100000, 100);
insert into aircraft (id, type, airline_name, weight_kg, number_of_passenger) values (7, 'RedBird 88', 'air canada', 150000, 150);
insert into aircraft (id, type, airline_name, weight_kg, number_of_passenger) values (8, 'AirBus AAAA', 'west jet', 568000, 600);
insert into aircraft (id, type, airline_name, weight_kg, number_of_passenger) values (9, 'BlackHawk', 'air canada', 50000, 30);
insert into aircraft (id, type, airline_name, weight_kg, number_of_passenger) values (10, 'BlackBee A30', 'west jet', 180000, 100);

-- adding info into passenger_aircraft table

insert into passenger_aircraft (passenger_id, aircraft_id) values (1, 1);
insert into passenger_aircraft (passenger_id, aircraft_id) values (1, 2);
insert into passenger_aircraft (passenger_id, aircraft_id) values (1, 3);
insert into passenger_aircraft (passenger_id, aircraft_id) values (1, 4);
insert into passenger_aircraft (passenger_id, aircraft_id) values (2, 1);
insert into passenger_aircraft (passenger_id, aircraft_id) values (2, 4);
insert into passenger_aircraft (passenger_id, aircraft_id) values (3, 1);
insert into passenger_aircraft (passenger_id, aircraft_id) values (4, 2);
insert into passenger_aircraft (passenger_id, aircraft_id) values (4, 3);
insert into passenger_aircraft (passenger_id, aircraft_id) values (4, 4);
insert into passenger_aircraft (passenger_id, aircraft_id) values (5, 1);
insert into passenger_aircraft (passenger_id, aircraft_id) values (5, 2);
insert into passenger_aircraft (passenger_id, aircraft_id) values (5, 3);
insert into passenger_aircraft (passenger_id, aircraft_id) values (5, 4);
insert into passenger_aircraft (passenger_id, aircraft_id) values (5, 7);
insert into passenger_aircraft (passenger_id, aircraft_id) values (5, 10);
insert into passenger_aircraft (passenger_id, aircraft_id) values (6, 6);
insert into passenger_aircraft (passenger_id, aircraft_id) values (7, 8);
insert into passenger_aircraft (passenger_id, aircraft_id) values (7, 2);
insert into passenger_aircraft (passenger_id, aircraft_id) values (7, 1);
insert into passenger_aircraft (passenger_id, aircraft_id) values (8, 9);
insert into passenger_aircraft (passenger_id, aircraft_id) values (9, 10);
insert into passenger_aircraft (passenger_id, aircraft_id) values (9, 1);
insert into passenger_aircraft (passenger_id, aircraft_id) values (9, 3);
insert into passenger_aircraft (passenger_id, aircraft_id) values (9, 4);
insert into passenger_aircraft (passenger_id, aircraft_id) values (10, 9);
insert into passenger_aircraft (passenger_id, aircraft_id) values (10, 5);

select * from passenger_aircraft;

-- gets all aircrafts all passengers traveled on  

select aircraft.type, passenger.first_name, passenger.last_name  from aircraft, passenger, passenger_aircraft
where passenger_aircraft.passenger_id = passenger.id
and passenger_aircraft.aircraft_id = aircraft.id;

-- gets a single passenger will all aircrafts they traveled on  

select aircraft.type, passenger.first_name, passenger.last_name  from aircraft, passenger, passenger_aircraft
where passenger_aircraft.passenger_id = passenger.id
and passenger_aircraft.aircraft_id = aircraft.id
and passenger.id = 1;

select aircraft.type, passenger.first_name, passenger.last_name  from aircraft, passenger, passenger_aircraft
where passenger_aircraft.passenger_id = passenger.id
and passenger_aircraft.aircraft_id = aircraft.id
and passenger.id = 5;


--------------------------------------------------------------------------------------------------------------

-- adding info into aircraft_takeoff_land table

insert into aircraft_takeoff_land (aircraft_id, airport_id) values (1, 1);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (1, 2);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (1, 3);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (2, 2);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (2, 3);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (3, 1);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (3, 2);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (3, 3);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (4, 1);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (6, 1);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (6, 2);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (6, 3);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (6, 4);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (6, 5);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (7, 6);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (7, 7);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (7, 8);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (7, 9);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (8, 9);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (8, 8);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (9, 1);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (9, 2);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (9, 3);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (9, 4);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (10, 9);
insert into aircraft_takeoff_land (aircraft_id, airport_id) values (10, 8);

select * from aircraft_takeoff_land;

-- gets a list of all aircrafts and the airports they can use 

select aircraft.type, airport.airport_name from aircraft, airport, aircraft_takeoff_land
where aircraft_takeoff_land.aircraft_id = aircraft.id
and aircraft_takeoff_land.airport_id = airport.id;

-- gets a single aircraft and the airports they can use

select aircraft.type, airport.airport_name from aircraft, airport, aircraft_takeoff_land
where aircraft_takeoff_land.aircraft_id = aircraft.id
and aircraft_takeoff_land.airport_id = airport.id
and aircraft.id = 6;

-----------------------------------------------------------------------------------------------

-- adding info into passenger_airport table

insert into passenger_airport (passenger_id, airport_id) values (1, 1);
insert into passenger_airport (passenger_id, airport_id) values (1, 2);
insert into passenger_airport (passenger_id, airport_id) values (1, 5);
insert into passenger_airport (passenger_id, airport_id) values (1, 6);
insert into passenger_airport (passenger_id, airport_id) values (2, 1);
insert into passenger_airport (passenger_id, airport_id) values (2, 5);
insert into passenger_airport (passenger_id, airport_id) values (3, 14);
insert into passenger_airport (passenger_id, airport_id) values (3, 13);
insert into passenger_airport (passenger_id, airport_id) values (3, 12);
insert into passenger_airport (passenger_id, airport_id) values (3, 4);
insert into passenger_airport (passenger_id, airport_id) values (3, 9);
insert into passenger_airport (passenger_id, airport_id) values (4, 7);
insert into passenger_airport (passenger_id, airport_id) values (4, 8);
insert into passenger_airport (passenger_id, airport_id) values (4, 10);
insert into passenger_airport (passenger_id, airport_id) values (5, 11);
insert into passenger_airport (passenger_id, airport_id) values (5, 1);
insert into passenger_airport (passenger_id, airport_id) values (6, 13);
insert into passenger_airport (passenger_id, airport_id) values (6, 14);
insert into passenger_airport (passenger_id, airport_id) values (6, 2);
insert into passenger_airport (passenger_id, airport_id) values (6, 3);
insert into passenger_airport (passenger_id, airport_id) values (7, 4);
insert into passenger_airport (passenger_id, airport_id) values (7, 5);
insert into passenger_airport (passenger_id, airport_id) values (8, 11);
insert into passenger_airport (passenger_id, airport_id) values (8, 10);
insert into passenger_airport (passenger_id, airport_id) values (8, 9);
insert into passenger_airport (passenger_id, airport_id) values (9, 1);
insert into passenger_airport (passenger_id, airport_id) values (9, 2);
insert into passenger_airport (passenger_id, airport_id) values (10, 7);
insert into passenger_airport (passenger_id, airport_id) values (10, 8);


select * from passenger_airport;

-- gets a list of all passengers and all airports they have been to

select passenger.first_name, passenger.last_name, airport.airport_name from passenger, airport, passenger_airport
where passenger_airport.passenger_id = passenger.id
and passenger_airport.airport_id = airport.id;

-- gets a list of all airports a single passenger has been to

select passenger.first_name, passenger.last_name, airport.airport_name from passenger, airport, passenger_airport
where passenger_airport.passenger_id = passenger.id
and passenger_airport.airport_id = airport.id
and passenger.id = 6;
