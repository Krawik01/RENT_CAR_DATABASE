-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-22 16:17:50.174

-- tables
-- Table: car
CREATE TABLE car (
    id number  NOT NULL,
    garage_id number  NOT NULL,
    model varchar2(100)  NOT NULL,
    make varchar2(100)  NOT NULL,
    year_production number  NOT NULL,
    engine_capacity number  NOT NULL,
    mileage number  NOT NULL,
    cost_day number  NOT NULL,
    deposit number  NOT NULL,
    status_id number  NOT NULL,
    CONSTRAINT car_pk PRIMARY KEY (id)
) ;

-- Table: car_color
CREATE TABLE car_color (
    color_id number  NOT NULL,
    car_id number  NOT NULL,
    CONSTRAINT car_color_pk PRIMARY KEY (color_id,car_id)
) ;

-- Table: client
CREATE TABLE client (
    person_id number  NOT NULL,
    "number" number  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (person_id)
) ;

-- Table: color
CREATE TABLE color (
    id number  NOT NULL,
    name varchar2(11)  NOT NULL,
    CONSTRAINT color_pk PRIMARY KEY (id)
) ;

-- Table: garage
CREATE TABLE garage (
    id number  NOT NULL,
    "date" integer  NOT NULL,
    description varchar2(100)  NOT NULL,
    cost number  NOT NULL,
    CONSTRAINT garage_pk PRIMARY KEY (id)
) ;

-- Table: mechanic
CREATE TABLE mechanic (
    person_id number  NOT NULL,
    garage_id number  NOT NULL,
    salary_mechanic number  NOT NULL,
    CONSTRAINT mechanic_pk PRIMARY KEY (person_id)
) ;

-- Table: person
CREATE TABLE person (
    id number  NOT NULL,
    name varchar2(100)  NOT NULL,
    surname varchar2(100)  NOT NULL,
    pesel number  NOT NULL,
    phone_number number  NOT NULL,
    email varchar2(100)  NOT NULL,
    CONSTRAINT person_pk PRIMARY KEY (id)
) ;

-- Table: reservation
CREATE TABLE reservation (
    id number  NOT NULL,
    client_person_id number  NOT NULL,
    date_start number  NOT NULL,
    date_finish number  NOT NULL,
    CONSTRAINT reservation_pk PRIMARY KEY (id)
) ;

-- Table: reservation_cars
CREATE TABLE reservation_cars (
    cars_id number  NOT NULL,
    reservation_id number  NOT NULL,
    CONSTRAINT reservation_cars_pk PRIMARY KEY (cars_id,reservation_id)
) ;

-- Table: reservation_mechanic
CREATE TABLE reservation_mechanic (
    reservation_id number  NOT NULL,
    mechanic_person_id number  NOT NULL,
    CONSTRAINT reservation_mechanic_pk PRIMARY KEY (reservation_id,mechanic_person_id)
) ;

-- Table: reservation_worker
CREATE TABLE reservation_worker (
    reservation_id number  NOT NULL,
    worker_person_id number  NOT NULL,
    CONSTRAINT reservation_worker_pk PRIMARY KEY (reservation_id,worker_person_id)
) ;

-- Table: status
CREATE TABLE status (
    id number  NOT NULL,
    name varchar2(100)  NOT NULL,
    CONSTRAINT status_pk PRIMARY KEY (id)
) ;

-- Table: worker
CREATE TABLE worker (
    person_id number  NOT NULL,
    salary_worker number  NOT NULL,
    CONSTRAINT worker_pk PRIMARY KEY (person_id)
) ;

-- foreign keys
-- Reference: car_color_car (table: car_color)
ALTER TABLE car_color ADD CONSTRAINT car_color_car
    FOREIGN KEY (car_id)
    REFERENCES car (id);

-- Reference: car_color_color (table: car_color)
ALTER TABLE car_color ADD CONSTRAINT car_color_color
    FOREIGN KEY (color_id)
    REFERENCES color (id);

-- Reference: car_garage (table: car)
ALTER TABLE car ADD CONSTRAINT car_garage
    FOREIGN KEY (garage_id)
    REFERENCES garage (id);

-- Reference: car_status (table: car)
ALTER TABLE car ADD CONSTRAINT car_status
    FOREIGN KEY (status_id)
    REFERENCES status (id);

-- Reference: client_person (table: client)
ALTER TABLE client ADD CONSTRAINT client_person
    FOREIGN KEY (person_id)
    REFERENCES person (id);

-- Reference: reservation_cars_cars (table: reservation_cars)
ALTER TABLE reservation_cars ADD CONSTRAINT reservation_cars_cars
    FOREIGN KEY (cars_id)
    REFERENCES car (id);

-- Reference: reservation_cars_reservation (table: reservation_cars)
ALTER TABLE reservation_cars ADD CONSTRAINT reservation_cars_reservation
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (id);

-- Reference: reservation_client (table: reservation)
ALTER TABLE reservation ADD CONSTRAINT reservation_client
    FOREIGN KEY (client_person_id)
    REFERENCES client (person_id);

-- Reference: reservation_client_reservation (table: reservation_worker)
ALTER TABLE reservation_worker ADD CONSTRAINT reservation_client_reservation
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (id);

-- Reference: reservation_client_worker (table: reservation_worker)
ALTER TABLE reservation_worker ADD CONSTRAINT reservation_client_worker
    FOREIGN KEY (worker_person_id)
    REFERENCES worker (person_id);

-- Reference: reservation_mechanic (table: reservation_mechanic)
ALTER TABLE reservation_mechanic ADD CONSTRAINT reservation_mechanic
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (id);

-- Reference: reservation_mechanic_mechanic (table: reservation_mechanic)
ALTER TABLE reservation_mechanic ADD CONSTRAINT reservation_mechanic_mechanic
    FOREIGN KEY (mechanic_person_id)
    REFERENCES mechanic (person_id);

-- Reference: worker_garage (table: mechanic)
ALTER TABLE mechanic ADD CONSTRAINT worker_garage
    FOREIGN KEY (garage_id)
    REFERENCES garage (id);

-- Reference: worker_person (table: worker)
ALTER TABLE worker ADD CONSTRAINT worker_person
    FOREIGN KEY (person_id)
    REFERENCES person (id);

-- Reference: worker_person_mechanic (table: mechanic)
ALTER TABLE mechanic ADD CONSTRAINT worker_person_mechanic
    FOREIGN KEY (person_id)
    REFERENCES person (id);

-- End of file.

