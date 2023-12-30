--Виклик функції та перевірка таблиць
SELECT delete_flight_routes();

SELECT * FROM flight_route;
--Виклик процедури
CALL get_info(2336);

--Виклик тригера
INSERT INTO Airline(Airline_id, Airline_name) VALUES('VV','Viktor Vavrovskiy Inc.');
SELECT * FROM Airline;
SELECT * FROM Airline_audit;

UPDATE Airline SET Airline_name = 'Vavrovskiy Viktor Inc.' WHERE Airline_id = 'VV';
SELECT * FROM Airline;
SELECT * FROM Airline_audit;

DELETE FROM Airline WHERE Airline_id = 'VV';
SELECT * FROM Airline;
SELECT * FROM Airline_audit;
