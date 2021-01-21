CREATE OR REPLACE TRIGGER make_airport_closed_trg 
AFTER UPDATE OF action ON airports
FOR EACH ROW
WHEN (NEW.action = 'closed')
DECLARE
    v_reservation reservations.reservation_id%TYPE;
BEGIN
    FOR reservation_record IN (SELECT reservation_id 
        FROM reservations r 
        JOIN seats s ON r.seat_id = s.seat_id
        JOIN flights f ON s.flight_id = f.flight_id
        WHERE f.airport_to_id = :NEW.airport_id OR f.airport_from_id = :NEW.airport_id)
    LOOP
        UPDATE reservations
        SET state = 'cancelled'
        WHERE reservation_id = reservation_record.reservation_id;
    END LOOP;

    UPDATE flights
    SET departure_time = null 
    WHERE airport_to_id = :NEW.airport_id OR airport_from_id = :NEW.airport_id;

    UPDATE flights
    SET arrival_time = NULL 
    WHERE airport_to_id = :NEW.airport_id OR airport_from_id = :NEW.airport_id;
   
END;