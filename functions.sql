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
