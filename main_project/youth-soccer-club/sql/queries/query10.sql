SELECT
   cm.ClubMembershipNumber AS club_membership_number,
   cm.FirstName AS first_name,
   cm.LastName AS last_name
FROM ClubMembers cm
JOIN ClubMemberLocations cml ON cm.ClubMemberID = cml.ClubMemberID
WHERE cm.Status = 'Active' AND DATEDIFF(CURDATE(), cml.StartDate) <= 730 -- 730 days = 2 years
GROUP BY cm.ClubMembershipNumber, cm.FirstName, cm.LastName
HAVING COUNT(DISTINCT cml.LocationID) >= 4
ORDER BY cm.ClubMembershipNumber ASC;