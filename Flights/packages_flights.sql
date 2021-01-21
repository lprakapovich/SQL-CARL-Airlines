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