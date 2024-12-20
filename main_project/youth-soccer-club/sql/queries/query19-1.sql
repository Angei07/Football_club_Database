CREATE TRIGGER Ensure_Age_Constraint
BEFORE INSERT ON ClubMembers
FOR EACH ROW
BEGIN
    DECLARE age INT;
    SET age = YEAR(CURDATE()) - YEAR(NEW.DateOfBirth);
    IF age < 4 OR age > 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Club member must be between 4 and 10 years old';
    END IF;
END;

