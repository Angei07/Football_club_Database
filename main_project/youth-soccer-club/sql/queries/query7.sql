SELECT DISTINCT
    l.Name AS LocationName,
    l.Address,
    l.City,
    l.Province,
    l.PostalCode,
    l.TelephoneNumber,
    l.WebAddress,
    l.Type,
    l.Capacity,
    CONCAT(p.FirstName, ' ', p.LastName) AS GeneralManager,
    (SELECT COUNT(*)
     FROM ClubMemberLocations cml
     WHERE cml.LocationID = l.LocationID) AS NumberOfClubMembers
FROM
    Location l
     JOIN PersonnelLocations pl on l.LocationID = pl.LocationID
     JOIN Personnel p on pl.PersonnelID = p.PersonnelID
ORDER BY
    l.Province,
    l.City;
