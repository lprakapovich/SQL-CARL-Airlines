-- get max id in the passenger table, used to initialize passenger_sequence
CREATE OR REPLACE FUNCTION passenger_max_id
RETURN NUMBER
IS
    v_passenger_number NUMBER := 0;
BEGIN
    SELECT MAX(passenger_id)
    INTO v_passenger_number
    FROM passengers;
RETURN v_passenger_number;
END;



-- number of reservations for a given id, used to check if deletion is allowed
create or replace FUNCTION passenger_reservations_number(
                        p_id IN passengers.passenger_id%TYPE)
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


--3) Calculate total discount for a given reservation.

CREATE OR REPLACE FUNCTION calc_total_discount_percent 
    (p_reservation_id   reservations.reservation_id%TYPE)
RETURN NUMBER
IS 
    v_total_discount    discounts.discount_percent%TYPE;
BEGIN
    SELECT SUM(d.discount_percent)
    INTO v_total_discount
    FROM reservations r
    LEFT JOIN discounts d
    ON r.reservation_id = d.reservation_id
    GROUP BY r.reservation_id
    HAVING r.reservation_id = p_reservation_id;
    
    IF v_total_discount > 0 THEN
        RETURN v_total_discount;
    ELSE
        RETURN 0;
    END IF;
END calc_total_discount_percent;



-- Testing
SELECT reservation_id, calc_total_discount_percent(reservation_id) || '%' AS TOTAL_DISCOUNT
    FROM reservations;


    
--4) Calculate final ticket price for a given reservation, after taking into account all discounts.


CREATE OR REPLACE FUNCTION calc_ticket_price(
    p_reservation_id   reservations.reservation_id%TYPE
    )
RETURN NUMBER
IS
    v_ticket_price      reservations.price%TYPE;
    v_total_discount    discounts.discount_percent%TYPE; 
BEGIN
    SELECT price
    INTO v_ticket_price
    FROM reservations 
    WHERE reservation_id = p_reservation_id;
    
    v_total_discount := calc_total_discount_percent(p_reservation_id);
    
    RETURN ROUND(v_ticket_price * (100 - v_total_discount) / 100, 2);  
    
END calc_ticket_price;


-- Testing
SELECT reservation_id, price, calc_total_discount_percent(reservation_id) || '%' AS TOTAL_DISCOUNT, calc_ticket_price(reservation_id) AS TICKET_PRICE
    FROM reservations;



--5) Checking if a given passenger is a gold client

CREATE OR REPLACE FUNCTION check_if_gold_client
    (p_passenger_id passengers.passenger_id%TYPE)
RETURN BOOLEAN
IS
    v_type    passengers.passenger_type%TYPE;
BEGIN
    SELECT passenger_type
    INTO v_type
    FROM passengers
    WHERE passenger_id = p_passenger_id;
    
    IF (v_type = 'Gold') THEN
        RETURN TRUE;
    ELSE 
        RETURN FALSE;
    END IF;
END check_if_gold_client;



--6) Checking if a given passenger is a silver client

CREATE OR REPLACE FUNCTION check_if_silver_client
    (p_passenger_id passengers.passenger_id%TYPE)
RETURN BOOLEAN
IS
    v_type    passengers.passenger_type%TYPE;
BEGIN
    SELECT passenger_type
    INTO v_type
    FROM passengers
    WHERE passenger_id = p_passenger_id;
    
    IF (v_type = 'Silver') THEN
        RETURN TRUE;
    ELSE 
        RETURN FALSE;
    END IF;
END check_if_silver_client;


--7) Function that calculates for a flight the percent of reservations which has a discount admitted

CREATE OR REPLACE FUNCTION discounted_reservations_func(flight flights.flight_id%TYPE)
RETURN NUMBER 
IS      
    CURSOR c_reservations(f flights.flight_id%TYPE) IS
        SELECT * FROM reservations r
        JOIN seats s ON r.seat_id = s.seat_id
        JOIN flights f ON s.flight_id = f.flight_id
        WHERE f.flight_id = f;
        
    CURSOR c_discounts(reservation reservations.reservation_id%TYPE) IS
        SELECT * FROM discounts d
        JOIN reservations r ON r.reservation_id = d.reservation_id
        WHERE r.reservation_id = reservation;
        
    v_reservetion_details    c_reservations%ROWTYPE;
    v_discount_details    c_discounts%ROWTYPE;
    v_discounted_reservations   INT := 0;
    v_total_reservations   INT := 0;
    v_perc  NUMBER;
    v_fl    flights.flight_id%TYPE;
    
BEGIN
    OPEN c_reservations(flight);
        LOOP 
            FETCH c_reservations INTO v_reservetion_details;
            EXIT WHEN c_reservations%NOTFOUND;
            v_total_reservations := v_total_reservations + 1;
            OPEN c_discounts(v_reservetion_details.reservation_id);
                LOOP
                    FETCH c_discounts INTO v_discount_details;
                    EXIT WHEN c_discounts%NOTFOUND;
                    v_discounted_reservations := v_discounted_reservations + 1;
                END LOOP;
            CLOSE c_discounts;
        END LOOP;
    CLOSE c_reservations;
    
    IF v_total_reservations = 0 THEN 
        v_perc := 0;
    ELSE 
        v_perc := ROUND((v_discounted_reservations / v_total_reservations * 100), 2); 
    END IF;
    
    RETURN v_perc;
END;

DECLARE
    v_p NUMBER;
    v_f flights.flight_id%TYPE;
BEGIN
    v_f := 10;
    v_p := discounted_reservations_func(v_f);
    dbms_output.put_line('Flight: ' || v_f || ' has: ' || v_p || '% discounted reservations');
END;
