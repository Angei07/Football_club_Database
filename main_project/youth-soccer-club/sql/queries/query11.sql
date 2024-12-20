SELECT
    l.Name AS location_name,
    COUNT(CASE WHEN s.TypeOfSession = 'Training' THEN 1 END) AS total_training_sessions,
    SUM(CASE WHEN s.TypeOfSession = 'Training' THEN tf.total_players ELSE 0 END) AS total_training_players,
    COUNT(CASE WHEN s.TypeOfSession = 'Game' THEN 1 END) AS total_game_sessions,
    SUM(CASE WHEN s.TypeOfSession = 'Game' THEN tf.total_players ELSE 0 END) AS total_game_players
FROM Location l
JOIN Sessions s ON l.LocationID = s.LocationID
LEFT JOIN (
    SELECT
        tf.TeamFormationID AS session_id,
        COUNT(cmt.ClubMemberID) AS total_players
    FROM TeamFormation tf
    LEFT JOIN ClubMemberTeams cmt ON tf.TeamFormationID = cmt.TeamID
    WHERE tf.Date BETWEEN '2024-01-01' AND '2024-03-31'
    GROUP BY tf.TeamFormationID
) tf ON s.SessionID = tf.session_id
GROUP BY l.Name
HAVING COUNT(CASE WHEN s.TypeOfSession = 'Game' THEN 1 END) >= 3
ORDER BY total_game_sessions DESC;
