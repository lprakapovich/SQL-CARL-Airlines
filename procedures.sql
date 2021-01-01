
--1) procedure for adding a new reservation

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