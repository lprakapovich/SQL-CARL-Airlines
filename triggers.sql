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



