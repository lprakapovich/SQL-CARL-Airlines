CREATE OR REPLACE PROCEDURE create_passenger_sequence
IS
    v_max_id NUMBER := 0;
BEGIN
    v_max_id := passenger_max_id;
    EXECUTE IMMEDIATE 'CREATE SEQUENCE passenger_sequence START WITH ' || v_max_id || 'increment by 1';
END;
