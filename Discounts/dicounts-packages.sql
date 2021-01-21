
-- package with functions calculatin discounts

CREATE OR REPLACE PACKAGE discounts_pkg IS

	FUNCTION calc_total_discount_percent (p_reservation_id reservations.reservation_id%TYPE)
        RETURN NUMBER;
        
    FUNCTION calc_ticket_price(p_reservation_id   reservations.reservation_id%TYPE)
        RETURN NUMBER;

END discounts_pkg;


CREATE OR REPLACE PACKAGE BODY discounts_pkg IS
    FUNCTION calc_total_discount_percent (p_reservation_id   reservations.reservation_id%TYPE)
        RETURN NUMBER
    IS 
        v_total_discount    discounts.discount_percent%TYPE     := 0.0;
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
        
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20111, 'No such reservation in the database');
    END calc_total_discount_percent;


--------------------------------------------------------------------------------------------------------------

    FUNCTION calc_ticket_price(p_reservation_id   reservations.reservation_id%TYPE)
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
            
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN
                    RAISE_APPLICATION_ERROR(-20111, 'No such reservation in the database');
        END calc_ticket_price;
        
END discounts_pkg;




-- Tests
SELECT reservation_id, discounts_pkg.calc_total_discount_percent(reservation_id) || '%' AS TOTAL_DISCOUNT
    FROM reservations;


SELECT reservation_id, price, discounts_pkg.calc_total_discount_percent(reservation_id) || '%' AS TOTAL_DISCOUNT, 
        discounts_pkg.calc_ticket_price(reservation_id) AS TICKET_PRICE
    FROM reservations;
