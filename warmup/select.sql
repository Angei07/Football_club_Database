-- Q1
SELECT Address, City, Province, PostalCode, PhoneNumber, WebAddress, Type, Capacity, (SELECT COUNT(*) FROM ClubMembers WHERE LocationID = Locations.LocationID) AS NumberOfClubMembers
FROM Locations
ORDER BY Province ASC, City ASC;

-- Q2
SELECT fm.FirstName, fm.LastName, (SELECT COUNT(*) FROM ClubMembers WHERE FamilyMemberID = fm.FamilyMemberID AND LocationID = fm.LocationID) AS NumberOfActiveClubMembers
FROM FamilyMembers fm
WHERE fm.LocationID = 2;

-- Q3
SELECT p.FirstName, p.LastName, p.DateOfBirth, p.SocialSecurityNumber, p.MedicareCardNumber, p.TelephoneNumber, p.Address, p.City, p.Province, p.PostalCode, p.EmailAddress, p.Role, p.Mandate
FROM Personnels p
JOIN PersonnelLocations pl ON p.PersonnelID = pl.PersonnelID
WHERE pl.LocationID = 8 
AND (pl.EndDate IS NULL OR pl.EndDate > CURDATE());

-- Q4
SELECT loc.Name AS LocationName, cm.MembershipNumber, cm.FirstName, cm.LastName, cm.DateOfBirth, cm.City, cm.Province
FROM ClubMembers cm
JOIN Locations loc ON cm.LocationID = loc.LocationID
ORDER BY LocationName ASC, cm.DateOfBirth ASC;

-- Q5
SELECT cm.MembershipNumber, cm.FirstName, cm.LastName, cm.DateOfBirth, cm.SocialSecurityNumber, cm.MedicareCardNumber, cm.TelephoneNumber, cm.Address, cm.City, cm.Province, cm.PostalCode, cm.FamilyMemberID
FROM ClubMembers cm
WHERE cm.FamilyMemberID = 4;

-- Q6
SELECT loc.Name AS LocationName, loc.City, loc.Province, fl.StartDate, fl.EndDate
FROM FamilyMembers fm
JOIN FamilyMemberLocations fl ON fm.FamilyMemberID = fl.FamilyMemberID
JOIN Locations loc ON fl.LocationID = loc.LocationID
WHERE fm.FamilyMemberID = 10
ORDER BY fl.StartDate ASC;

-- Q7
SELECT DISTINCT fm.FirstName, fm.LastName, fm.TelephoneNumber
FROM FamilyMembers fm
JOIN ClubMembers cm ON fm.FamilyMemberID = cm.FamilyMemberID
JOIN Personnels p ON p.SocialSecurityNumber = fm.SocialSecurityNumber
WHERE cm.Status = 'Active' AND fm.LocationID = 1;

-- Q8
SELECT cm.ClubMemberID, cm.FirstName, cm.LastName, fl1.LocationID AS FirstLocationID, fl1.StartDate AS FirstLocationStartDate, fl2.LocationID AS SecondLocationID, fl2.StartDate AS SecondLocationStartDate
FROM ClubMembers cm
JOIN FamilyMemberLocations fl1 ON cm.FamilyMemberID = fl1.FamilyMemberID
JOIN FamilyMemberLocations fl2 ON cm.FamilyMemberID = fl2.FamilyMemberID
WHERE fl1.LocationID != fl2.LocationID
ORDER BY cm.FirstName ASC, cm.LastName ASC, fl1.StartDate ASC;

-- C1
SELECT COUNT(*) FROM ClubMemberTeams;

-- C2
SELECT COUNT(*) FROM FamilyMemberLocations;

-- C3
SELECT COUNT(*) FROM PersonnelLocations;