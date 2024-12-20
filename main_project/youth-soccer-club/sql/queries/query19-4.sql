CREATE TRIGGER Prevent_Overlapping_TeamFormations
BEFORE INSERT ON TeamFormation
FOR EACH ROW
BEGIN
    DECLARE session_count INT;
    SET session_count = (SELECT COUNT(*)
                         FROM TeamFormation tf
                         WHERE tf.TeamFormationID = NEW.TeamFormationID
                           AND tf.Date = NEW.Date
                           AND ABS(TIMESTAMPDIFF(HOUR, tf.Time, NEW.Time)) < 3);
    IF session_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A player cannot be assigned to two sessions within three hours on the same day';
    END IF;
END;