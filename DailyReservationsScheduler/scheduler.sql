-- scheduler job to run procedure from daily_reservations_package each day to populate daily_reservations table with results 

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name           =>  'monitor_reservations',
        job_type           =>  'STORED_PROCEDURE',
        job_action         =>  'daily_reservations_package.daily_reservations',
        start_date         =>   SYSTIMESTAMP,
        repeat_interval    =>  'FREQ=DAILY; BYHOUR=23; BYMINUTE=50',
        enabled            =>   TRUE,
        comments           =>  'Job tracking number of reservations and mean income per ticket from a given day');
END;
