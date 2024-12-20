SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `Locations`;
CREATE TABLE Locations (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Province VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(20) NOT NULL,
    PhoneNumber VARCHAR(20),
    WebAddress VARCHAR(100),
    Type ENUM('Head', 'Branch') NOT NULL,
    Capacity INT
);

DROP TABLE IF EXISTS `Personnels`;
CREATE TABLE Personnels (
    PersonnelID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    SocialSecurityNumber VARCHAR(50) UNIQUE NOT NULL,
    MedicareCardNumber VARCHAR(50) UNIQUE,
    TelephoneNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    Province VARCHAR(100),
    PostalCode VARCHAR(20),
    EmailAddress VARCHAR(100),
    Role ENUM('Administrator', 'Trainer', 'Other') NOT NULL,
    Mandate ENUM('Volunteer', 'Salaries') NOT NULL
);

DROP TABLE IF EXISTS `PersonnelLocations`;
CREATE TABLE PersonnelLocations (
    PersonnelLocationID INT PRIMARY KEY AUTO_INCREMENT,
    PersonnelID INT NOT NULL,
    LocationID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    FOREIGN KEY (PersonnelID) REFERENCES Personnels(PersonnelID) ON UPDATE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `FamilyMembers`;
CREATE TABLE FamilyMembers (
    FamilyMemberID INT PRIMARY KEY AUTO_INCREMENT,
    Type ENUM('Father', 'Mother', 'GrandFather', 'GrandMother', 'Tutor', 'Partner', 'Friend', 'Other') NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    SocialSecurityNumber VARCHAR(50) UNIQUE NOT NULL,
    MedicareCardNumber VARCHAR(50) UNIQUE,
    TelephoneNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    Province VARCHAR(100),
    PostalCode VARCHAR(20),
    EmailAddress VARCHAR(100),
    LocationID INT NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `FamilyMemberLocations`;
CREATE TABLE FamilyMemberLocations (
    FamilyMemberLocationID INT PRIMARY KEY AUTO_INCREMENT,
    FamilyMemberID INT NOT NULL,
    LocationID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    FOREIGN KEY (FamilyMemberID) REFERENCES FamilyMembers(FamilyMemberID) ON UPDATE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `ClubMembers`;
CREATE TABLE ClubMembers (
    ClubMemberID INT PRIMARY KEY AUTO_INCREMENT,
    MembershipNumber INT UNIQUE NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    SocialSecurityNumber VARCHAR(50) UNIQUE NOT NULL,
    MedicareCardNumber VARCHAR(50) UNIQUE,
    TelephoneNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    Province VARCHAR(100),
    PostalCode VARCHAR(20),
    FamilyMemberID INT NOT NULL,
    LocationID INT NOT NULL,
    TeamType ENUM('Boys', 'Girls') NOT NULL,
    Status ENUM('Active', 'Inactive') NOT NULL,
    FOREIGN KEY (FamilyMemberID) REFERENCES FamilyMembers(FamilyMemberID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

DROP TABLE IF EXISTS `Teams`;
CREATE TABLE Teams (
    TeamID INT PRIMARY KEY AUTO_INCREMENT,
    TeamName VARCHAR(100) NOT NULL,
    LocationID INT NOT NULL,
    TeamType ENUM('Boys', 'Girls') NOT NULL,
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

DROP TABLE IF EXISTS `ClubMemberTeams`;
CREATE TABLE ClubMemberTeams (
    ClubMemberTeamID INT PRIMARY KEY AUTO_INCREMENT,
    ClubMemberID INT NOT NULL,
    TeamID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    FOREIGN KEY (ClubMemberID) REFERENCES ClubMembers(ClubMemberID),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

SET FOREIGN_KEY_CHECKS = 1;