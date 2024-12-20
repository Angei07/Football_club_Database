CREATE TRIGGER Prevent_Duplicate_SSN_MCN
BEFORE INSERT ON Personnel
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM Personnel WHERE SocialSecurityNumber = NEW.SocialSecurityNumber) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate Social Security Number';
    END IF;
    IF (SELECT COUNT(*) FROM Personnel WHERE MedicalCardNumber = NEW.MedicalCardNumber) > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate Medicare Card Number';
    END IF;
END;