-- 1. trigger for checking if the new passenger email is unique

CREATE OR REPLACE PROCEDURE check_email(email passengers.email_address%TYPE) 
IS
v_email INT;
BEGIN
    SELECT COUNT(*) INTO v_email
    FROM passengers
    WHERE email_address = email;
    
    IF v_email = 1 THEN
        RAISE_APPLICATION_ERROR(-20500, 'E-mail address ' || email || ' already exists in the database.');
    END IF;
END;

CREATE OR REPLACE TRIGGER check_pass_email_trig
BEFORE INSERT OR UPDATE ON passengers FOR EACH ROW
BEGIN
    check_email(:NEW.email_address);
END;


INSERT INTO passengers VALUES
    (100, 'Steven', 'King', 'sking@co.uk', '515-123-456', 'London', '', '', 'Gold');
    
SELECT * FROM passengers;



--2) 

CREATE OR REPLACE TRIGGER check_reservations_num_trig
AFTER INSERT  
ON reservations 
FOR EACH ROW
DECLARE
    v_reservations_num  NUMBER  :=0;
    v_discount_id       discounts.discount_id%TYPE;
BEGIN
    v_reservations_num := passenger_reservations_number(:NEW.passenger_id);
    
    SELECT discount_id
    INTO v_discount_id 
    FROM discounts d1
    WHERE d1.discount_id = (SELECT MAX(d2.discount_id) FROM discounts d2);
    
    v_discount_id := v_discount_id + 1;
    
    IF MOD(v_reservations_num, 3) = 0 THEN
        INSERT INTO discounts VALUES (v_discount_id, 3, '3rd reservations', :NEW.reservation_id);
        v_discount_id := v_discount_id + 1;
    END IF;
    
    IF TO_CHAR(:NEW.reservation_date, 'HH24') BETWEEN '15' AND '17' THEN
        INSERT INTO discounts VALUES (v_discount_id, 1, 'happy hours', :NEW.reservation_id);
         v_discount_id := v_discount_id + 1;    
    END IF;
    
    IF check_if_gold_client(:NEW.passenger_id) THEN
        INSERT INTO discounts VALUES (v_discount_id, 10, 'gold discount', :NEW.reservation_id);
         v_discount_id := v_discount_id + 1;
    END IF;
    
    IF check_if_silver_client(:NEW.passenger_id) THEN
        INSERT INTO discounts VALUES (v_discount_id, 5, 'silver discount', :NEW.reservation_id);
         v_discount_id := v_discount_id + 1;
    END IF;
END;

EXECUTE add_reservation('approved', 155.0, TO_DATE('03/12/2020', 'DD/MM/YYYY'), TO_DATE('05/12/2020', 'DD/MM/YYYY'), '10.2', 1);