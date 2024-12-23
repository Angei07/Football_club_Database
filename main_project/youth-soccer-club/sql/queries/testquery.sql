SELECT
    cmt.TeamID,
    cm.ClubMemberID,
    cm.ClubMembershipNumber AS club_membership_number,
    cm.FirstName AS first_name,
    cm.LastName AS last_name,
    cm.Role as standard_role,
    cmt.Role as team_role
FROM ClubMembers cm
JOIN ClubMemberTeams cmt ON cm.ClubMemberID = cmt.ClubMemberID
WHERE cm.Status = 'Active' AND cmt.Role IS NOT NULL
ORDER BY cmt.TeamID, cm.FirstName;

