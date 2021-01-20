CREATE SEQUENCE discount_id_sequence
    INCREMENT BY 1
    START WITH 11;
    
CREATE SEQUENCE flight_id_sequence
    INCREMENT BY 1
    START WITH 21;

CREATE SEQUENCE passenger_id_sequence
    INCREMENT BY 1
    START WITH 10;
    
CREATE SEQUENCE seat_id_sequence
    INCREMENT BY 1
    START WITH 65;

CREATE SEQUENCE reservation_id_sequence
    INCREMENT BY 1
    START WITH 17;

--sequence for the scheduler
CREATE SEQUENCE daily_reservations_sequence
    INCREMENT BY 1
    START WITH 1;