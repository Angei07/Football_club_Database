SELECT
   p.FirstName AS first_name,
   p.LastName AS last_name,
   p.TelephoneNumber AS telephone_number,
   p.EmailAddress AS email_address,
   l.Name AS location_name,
   p.Role AS current_role
FROM Personnel p
JOIN PersonnelLocations pl ON p.PersonnelID = pl.PersonnelID
JOIN Location l ON pl.LocationID = l.LocationID
LEFT JOIN FamilyRelated fr ON p.PersonnelID = fr.FamilyMemberID
WHERE p.Mandate = 'Volunteer' AND fr.FamilyMemberID IS NULL
ORDER BY l.Name ASC, p.Role ASC, p.FirstName ASC, p.LastName ASC;
