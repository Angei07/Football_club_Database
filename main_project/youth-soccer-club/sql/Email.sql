SELECT CONCAT(CM.FirstName, ' ', CM.LastName) as ClubMemberName,
       CM.Role                                as ClubMemberRole,
       CONCAT(FM.FirstName, ' ', FM.LastName) as FamilyMemberName,
       FM.LastName,
       FM.EmailAddress                        as FamilyMemberEmail,
       S.ScheduledDate,
       S.TypeOfSession,
       CONCAT(P.FirstName, ' ', P.LastName)   as HeadCoachName,
       P.EmailAddress                         as HeadCoachEmail,
       L.LocationID                           as LocationIDSender,
       L.Address
FROM FamilyMember FM
         JOIN FamilyRelated FR ON FM.FamilyMemberID = FR.FamilyMemberID
         JOIN ClubMembers CM ON FR.ClubMemberID = CM.ClubMemberID
         JOIN Location L ON FM.LocationID = L.LocationID
         JOIN Sessions S ON L.LocationID = S.LocationID
         JOIN Personnel P ON S.HeadCoachPersonnelID = P.PersonnelID
WHERE S.ScheduledDate >= '2024-08-04'
  AND S.ScheduledDate <= '2024-08-04' + INTERVAL (7) DAY;

-- replace '2024-08-04' with CURDATE() in the script when it runs every Sunday
