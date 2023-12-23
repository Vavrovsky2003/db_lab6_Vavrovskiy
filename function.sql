--Функція, яка видаляє із таблиць Origin_Airport аеропорти, які не відправляли, та із таблиці Destination_Airport аеропорти, які не приймали жоден літак

DROP FUNCTION IF EXISTS delete_airports();
CREATE OR REPLACE FUNCTION delete_airports() RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
   DELETE FROM Origin_Airport
   WHERE iata_code IN
     (SELECT iata_code FROM origin_airport WHERE IATA_code NOT IN(SELECT origin_airport FROM flight_route));
   DELETE FROM Destination_Airport
   WHERE Destination_Airport.iata_code IN
     (SELECT iata_code FROM destination_airport WHERE IATA_code NOT IN(SELECT destination_airport FROM flight_route));
END;
$$;
