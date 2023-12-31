--Процедура get_info(flight_number_arg), яка надає інформацію (IATA-коди) про пункт відпрвалення, пункт призначення та авіаперевізника, вказаного в аргументі номера рейса.
DROP PROCEDURE IF EXISTS get_info(integer);
CREATE OR REPLACE PROCEDURE get_info(flight_number_arg integer)
LANGUAGE plpgsql
AS $$
   DECLARE record_origin_airport flight_route.origin_airport%TYPE;
   DECLARE record_destination_airport flight_route.destination_airport%TYPE;
   DECLARE record_airline flight_route.airline%TYPE;
BEGIN
SELECT origin_airport, destination_airport, airline into record_origin_airport,record_destination_airport,record_airline
FROM flight_route WHERE flight_number = flight_number_arg;
RAISE INFO 'Origin_airport: %, Destination_airport: %, Airline: %',
TRIM(record_origin_airport), TRIM(record_destination_airport), TRIM(record_airline);
END;
$$;
