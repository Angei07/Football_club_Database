# DROP DATABASE IF EXISTS test_db;
# CREATE DATABASE test_db;
# USE test_db;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Location;
CREATE TABLE Location (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    Province VARCHAR(100),
    PostalCode VARCHAR(20),
    TelephoneNumber VARCHAR(20),
    WebAddress VARCHAR(255),
    Type ENUM('Head', 'Branch'),
    Capacity INT
);

DROP TABLE IF EXISTS Personnel;
CREATE TABLE Personnel (
    PersonnelID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    SocialSecurityNumber VARCHAR(20) UNIQUE NOT NULL,
    MedicalCardNumber VARCHAR(20) UNIQUE NOT NULL,
    TelephoneNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    Province VARCHAR(100),
    PostalCode VARCHAR(20),
    EmailAddress VARCHAR(255),
    Role ENUM('President', 'Administrator', 'GeneralManager','Trainer', 'Other'),
    Mandate ENUM('Volunteer', 'Salaried'),
    StartDate DATE,
    EndDate DATE
);

DROP TABLE IF EXISTS PersonnelLocations;
CREATE TABLE PersonnelLocations (
    PersonnelID INT,
    LocationID INT,
    StartDate DATE,
    EndDate DATE,
    PRIMARY KEY (PersonnelID, LocationID),
    FOREIGN KEY (PersonnelID) REFERENCES Personnel(PersonnelID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

DROP TABLE IF EXISTS FamilyMember;
CREATE TABLE FamilyMember (
    FamilyMemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    SocialSecurityNumber VARCHAR(20) UNIQUE NOT NULL,
    MedicalCardNumber VARCHAR(20) UNIQUE NOT NULL,
    TelephoneNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    Province VARCHAR(100),
    PostalCode VARCHAR(20),
    EmailAddress VARCHAR(255),
    LocationID INT,
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

DROP TABLE IF EXISTS SecondaryFamilyMember;
CREATE TABLE SecondaryFamilyMember (
    SecondaryFamilyMemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    TelephoneNumber VARCHAR(20),
    FamilyMemberID INT,
    FOREIGN KEY (FamilyMemberID) REFERENCES FamilyMember(FamilyMemberID)
);

DROP TABLE IF EXISTS ClubMembers;
CREATE TABLE ClubMembers (
    ClubMemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    SocialSecurityNumber VARCHAR(20) UNIQUE NOT NULL,
    MedicalCardNumber VARCHAR(20) UNIQUE NOT NULL,
    TelephoneNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    Province VARCHAR(100),
    PostalCode VARCHAR(20),
    TeamType ENUM('Girls', 'Boys'),
    Status ENUM('Active', 'Inactive'),
    Role ENUM('GoalKeeper','Defender','Midfielder','Forward'),
    ClubMembershipNumber VARCHAR(255) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS SecondaryFamilyRelated;
CREATE TABLE SecondaryFamilyRelated (
    Relationship Enum('Father', 'Mother', 'GrandFather', 'GrandMother', 'Tutor', 'Partner', 'Friend', 'Other'),
    SecondaryFamilyMemberID INT,
    ClubMemberID INT,
    FOREIGN KEY (SecondaryFamilyMemberID) REFERENCES SecondaryFamilyMember(SecondaryFamilyMemberID),
    FOREIGN KEY (ClubMemberID) REFERENCES ClubMembers(ClubMemberID)
);

DROP TABLE IF EXISTS FamilyRelated;
CREATE TABLE FamilyRelated (
    ClubMemberID INT,
    FamilyMemberID INT,
    Relationship Enum('Father', 'Mother', 'GrandFather', 'GrandMother', 'Tutor', 'Partner', 'Friend', 'Other'),
    PRIMARY KEY (ClubMemberID, FamilyMemberID),
    FOREIGN KEY (ClubMemberID) REFERENCES ClubMembers(ClubMemberID),
    FOREIGN KEY (FamilyMemberID) REFERENCES FamilyMember(FamilyMemberID)
);

DROP TABLE IF EXISTS FamilyMemberLocations;
CREATE TABLE FamilyMemberLocations (
    FamilyMemberID INT,
    LocationID INT,
    StartDate DATE,
    EndDate DATE,
    PRIMARY KEY (FamilyMemberID, LocationID),
    FOREIGN KEY (FamilyMemberID) REFERENCES FamilyMember(FamilyMemberID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

DROP TABLE IF EXISTS Teams;
CREATE TABLE Teams (
    TeamID INT AUTO_INCREMENT PRIMARY KEY,
    TeamName VARCHAR(255),
    LocationID INT,
    TeamType ENUM('Boys','Girls'),
    HeadCoach VARCHAR(255),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);


DROP TABLE IF EXISTS ClubMemberTeams;
CREATE TABLE ClubMemberTeams (
    ClubMemberID INT,
    StartDate DATE,
    EndDate DATE,
    TeamID INT,
    Role ENUM('GoalKeeper','Defender','Midfielder','Forward'),
    PRIMARY KEY(TeamID,ClubMemberID),
    FOREIGN KEY (ClubMemberID) REFERENCES ClubMembers(ClubMemberID),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

DROP TABLE IF EXISTS ClubMemberLocations;
CREATE TABLE ClubMemberLocations (
    LocationID INT,
    ClubMemberID INT,
    StartDate DATE,
    EndDate DATE,
    PRIMARY KEY (LocationID, ClubMemberID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
    FOREIGN KEY (ClubMemberID) REFERENCES ClubMembers(ClubMemberID)
);

DROP TABLE IF EXISTS Sessions;
CREATE TABLE Sessions (
    SessionID INT AUTO_INCREMENT PRIMARY KEY,
    TypeOfSession ENUM('Training', 'Game'),
    LocationID INT,
    ScheduledDate DATE,
    HeadCoachPersonnelID INT,
    FOREIGN KEY (HeadCoachPersonnelID) REFERENCES Personnel(PersonnelID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);


DROP TABLE IF EXISTS TeamFormation;
CREATE TABLE TeamFormation (
    TeamFormationID INT AUTO_INCREMENT PRIMARY KEY,
    Time TIME,
    Date DATE,
    Score INT,
    TeamType ENUM('Boys','Girls')
);

DROP TABLE IF EXISTS EmailLogs;
CREATE TABLE EmailLogs (
    EmailLogID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    LocationIDSender INT,
    EmailReceiver VARCHAR(255),
    EmailSubject VARCHAR(255),
    EmailBody VARCHAR(255)
);

SET FOREIGN_KEY_CHECKS = 1;
