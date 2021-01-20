
---- package for reservations



CREATE OR REPLACE PACKAGE reservations_pkg IS

    PROCEDURE add_reservation(p_status reservations.state%TYPE, p_price reservations.price%TYPE, 
        p_date reservations.reservation_date%TYPE, p_seat reservations.seat_id%TYPE, p_passenger reservations.passenger_id%TYPE); 
        
    PROCEDURE generate_discounts(p_reservation_id reservations.reservation_id%TYPE, p_passenger reservations.passenger_id%TYPE);
    
    FUNCTION passenger_reservations_number(p_id IN passengers.passenger_id%TYPE) RETURN NUMBER;

END reservations_pkg;


CREATE OR REPLACE PACKAGE BODY reservations_pkg IS 

    PROCEDURE add_reservation(p_status reservations.state%TYPE, p_price reservations.price%TYPE, 
        p_date reservations.reservation_date%TYPE, p_seat reservations.seat_id%TYPE, p_passenger reservations.passenger_id%TYPE) 
    IS
        v_passenger               reservations.passenger_id%TYPE;
        v_seat_availability       seats.availability%TYPE;
        seat_reserved_exception   EXCEPTION;
    BEGIN
      
        SELECT passenger_id INTO v_passenger
        FROM passengers
        WHERE passenger_id = p_passenger;
        
        SELECT availability INTO v_seat_availability
        FROM seats
        WHERE seat_id = p_seat;
        
        IF (v_seat_availability = 'available') THEN
            INSERT INTO reservations VALUES (reservation_id_sequence.NEXTVAL, p_status, p_price, p_date, p_seat, p_passenger);
            generate_discounts(reservation_id_sequence.CURRVAL, p_passenger);
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
    
    ----------------------------------------------------------------------------------------------------------------------------
    
    FUNCTION passenger_reservations_number(p_id IN passengers.passenger_id%TYPE)
    RETURN NUMBER
    IS
        v_reservations_number NUMBER := 0;
    BEGIN
        SELECT COUNT (*)
        INTO v_reservations_number
        FROM reservations r
        WHERE r.passenger_id = p_id;
    RETURN v_reservations_number;
    END;
    
    ----------------------------------------------------------------------------------------------------------------------------
    
    PROCEDURE generate_discounts(p_reservation_id reservations.reservation_id%TYPE, p_passenger reservations.passenger_id%TYPE)
    IS 
        v_reservations_num  NUMBER  :=0;
        v_discount_id       discounts.discount_id%TYPE;
        v_date              reservations.reservation_date%TYPE;
        v_client_type       passengers.passenger_type%TYPE;
    
    BEGIN
        v_reservations_num := passenger_reservations_number(p_passenger);
        
        SELECT reservation_date INTO v_date 
        FROM reservations
        WHERE reservation_id = p_reservation_id;
        
        SELECT passenger_type INTO v_client_type 
        FROM passengers
        WHERE passenger_id = p_passenger;
        
        IF MOD(v_reservations_num, 3) = 0 THEN
            INSERT INTO discounts VALUES (discount_id_sequence.NEXTVAL, 3, '3rd reservation', p_reservation_id);
        END IF;
            
        IF TO_CHAR(v_date, 'HH24') BETWEEN '15' AND '17' THEN
            INSERT INTO discounts VALUES (discount_id_sequence.NEXTVAL, 1, 'happy hours', p_reservation_id);   
        END IF;
            
        IF (v_client_type = 'Gold') THEN
            INSERT INTO discounts VALUES (discount_id_sequence.NEXTVAL, 10, 'gold discount', p_reservation_id);
        END IF;
            
        IF (v_client_type = 'Silver') THEN
            INSERT INTO discounts VALUES (discount_id_sequence.NEXTVAL, 5, 'silver discount', p_reservation_id);
        END IF;
    END;

END reservations_pkg;


-- tests for add_reservation method

-- an exception is thrown because the seat is reserved by other passenger
EXECUTE reservations_pkg.add_reservation('approved', 155.0, TO_DATE('03/12/2020', 'DD/MM/YYYY'), 5, 5);

-- an exception is thrown because the passenger with id equal to 150 does not exist
EXECUTE reservations_pkg.add_reservation('approved', 155.0, TO_DATE('03/12/2020', 'DD/MM/YYYY'), 5, 105);

-- everything works
EXECUTE reservations_pkg.add_reservation('approved', 155.0, TO_DATE('03/12/2020', 'DD/MM/YYYY'), 3, 1);

-- everything works, discounts are automatically generated based on the type of passenger
EXECUTE reservations_pkg.add_reservation('approved', 155.0, TO_DATE('03/12/2020 15:40:35'), 1, 1);




-- triggers for reservations

CREATE OR REPLACE TRIGGER update_seat_status_trg
AFTER INSERT ON reservations
FOR EACH ROW
DECLARE

BEGIN
    IF (:NEW.state = 'approved') THEN
        UPDATE seats
        SET availability = 'unavailable'
        WHERE seat_id = :NEW.seat_id;
    ELSIF (:NEW.state = 'cancelled') THEN
        UPDATE seats
        SET availability = 'available'
        WHERE seat_id = :NEW.seat_id;
    ELSIF (:NEW.state = 'waiting for approval') THEN
        UPDATE seats
        SET availability = 'reserved'
        WHERE seat_id = :NEW.seat_id;
    END IF;
END;
