SELECT
    DISTINCT t.TeamName,
    CONCAT(p.FirstName, ' ', p.LastName) AS HeadCoachName,
    tf.Time AS StartTime,
    l.Address,
    s.TypeOfSession AS SessionNature,
    tf.Score,
    cm.FirstName AS PlayerFirstName,
    cm.LastName AS PlayerLastName,
    cm.Role AS PlayerRole
FROM
    TeamFormation tf
JOIN
    Teams t ON tf.TeamType = t.TeamType
JOIN
    Location l ON t.LocationID = l.LocationID
JOIN
    Personnel p ON t.HeadCoach = CONCAT(p.FirstName, ' ', p.LastName)
JOIN
    Sessions s ON s.LocationID = l.LocationID
JOIN
    ClubMemberTeams cmt ON t.TeamID = cmt.TeamID
JOIN
    ClubMembers cm ON cmt.ClubMemberID = cm.ClubMemberID
WHERE
     l.Name = ? /*'Branch E'*/
    AND tf.Date < ? /*'2025-04-04'*/
ORDER BY
    tf.Time ASC;