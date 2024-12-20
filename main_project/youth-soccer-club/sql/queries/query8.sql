SELECT
    sfm.FirstName AS SecondaryFirstName,
    sfm.LastName AS SecondaryLastName,
    sfm.TelephoneNumber AS SecondaryPhoneNumber,
    cm.ClubMembershipNumber,
    cm.FirstName AS ClubMemberFirstName,
    cm.LastName AS ClubMemberLastName,
    cm.DateOfBirth,
    cm.SocialSecurityNumber,
    cm.MedicalCardNumber,
    cm.TelephoneNumber AS ClubMemberPhoneNumber,
    cm.Address,
    cm.City,
    cm.Province,
    cm.PostalCode,
    sfr.Relationship
FROM
    FamilyMember fm
JOIN
    SecondaryFamilyMember sfm ON fm.FamilyMemberID = sfm.FamilyMemberID
JOIN
    SecondaryFamilyRelated sfr ON sfm.SecondaryFamilyMemberID = sfr.SecondaryFamilyMemberID
JOIN
    ClubMembers cm ON sfr.ClubMemberID = cm.ClubMemberID
WHERE
    fm.FamilyMemberID = ? /* 1 OR 2 */;
