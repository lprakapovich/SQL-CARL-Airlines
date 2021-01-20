
--1) create new user with password oracle

CREATE USER airlines IDENTIFIED BY oracle 
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP
    PROFILE DEFAULT;
    

--2) check if success

SELECT username, account_status FROM dba_users
    WHERE username = 'AIRLINES';
    
    
--3) grant permissions

GRANT EXECUTE_CATALOG_ROLE to airlines;
GRANT SELECT_CATALOG_ROLE to airlines;
GRANT CREATE MATERIALIZED VIEW to airlines;
GRANT ALTER ANY TABLE to airlines;
GRANT CREATE ANY TABLE to airlines;
GRANT RESUMABLE to airlines;
GRANT CREATE TABLE to airlines;
GRANT ALTER SESSION to airlines;
GRANT CREATE SESSION to airlines;
GRANT QUERY REWRITE to airlines;
GRANT CREATE ANY DIRECTORY to airlines;
GRANT CREATE SYNONYM to airlines;
GRANT CREATE DIMENSION to airlines;
GRANT CREATE TRIGGER to airlines;
GRANT CREATE TYPE to airlines;
GRANT CREATE SEQUENCE to airlines;
GRANT SELECT ANY TABLE to airlines;
GRANT LOCK ANY TABLE to airlines;
GRANT CREATE PROCEDURE to airlines;
GRANT CREATE VIEW to airlines;
GRANT DROP ANY TABLE to airlines;
GRANT ALTER USER to airlines;
grant execute on DBMS_SCHEDULER to AIRLINES;
grant create job to AIRLINES;


--4) additional settings

ALTER USER airlines DEFAULT ROLE EXECUTE_CATALOG_ROLE, SELECT_CATALOG_ROLE;
ALTER USER airlines QUOTA UNLIMITED ON USERS;

