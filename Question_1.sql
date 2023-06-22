USE team2_database;

DROP TRIGGER update_individual;
DROP TRIGGER update_individual_address;
DROP TABLE update_individual_log;
DROP TABLE update_individual_address_log;

CREATE TABLE update_individual_log(
	Individual_ID int(11),
    updated_field CHAR(20),
    old_value CHAR(50),
    new_value CHAR(50), 
    update_time TIMESTAMP NOT NULL,
    PRIMARY KEY(update_time)
);

CREATE TABLE update_individual_address_log(
	Account_ID int(11),
    updated_field CHAR(20),
    old_value VARCHAR(255),
    new_value VARCHAR(255), 
    update_time TIMESTAMP NOT NULL,
    PRIMARY KEY(update_time)
);

delimiter $
CREATE TRIGGER update_individual
BEFORE UPDATE ON individual
FOR EACH ROW 
BEGIN
	# Logs any name change
	IF (old.First_Name <> new.First_Name OR old.Last_Name <> new.Last_Name) THEN
		INSERT INTO update_individual_log VALUES(old.Individual_ID, 'Name change', CONCAT(old.First_Name, ' ', old.Last_Name), CONCAT(new.First_Name, ' ', new.Last_Name), CURRENT_TIMESTAMP);
	# Logs phone number change
    ELSEIF (old.Phone_Num <> new.Phone_Num) THEN
		INSERT INTO update_individual_log VALUES(old.Individual_ID, 'Phone number change', old.Phone_Num, new.Phone_Num, CURRENT_TIMESTAMP);
	# Logs email change
	ELSEIF (old.Email <> new.Email) THEN
		INSERT INTO update_individual_log VALUES(old.Individual_ID, 'Email change', old.Email, new.Email, CURRENT_TIMESTAMP);
	END IF;
    # 
END; $

delimiter $
CREATE TRIGGER update_individual_address
BEFORE UPDATE ON account
FOR EACH ROW 
BEGIN
	# Logs any change to address
	IF (old.Addr_1 <> new.Addr_1 OR old.Addr_2 <> new.Addr_2 OR old.Addr_State <> new.Addr_State OR old.Addr_City <> new.Addr_City OR old.Addr_Zip <> new.Addr_Zip) THEN
		INSERT INTO update_individual_address_log VALUES(old.Account_Num, 'Address change', CONCAT(old.Addr_1, '', IFNULL(CONCAT(' ', old.Addr_2), ''), ', ', old.Addr_City, ', ', old.Addr_State, ', ', old.Addr_Zip),
												  CONCAT(new.Addr_1, ' ', new.Addr_2, ', ', new.Addr_City, ', ', new.Addr_State, ', ', new.Addr_Zip), CURRENT_TIMESTAMP);
	END IF;
    # 
END; $

# Examples for each change in personal information
delimiter ;
UPDATE individual
SET Last_Name = 'Griffin'
WHERE Individual_ID = 4580009;

DO SLEEP(1);

UPDATE individual
SET Phone_Num = '2259330027'
WHERE Individual_ID = 4580331;

DO SLEEP(1);

UPDATE individual
SET Email = 'frannyfran@outlook.com'
WHERE Individual_ID = 4580567;

UPDATE account
SET Addr_1 = '123 Main Street',
	Addr_2 = null,
    Addr_State = 'LA',
    Addr_City = 'New Orleans',
    Addr_Zip = '70123'
WHERE Account_Num = 938000328;