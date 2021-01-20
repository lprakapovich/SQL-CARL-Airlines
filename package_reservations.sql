
-- package


CREATE OR REPLACE PACKAGE reservations_pkg IS

    PROCEDURE add_reservation(p_status reservations.state%TYPE, p_price reservations.price%TYPE, 
        p_date reservations.reservation_date%TYPE, p_seat reservations.seat_id%TYPE, p_passenger reservations.passenger_id%TYPE); 

END reservations_pkg;


CREATE OR REPLACE PACKAGE BODY reservations_pkg IS 

    PROCEDURE add_reservation(p_status reservations.state%TYPE, p_price reservations.price%TYPE, 
        p_date reservations.reservation_date%TYPE, p_seat reservations.seat_id%TYPE, p_passenger reservations.passenger_id%TYPE) 
    IS
        v_passenger               reservations.passenger_id%TYPE;
        v_seat_availability       seats.availability%TYPE;
        v_id                      reservations.reservation_id%TYPE;
        seat_reserved_exception   EXCEPTION;
    BEGIN
      
        SELECT passenger_id INTO v_passenger
        FROM passengers
        WHERE passenger_id = p_passenger;
        
        SELECT availability INTO v_seat_availability
        FROM seats
        WHERE seat_id = p_seat;
        
        SELECT reservation_id INTO v_id
        FROM reservations
        WHERE reservation_id = ( SELECT MAX(reservation_id) FROM reservations );
        
        v_id := v_id + 1;

        IF (v_seat_availability = 'available') THEN
            INSERT INTO reservations VALUES (v_id, p_status, p_price, p_date, p_seat, p_passenger);
            DBMS_OUTPUT.PUT_LINE('inserted: ' || SQL%ROWCOUNT || ' row');
        ELSE 
            RAISE seat_reserved_exception;
        END IF;      
        
        EXCEPTION 
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('No such passenger or seat ID!');
            WHEN seat_reserved_exception THEN
                DBMS_OUTPUT.PUT_LINE('This seat is already reserved!');  
     
    END add_reservation;
END;

SET SERVEROUTPUT ON;



-- tests for add_reservation method

-- an exception is thrown because the seat is reserved by other passenger
EXECUTE reservations_pkg.add_reservation('approved', 155.0, TO_DATE('03/12/2020', 'DD/MM/YYYY'), 5, 5);

-- an exception is thrown because the passenger with id equal to 150 does not exist
EXECUTE reservations_pkg.add_reservation('approved', 155.0, TO_DATE('03/12/2020', 'DD/MM/YYYY'), 5, 105);

-- everything works
EXECUTE reservations_pkg.add_reservation('approved', 155.0, TO_DATE('03/12/2020', 'DD/MM/YYYY'), 3, 1);




- triggers for reservations

CREATE OR REPLACE TRIGGER update_seat_status_trg
AFTER INSERT ON reservations
FOR EACH ROW
DECLARE

BEGIN
    IF (:NEW.state = 'approved' OR :NEW.state = 'waiting for approval') THEN
        UPDATE seats
        SET availability = 'reserved'
        WHERE seat_id = :NEW.seat_id;
    ELSIF (:NEW.state = 'cancelled') THEN
        UPDATE seats
        SET availability = 'reserved'
        WHERE seat_id = :NEW.seat_id;
    END IF;
END;
