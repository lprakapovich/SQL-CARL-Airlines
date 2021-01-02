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


--
