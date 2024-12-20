CREATE TRIGGER Auto_Inactivate_Old_ClubMembers
BEFORE UPDATE ON ClubMembers
FOR EACH ROW
BEGIN
    DECLARE age INT;
    SET age = YEAR(CURDATE()) - YEAR(NEW.DateOfBirth);
    IF age < 4 OR age > 10 THEN SET NEW.Status = 'Inactive';
    END IF;
END;