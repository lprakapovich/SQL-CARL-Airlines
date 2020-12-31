
-- SQL queries


--1) Display all flights to Italy. Sort them in ascending order by flight duration.
   -- (Show flight_id, airport_ids, airport_names, ariport_cities and flight duration.)

SELECT f.flight_id, f.airport_from_id, a1.airport_name AS AIRPORT_FROM_NAME, a1.city AS CITY_AIRPORT_FROM, 
        f.airport_to_id, a2.airport_name AS AIRPORT_TO_NAME, a2.city AS CITY_AIRPORT_TO, f.flight_duration
    FROM flights f
    JOIN airports a1
    ON f.airport_from_id = a1.airport_id
    JOIN airports a2
    ON f.airport_to_id = a2.airport_id
    JOIN countries c
    ON a2.country_id = c.country_id
    WHERE c.country_name = 'Italy'
    ORDER BY f.flight_duration ASC;



--2) Display the number of flights to all countries that are in the database.

SELECT c.country_name, COUNT(f1.flight_id) AS NUM_FLIGHTS_TO
    FROM countries c
    LEFT JOIN airports a
    ON c.country_id = a.country_id
    LEFT JOIN flights f1
    ON a.airport_id = f1.airport_to_id
    GROUP BY c.country_name;



--3) Display the shortest flight.
   -- (Show flight_id, airport_ids, ariport_cities and flight duration.)

SELECT f.flight_id, f.airport_from_id, a1.city AS CITY_FROM, f.airport_to_id, a2.city AS CITY_TO, f.flight_duration AS FLIGHT_DURATION_IN_HOURS
    FROM flights f
    JOIN airports a1
    ON f.airport_from_id = a1.airport_id
    JOIN airports a2
    ON f.airport_to_id = a2.airport_id
    WHERE f.flight_duration = (SELECT MIN(flight_duration) FROM flights);



--4) Display airports from which there are flights to another continent.
   -- (Show airport_id, airport_name and city.)

SELECT DISTINCT a1.airport_id, a1.airport_name, a1.city
    FROM airports a1
    JOIN countries c1
    ON a1.country_id = c1.country_id
    JOIN flights f
    ON a1.airport_id = f.airport_from_id
    WHERE f.airport_to_id IN ( SELECT a2.airport_id 
                                FROM airports a2
                                JOIN countries c2
                                ON a2.country_id = c2.country_id
                                WHERE c2.continent_id <> c1.continent_id );



--5) Display the 5 flights with the earliest departure date.
   -- (Show flight_id, departure_time, arrival_time, airport_from and airport_to.)

SELECT flight_id, departure_time, arrival_time, airport_from_id, airport_to_id
    FROM flights
    WHERE ROWNUM < 6   
    ORDER BY departure_time;



--6) Display the number of available seats on the plane for any flight to Paris.
  -- (Show flight_id, airport_id, airport_cities and number of available seats.)

SELECT f.flight_id, f.airport_from_id, a1.city AS CITY_FROM, f.airport_to_id, a2.city AS CITY_TO, COUNT(s.seat_id) AS NUM_AVAILABLE_SEATS
    FROM flights f
    JOIN seats s
    ON f.flight_id = s.flight_id
    JOIN airports a1
    ON f.airport_from_id = a1.airport_id
    JOIN airports a2
    ON f.airport_to_id = a2.airport_id
    WHERE  s.availability = 'available'
    GROUP BY f.flight_id, f.airport_from_id, a1.city, f.airport_to_id, a2.city
    HAVING f.airport_to_id IN ( SELECT a.airport_id 
                                    FROM airports a
                                    WHERE country_id = 'US' );
                                

-- 7) Display all available seats ( first class or business class) for a flight from Rome to London.
  -- (Show seat_id, status, and class.)

SELECT s.seat_id, s.availability, s.seat_class
FROM flights f
JOIN seats s
ON f.flight_id = s.flight_id
WHERE f.airport_from_id = 'FOC' AND f.airport_to_id = 'LHR' 
    AND s.seat_class IN ('first class', 'business class')
    AND s.availability = 'available';



-- 8) Calculate the amount of money obtained from the sale of airline tickets of economy class
	 (required reservation status - approved).

SELECT SUM(r.price) AS SUM_TICKET_PRICES
    FROM reservations r
    JOIN seats s
    ON r.seat_id = s.seat_id
    WHERE r.state = 'approved' 
    AND s.seat_class = 'economy class';
    
    

-- 9) Calculate the average cost of airline tickets for flights in which a distance between the airports is within the range 5 000 km and 15 000 km between.

SELECT '$' || ROUND(AVG(r.price), 2) AS AVG_TICKET_PRICE
    FROM reservations r
    JOIN seats s
    ON r.seat_id = s.seat_id
    JOIN flights f
    ON s.flight_id = f.flight_id
    WHERE f.distance BETWEEN 5000 AND 15000;
