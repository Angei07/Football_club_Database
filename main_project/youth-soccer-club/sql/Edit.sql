UPDATE Location
SET Name = 'Main Office',
    Address = '123 Updated St',
    City = 'New Metropolis',
    Province = 'New State',
    PostalCode = '54321',
    TelephoneNumber = '321-654-0987',
    WebAddress = 'www.mainoffice.com',
    Type = 'Head',
    Capacity = 600
WHERE LocationID = 1;

UPDATE Personnel
SET FirstName = 'Alice Updated',
    LastName = 'Johnson Updated',
    DateOfBirth = '1981-01-01',
    SocialSecurityNumber = '123-45-6780',
    MedicalCardNumber = 'MC42066',
    TelephoneNumber = '555-555-5560',
    Address = '123 Updated Birch St',
    City = 'New Metropolis',
    Province = 'New State',
    PostalCode = '54321',
    EmailAddress = 'alice.updated@domain.com',
    Role = 'GeneralManager',
    Mandate = 'Salaried',
    StartDate = '2021-01-01',
    EndDate = NULL
WHERE PersonnelID = 1;

UPDATE PersonnelLocations
SET EndDate = '2023-12-31'
WHERE PersonnelID = 1 AND LocationID = 1 AND StartDate = '2020-01-01';

-- Update a record in FamilyMember table
UPDATE FamilyMember
SET FirstName = 'George Updated',
    LastName = 'Martin Updated',
    DateOfBirth = '2006-01-01',
    SocialSecurityNumber = '678-90-1235',
    MedicalCardNumber = 'MC67891',
    TelephoneNumber = '555-555-5570',
    Address = '303 Updated Birch St',
    City = 'New Metropolis',
    Province = 'New State',
    PostalCode = '54321',
    EmailAddress = 'george.updated@domain.com',
    LocationID = 2
WHERE FamilyMemberID = 1;

UPDATE SecondaryFamilyMember
SET FirstName = 'Laura Updated',
    LastName = 'Martin Updated',
    TelephoneNumber = '555-555-5571',
    FamilyMemberID = 2
WHERE SecondaryFamilyMemberID = 1;

UPDATE SecondaryFamilyRelated
SET Relationship = 'GrandMother',
    ClubMemberID = 2
WHERE SecondaryFamilyMemberID = 1 AND ClubMemberID = 1;

UPDATE FamilyRelated
SET Relationship = 'Other'
WHERE ClubMemberID = 1 AND FamilyMemberID = 1;

UPDATE FamilyMemberLocations
SET EndDate = '2023-12-31'
WHERE FamilyMemberID = 1 AND LocationID = 1;

UPDATE ClubMembers
SET FirstName = 'Adam Updated',
    LastName = 'Johnson Updated',
    DateOfBirth = '2001-01-01',
    SocialSecurityNumber = '234-56-7892',
    MedicalCardNumber = 'MC23457',
    TelephoneNumber = '555-555-5575',
    Address = '808 Updated Birch St',
    City = 'New Metropolis',
    Province = 'New State',
    PostalCode = '54321',
    TeamType = 'Girls',
    Status = 'Active',
    Role = 'Defender',
    ClubMembershipNumber = 'CMN12346'
WHERE ClubMemberID = 1;

UPDATE Teams
SET TeamName = 'Updated Team A',
    LocationID = 2,
    TeamType = 'Girls',
    HeadCoach = 'Updated Coach A'
WHERE TeamID = 1;

UPDATE ClubMemberTeams
SET EndDate = '2023-12-31'
WHERE ClubMemberID = 1;

UPDATE ClubMemberLocations
SET EndDate = '2023-12-31'
WHERE LocationID = 1 AND ClubMemberID = 1;

UPDATE Sessions
SET TypeOfSession = 'Game',
    LocationID = 2
WHERE SessionID = 1;

UPDATE TeamFormation
SET Time = '15:00:00',
    Date = '2024-06-01',
    Score = 6,
    TeamType = 'Boys'
WHERE TeamFormationID = 1;


-- ---- Update statements for query 14 ---- --
-- Assign roles to ClubMemberID 35 (Alex Johnson)
UPDATE ClubMemberTeams
SET Role = 'GoalKeeper'
WHERE ClubMemberID = 35 AND TeamID = 1;

UPDATE ClubMemberTeams
SET Role = 'Defender'
WHERE ClubMemberID = 35 AND TeamID = 2;

UPDATE ClubMemberTeams
SET Role = 'Midfielder'
WHERE ClubMemberID = 35 AND TeamID = 3;

UPDATE ClubMemberTeams
SET Role = 'Forward'
WHERE ClubMemberID = 35 AND TeamID = 4;

-- Assign roles to ClubMemberID 23 (Bobby Smith)
UPDATE ClubMemberTeams
SET Role = 'GoalKeeper'
WHERE ClubMemberID = 36 AND TeamID = 1;

UPDATE ClubMemberTeams
SET Role = 'Defender'
WHERE ClubMemberID = 36 AND TeamID = 2;

UPDATE ClubMemberTeams
SET Role = 'Midfielder'
WHERE ClubMemberID = 36 AND TeamID = 9;

UPDATE ClubMemberTeams
SET Role = 'Forward'
WHERE ClubMemberID = 36 AND TeamID = 10;

-- Assign roles to ClubMemberID 37 (Chris Brown)
UPDATE ClubMemberTeams
SET Role = 'GoalKeeper'
WHERE ClubMemberID = 37 AND TeamID = 1;

UPDATE ClubMemberTeams
SET Role = 'Defender'
WHERE ClubMemberID = 37 AND TeamID = 2;

UPDATE ClubMemberTeams
SET Role = 'Midfielder'
WHERE ClubMemberID = 37 AND TeamID = 3;

UPDATE ClubMemberTeams
SET Role = 'Forward'
WHERE ClubMemberID = 37 AND TeamID = 4;

-- Assign roles to ClubMemberID 38 (Danny Williams)
UPDATE ClubMemberTeams
SET Role = 'GoalKeeper'
WHERE ClubMemberID = 38 AND TeamID = 1;

UPDATE ClubMemberTeams
SET Role = 'Defender'
WHERE ClubMemberID = 38 AND TeamID = 2;

UPDATE ClubMemberTeams
SET Role = 'Midfielder'
WHERE ClubMemberID = 38 AND TeamID = 3;

UPDATE ClubMemberTeams
SET Role = 'Forward'
WHERE ClubMemberID = 38 AND TeamID = 4;

-- Assign roles to ClubMemberID 26 (Eve Adams)
UPDATE ClubMemberTeams
SET Role = 'GoalKeeper'
WHERE ClubMemberID = 26 AND TeamID = 13;

-- Assign roles to ClubMemberID 27 (Frank Baker)
UPDATE ClubMemberTeams
SET Role = 'GoalKeeper'
WHERE ClubMemberID = 27 AND TeamID = 13;


-- Assign roles to ClubMemberID 28 (Grace Clark)
UPDATE ClubMemberTeams
SET Role = 'GoalKeeper'
WHERE ClubMemberID = 28 AND TeamID = 13;

-- Assign roles to ClubMemberID 29 (Hannah Davis)
UPDATE ClubMemberTeams
SET Role = 'GoalKeeper'
WHERE ClubMemberID = 29 AND TeamID = 14;

UPDATE ClubMembers
SET FirstName = 'Adam', LastName = 'Johnson'
WHERE ClubMembershipNumber = 'CMN12346';

