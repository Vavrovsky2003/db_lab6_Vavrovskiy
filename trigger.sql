--Тригер, який відслідковує модифікацію таблиці Airline та створює окрему таблицю Airline_audit, в якій відображається, яка саме була здійснена операція (INSERT, UPDATE чи DELETE), яким користувачем, та записує час, коли відбулася дана операція
DROP TABLE IF EXISTS Airline_audit;
CREATE TABLE Airline_audit(
	id SERIAL PRIMARY KEY,
	updated TIMESTAMP,
	user_name varchar(50) NOT NULL,
	operation varchar(10) NOT NULL
);

CREATE OR REPLACE FUNCTION table_Airline_audit_insert() RETURNS trigger
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO Airline_audit(updated, user_name, operation)
		VALUES(NOW(), user, 'INSERT');
	RETURN NULL;
END
$$ ;

CREATE TRIGGER Airline_insert_details
AFTER INSERT ON Airline
FOR EACH ROW EXECUTE FUNCTION table_Airline_audit_insert();





CREATE OR REPLACE FUNCTION table_Airline_audit_update() RETURNS trigger
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO Airline_audit(updated, user_name, operation)
		VALUES(NOW(), user, 'UPDATE');
	RETURN NULL;
END
$$ ;

CREATE TRIGGER Airline_update_details
AFTER UPDATE ON Airline
FOR EACH ROW EXECUTE FUNCTION table_Airline_audit_update();




CREATE OR REPLACE FUNCTION table_Airline_audit_delete() RETURNS trigger
LANGUAGE 'plpgsql'
AS $$
BEGIN
	INSERT INTO Airline_audit(updated, user_name, operation)
		VALUES(NOW(), user, 'DELETE');
	RETURN NULL;
END
$$ ;


CREATE TRIGGER Airline_delete_details
AFTER DELETE ON Airline
FOR EACH ROW EXECUTE FUNCTION table_Airline_audit_delete();











