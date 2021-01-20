

-- continents

CREATE TABLE continents ( 
    continent_id    VARCHAR2(25),
    continent_name  VARCHAR2(25)    NOT NULL,
    
    CONSTRAINT continent_PK PRIMARY KEY (continent_id)
);


-- countries

CREATE TABLE countries ( 
    country_id    VARCHAR2(25),
    country_name  VARCHAR2(25)  NOT NULL,
    continent_id  VARCHAR2(25)  NOT NULL,
    
    CONSTRAINT country_PK PRIMARY KEY (country_id),
    CONSTRAINT country_FK FOREIGN KEY (continent_id) REFERENCES continents(continent_id)
);


-- airports

CREATE TABLE airports ( 
    airport_id    VARCHAR2(25),
    airport_name  VARCHAR2(50)  NOT NULL,
    city          VARCHAR2(25)  NOT NULL,
    street        VARCHAR2(50),
    country_id    VARCHAR2(25)  NOT NULL,
    
    CONSTRAINT airport_PK PRIMARY KEY (airport_id),
    CONSTRAINT airport_FK FOREIGN KEY (country_id) REFERENCES countries(country_id)
);


-- flights

CREATE TABLE flights ( 
    flight_id           INT,
    flight_duration     NUMBER(5,2)   NOT NULL,
    departure_time      DATE          NOT NULL,
    arrival_time        DATE          NOT NULL,
    distance            NUMBER(10,2)  NOT NULL,
    airport_from_id     VARCHAR2(25)  NOT NULL,
    airport_to_id       VARCHAR2(25)  NOT NULL,
    
    CONSTRAINT flight_PK  PRIMARY KEY (flight_id),
    CONSTRAINT flight_FK1 FOREIGN KEY (airport_from_id) REFERENCES airports(airport_id),
    CONSTRAINT flight_FK2 FOREIGN KEY (airport_to_id)   REFERENCES airports(airport_id)    
);


-- seats

CREATE TABLE seats ( 
    seat_id             INT,
    num_in_plane        INT,
    availability        VARCHAR2(25)  NOT NULL,
    seat_class          VARCHAR2(25)  NOT NULL,
    flight_id           INT           NOT NULL,

    CONSTRAINT seat_PK PRIMARY KEY (seat_id),
    CONSTRAINT seat_FK FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    CONSTRAINT check_availability CHECK (availability IN ('available', 'reserved', 'unavailable')),
    CONSTRAINT check_seat_calss   CHECK (seat_class IN ('business class', 'economy class', 'first class'))
);


-- passengers

CREATE TABLE passengers ( 
    passenger_id        INT,
    first_name          VARCHAR2(25)  NOT NULL,
    last_name           VARCHAR2(25)  NOT NULL,
    email_address       VARCHAR2(25)  NOT NULL,
    phone               VARCHAR2(25)  NOT NULL,
    city                VARCHAR2(25),
    street              VARCHAR2(25),
    postal_code         VARCHAR2(25),
    passenger_type      VARCHAR2(25)  NOT NULL,
    
    CONSTRAINT passenger_PK PRIMARY KEY (passenger_id),
    CONSTRAINT check_passenger_type CHECK (passenger_type IN ('Gold', 'Silver', 'Normal'))
    CONSTRAINT check_email_uniqueness UNIQUE (email_address)
);


-- reservations

CREATE TABLE reservations ( 
    reservation_id        INT,
    state                 VARCHAR2(25) NOT NULL,
    price                 NUMBER(6,2)  NOT NULL,
    reservation_date      DATE         NOT NULL,
    seat_id               INT          NOT NULL,
    passenger_id          INT          NOT NULL,
    
    CONSTRAINT reservation_PK  PRIMARY KEY (reservation_id),
    CONSTRAINT reservation_FK1 FOREIGN KEY (seat_id)      REFERENCES seats(seat_id),
    CONSTRAINT reservation_FK2 FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    CONSTRAINT check_state  CHECK (state IN ('waiting for approval', 'approved', 'cancelled'))
);


-- discounts

CREATE TABLE discounts ( 
    discount_id         INT,
    discount_percent    NUMBER(5,2)  NOT NULL,
    discount_type       VARCHAR2(25) NOT NULL,
    reservation_id      INT          NOT NULL,
    
    CONSTRAINT discount_PK PRIMARY KEY (discount_id),
    CONSTRAINT discount_FK FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id),
    CONSTRAINT check_discount_type CHECK (discount_type IN ('silver client', 'gold client', '3d reservation', 'happy hours'))
);
