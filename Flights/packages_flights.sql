CREATE OR REPLACE PACKAGE flights_pkg IS

	PROCEDURE display_flights_to_country (p_country_name countries.country_name%TYPE);

END flights_pkg;

CREATE OR REPLACE PACKAGE BODY flights_pkg IS 
	PROCEDURE display_flights_to_country (p_country_name countries.country_name%TYPE) 
	IS	
    	CURSOR c_flights (country countries.country_name%TYPE) IS
        SELECT *
        FROM flights f
        JOIN airports a
        ON f.airport_to_id = a.airport_id
        JOIN countries c
        ON a.country_id = c.country_id
        WHERE c.country_name = country;
        
    v_flight_record   c_flights%ROWTYPE;
        
BEGIN
    OPEN c_flights(p_country_name);
        LOOP 
            FETCH c_flights INTO v_flight_record;
            EXIT WHEN c_flights%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('FLIGHT no. ' || v_flight_record.flight_id);
            DBMS_OUTPUT.PUT_LINE('FROM airport ' || v_flight_record.airport_from_id || ', TO aiport ' || v_flight_record.airport_to_id);
            DBMS_OUTPUT.PUT_LINE('');
        END LOOP;
        DBMS_OUTPUT.PUT_LINE(c_flights%ROWCOUNT || ' flights to ' || p_country_name);
    CLOSE c_flights;
END;

END flights_pkg;




-- trigger

CREATE OR REPLACE TRIGGER generate_seats_after_flight_trg
AFTER INSERT ON flights
FOR EACH ROW
DECLARE
    v_iter INT := 1;
BEGIN

    WHILE (v_iter <= :NEW.num_seats)
    LOOP
        INSERT INTO seats (seat_id, num_in_plane, availability, seat_class, flight_id)
        VALUES(seat_id_sequence.NEXTVAL, v_iter, 'available', 'economy class', :NEW.flight_id);
        v_iter := v_iter + 1;
    END LOOP;
END;



CREATE OR REPLACE TRIGGER update_flight_departure_time 
    AFTER UPDATE OF departure_time ON flights 
    FOR EACH ROW 
    DECLARE
    BEGIN 
    
    FOR reservation_record IN (SELECT * FROM reservations r 
        JOIN seats s ON s.seat_id = r.seat_id
        WHERE s.flight_id = (:NEW.flight_id))
    LOOP 
    IF :NEW.departure_time > :OLD.departure_time
    THEN
        UPDATE reservations 
        SET state = 'postponed'
        WHERE reservation_id = reservation_record.reservation_id;
        
        dbms_output.put_line(reservation_record.reservation_id);
        END IF;
    END LOOP;
    END;
    


-- some tests

INSERT INTO flights VALUES(23, 1.25, TO_DATE('24/12/2020 21:30', 'DD/MM/YYYY HH24:MI'),
TO_DATE('24/12/2020 22:45', 'DD/MM/YYYY HH24:MI'), 555, 'MAD', 'LYS', 25);