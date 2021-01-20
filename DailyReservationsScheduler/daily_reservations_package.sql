CREATE OR REPLACE PACKAGE daily_reservations_package IS
    -- procedure calculating total number of reservations and mean income per ticket from a current day
    PROCEDURE daily_reservations;

END daily_reservations_package;

CREATE OR REPLACE PACKAGE BODY daily_reservations_package IS
    current_time TIMESTAMP := sysdate;
   
    CURSOR c_reservations
    IS
        SELECT *
        FROM reservations
        WHERE EXTRACT(DAY FROM reservation_date) = EXTRACT(DAY FROM current_time);
        
    PROCEDURE daily_reservations
    IS
        total_tickets_sold_price NUMBER := 0;
        total_reservations NUMBER := 0;
        mean_price_daily NUMBER := 0;
        
    BEGIN
        FOR reservation IN c_reservations
        LOOP
            total_tickets_sold_price := total_tickets_sold_price + reservation.price;
            total_reservations := total_reservations + 1;
        END LOOP;
        
        IF total_reservations = 0 THEN
            mean_price_daily := 0;
        ELSE
            mean_price_daily := ROUND((total_tickets_sold_price / total_reservations), 2);
        END IF;
        
        INSERT INTO daily_reservations
        VALUES(daily_reservations_sequence.NEXTVAL, current_time, total_reservations, mean_price_daily);
    END;
END;