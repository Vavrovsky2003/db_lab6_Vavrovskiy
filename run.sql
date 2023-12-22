--Виклик функції та перевірка таблиць
SELECT delete_airports();

SELECT * FROM origin_airport;
SELECT * FROM destination_airport;
--Виклик процедури
CALL get_info(2336);

--Виклик тригера та перевірка таблиць
INSERT INTO Airline(IATA_code, Name)
VALUES('VV','Viktor Vavrovskiy Inc.');
SELECT * FROM Airline;
SELECT * FROM Airline_audit;

UPDATE Airline SET name = 'Vavrovskiy Viktor Inc.' WHERE IATA_code = 'VV';
SELECT * FROM Airline;
SELECT * FROM Airline_audit;

DELETE FROM Airline WHERE IATA_code = 'VV';
SELECT * FROM Airline;
SELECT * FROM Airline_audit;

