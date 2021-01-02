
-- 1. procedure for adding a new reservation

CREATE OR REPLACE PROCEDURE add_reservation (
    s reservations.state%TYPE, p reservations.price%TYPE, r_date reservations.reservation_date%TYPE,r_due_date reservations.reservation_due_date%TYPE, 
        seat reservations.seat_id%TYPE, passenger reservations.passenger_id%TYPE) 
IS
PARENT_NOT_FOUND EXCEPTION;
PRAGMA EXCEPTION_INIT(PARENT_NOT_FOUND, -2291);
v_p     reservations.passenger_id%TYPE;
v_s     reservations.seat_id%TYPE;
v_id    reservations.reservation_id%TYPE;
BEGIN
    SELECT passenger_id INTO v_p
    FROM passengers
    WHERE passenger_id = passenger;
    
    SELECT seat_id INTO v_s
    FROM seats
    WHERE seat_id = seat;
    
    SELECT reservation_id INTO v_id
    FROM reservations
    WHERE reservation_id = ( SELECT MAX(reservation_id) FROM reservations );
    
    v_id := v_id + 1;
    
    INSERT INTO reservations VALUES
        (v_id, s, p, r_date, r_due_date, seat, passenger);
    dbms_output.put_line('inserted: ' || SQL%ROWCOUNT || ' row');
    
    EXCEPTION 
        WHEN NO_DATA_FOUND OR PARENT_NOT_FOUND THEN
        dbms_output.put_line('No such passenger or seat ID!');

END add_reservation;

EXECUTE add_reservation('approved', 155.0, TO_DATE('03/12/2020', 'DD/MM/YYYY'), TO_DATE('05/12/2020', 'DD/MM/YYYY'), '15.2', 150);
EXECUTE add_reservation('approved', 155.0, TO_DATE('03/12/2020', 'DD/MM/YYYY'), TO_DATE('05/12/2020', 'DD/MM/YYYY'), '21.2', 1);


-- 2. adding a new passenger

CREATE OR REPLACE PROCEDURE add_passenger(
    firstname   passengers.first_name%TYPE,
    lastname    passengers.last_name%TYPE,
    email       passengers.email_address%TYPE,
    phone       passengers.phone%TYPE,
    city        passengers.city%TYPE default null,
    street      passengers.street%TYPE  default null,
    postalcode  passengers.postal_code%TYPE default null)
IS
    v_default_type  passengers.passenger_type%TYPE := 'Normal';

BEGIN

    INSERT INTO passengers VALUES
    (passenger_sequence.NEXTVAL, firstname, lastname, email, phone, city, street, postalcode, v_default_type);
    dbms_output.put_line('inserted: ' || SQL%ROWCOUNT || ' row');

    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
        dbms_output.put_line('Such email is already registered');

END add_passenger;


-- 3. deleting an existing passenger

CREATE OR REPLACE PROCEDURE delete_passenger(p_id passengers.passenger_id%TYPE)
IS
    v_passenger passengers%ROWTYPE;
    v_reservations_number NUMBER := 0;
    deletion_not_allowed EXCEPTION;
BEGIN
    SELECT * INTO v_passenger
    FROM passengers
    WHERE passenger_id = p_id;

    v_reservations_number := passenger_reservations_number(p_id);

    IF (v_reservations_number > 0)
        THEN RAISE deletion_not_allowed;
    ELSE
        DELETE FROM passengers
        WHERE passenger_id = p_id;
        dbms_output.put_line('Deleted a passenger with id ' || p_id);
    END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN dbms_output.put_line('Invalid passenger id');
        WHEN deletion_not_allowed THEN dbms_output.put_line('Not allowed: a passenger has active reservation(s)');
END delete_passenger;


-- 4. update passenger type

CREATE OR REPLACE PROCEDURE update_passenger_type(
        p_new_type passengers.passenger_type%TYPE,
        p_id       passengers.passenger_id%TYPE)
IS
BEGIN
    UPDATE passengers
    SET passenger_type = p_new_type
    WHERE passenger_id = p_id;

    IF SQL%NOTFOUND THEN RAISE NO_DATA_FOUND;
    END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN dbms_output.put_line('Invalid passenger id');
END update_passenger_type;


-- 5.

create or replace PROCEDURE update_reservation_state(
        p_new_state reservations.state%TYPE,
        p_id        reservations.reservation_id%TYPE)
IS
BEGIN

    UPDATE reservations
    SET state = p_new_state
    WHERE reservation_id = p_id;

    IF SQL%NOTFOUND THEN RAISE NO_DATA_FOUND;
    ELSE dbms_output.put_line('Set reservation nr '|| p_id ||' to ' || p_new_state );
    END IF;

    EXCEPTION
        WHEN NO_DATA_FOUND
        THEN dbms_output.put_line('Such reservation id does not exists');
END;