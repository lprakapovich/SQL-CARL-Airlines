CREATE OR REPLACE PACKAGE passengers_package IS
    procedure add_passenger(
        firstname   passengers.first_name%TYPE,
        lastname    passengers.last_name%TYPE,
        email       passengers.email_address%TYPE,
        phone       passengers.phone%TYPE,
        city        passengers.city%TYPE := null,
        street      passengers.street%TYPE  := null,
        postalcode  passengers.postal_code%TYPE := null);

    procedure display_passengers_by_type_and_city(
        p_passenger_type        passengers.passenger_type%TYPE,
        p_passenger_city        passengers.city%TYPE
    );

    procedure display_passsengers_by_flight_id(
    p_flight_id flights.flight_id%TYPE);

END;

CREATE OR REPLACE PACKAGE BODY passengers_package IS
v_passenger_number NUMBER := 0;
v_default_type  passengers.passenger_type%TYPE := 'Normal';

    procedure add_passenger(
        firstname   passengers.first_name%TYPE,
        lastname    passengers.last_name%TYPE,
        email       passengers.email_address%TYPE,
        phone       passengers.phone%TYPE,
        city        passengers.city%TYPE := null,
        street      passengers.street%TYPE  := null,
        postalcode  passengers.postal_code%TYPE := null) IS

        BEGIN

         INSERT INTO passengers VALUES
        (passenger_id_sequence.NEXTVAL, firstname, lastname, email, phone, city, street, postalcode, 'Normal');

        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
            dbms_output.put_line('Such email is already registered');
        END;




    procedure display_passengers_by_type_and_city(
        p_passenger_type        passengers.passenger_type%TYPE,
        p_passenger_city        passengers.city%TYPE)
    IS
        TYPE t_passenger_rec IS TABLE OF passengers%ROWTYPE
        INDEX BY BINARY_INTEGER;
        v_passenger_rec_tab t_passenger_rec;
    BEGIN

    DBMS_OUTPUT.PUT_LINE('---- PASSENGERS LIVING IN ' || p_passenger_city || ' OF TYPE ' || p_passenger_type || ' ----');
        FOR passenger_rec IN (
            SELECT * FROM passengers
            WHERE passenger_type = p_passenger_type
            AND city = p_passenger_city)
        LOOP
            v_passenger_rec_tab(passenger_rec.passenger_id) := passenger_rec;
            DBMS_OUTPUT.PUT_LINE(v_passenger_rec_tab(passenger_rec.passenger_id).first_name || ' ' ||
            v_passenger_rec_tab(passenger_rec.passenger_id).last_name);
        END LOOP;

        IF v_passenger_rec_tab.COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Passenger not found');
        END IF;
    END;


    procedure display_passsengers_by_flight_id(
    p_flight_id flights.flight_id%TYPE) IS

    TYPE t_passenger_rec IS TABLE OF passengers%ROWTYPE
        INDEX BY BINARY_INTEGER;
        v_passenger_rec_tab t_passenger_rec;
    BEGIN
         FOR passenger_rec IN (
            SELECT p.* FROM passengers p
            JOIN reservations r ON p.passenger_id = r.passenger_id
            JOIN seats s ON s.seat_id = r.seat_id
            JOIN flights f ON f.flight_id = s.flight_id
            WHERE f.flight_id = p_flight_id)

        LOOP
            v_passenger_rec_tab(passenger_rec.passenger_id) := passenger_rec;
            DBMS_OUTPUT.PUT_LINE(v_passenger_rec_tab(passenger_rec.passenger_id).first_name || ' ' ||
            v_passenger_rec_tab(passenger_rec.passenger_id).last_name);
        END LOOP;

        IF v_passenger_rec_tab.COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Passengers not found');
        END IF;
    END;
END;
