--Функція, яка видаляє із таблиці Flight_route рейси, які відправлялися та прибували у будь-який аеропорт штату Аляска (AK)

DROP FUNCTION IF EXISTS delete_flight_routes();
CREATE OR REPLACE FUNCTION delete_flight_routes() RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
   DELETE FROM Flight_Route
   WHERE Origin_Airport IN
     (SELECT Airport_id FROM Airport WHERE state='AK')
	 OR Destination_Airport IN 
	 (SELECT Airport_id FROM Airport WHERE state='AK');
END;
$$;