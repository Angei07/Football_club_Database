SELECT
    fm.FirstName AS first_name,
    fm.LastName AS last_name,
    fm.TelephoneNumber AS phone_number
FROM FamilyMember fm
JOIN FamilyRelated fr ON fm.FamilyMemberID = fr.FamilyMemberID
JOIN ClubMembers cm ON fr.ClubMemberID = cm.ClubMemberID
JOIN ClubMemberLocations cml ON cm.ClubMemberID = cml.ClubMemberID
JOIN Teams t ON cml.LocationID = t.LocationID
WHERE cm.Status = 'Active'
    AND t.HeadCoach = fm.FamilyMemberID
    AND cml.LocationID = 1 -- location ID 1
GROUP BY fm.FirstName, fm.LastName, fm.TelephoneNumber
ORDER BY fm.LastName, fm.FirstName;