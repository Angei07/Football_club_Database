SELECT
    cm.ClubMembershipNumber AS club_membership_number,
    cm.FirstName AS first_name,
    cm.LastName AS last_name,
    YEAR(CURDATE()) - YEAR(cm.DateOfBirth) AS age,
    cm.TelephoneNumber AS phone_number,
    fm.EmailAddress AS email,
    l.Name AS location_name
FROM ClubMembers cm
JOIN ClubMemberLocations cml ON cm.ClubMemberID = cml.ClubMemberID
JOIN Location l ON cml.LocationID = l.LocationID
JOIN ClubMemberTeams cmt ON cm.ClubMemberID = cmt.ClubMemberID
JOIN TeamFormation tf ON cmt.TeamID = tf.TeamFormationID
JOIN FamilyRelated fr ON cm.ClubMemberID = fr.ClubMemberID
JOIN FamilyMember fm ON fr.FamilyMemberID = fm.FamilyMemberID
JOIN Sessions s ON tf.TeamFormationID = s.SessionID
WHERE cm.Status = 'Active'
    AND s.TypeOfSession = 'game'
    AND NOT EXISTS (
        SELECT 1
        FROM TeamFormation tf2
        JOIN Sessions s2 ON tf2.TeamFormationID = s2.SessionID
        WHERE tf2.TeamFormationID <> tf.TeamFormationID
          AND tf2.Score > tf.Score
          AND s2.SessionID = s.SessionID
    )
GROUP BY cm.ClubMembershipNumber, cm.FirstName, cm.LastName, cm.DateOfBirth, cm.TelephoneNumber, fm.EmailAddress, l.Name
HAVING COUNT(s.SessionID) > 0
ORDER BY l.Name ASC, cm.ClubMembershipNumber ASC;
