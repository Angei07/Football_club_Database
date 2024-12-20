INSERT INTO Locations (Name, Address, City, Province, PostalCode, PhoneNumber, WebAddress, Type, Capacity) VALUES
('Head Office', '123 Main St', 'Toronto', 'Ontario', 'M1K 1M1', '416-123-4567', 'www.headlocation.com', 'Head', 100),
('Branch A', '456 Maple Ave', 'Toronto', 'Ontario', 'M1K 2M2', '416-234-5678', 'www.branchA.com', 'Branch', 80),
('Branch B', '789 Oak St', 'Montreal', 'Quebec', 'H1K 3K3', '514-345-6789', 'www.branchB.com', 'Branch', 70),
('Branch C', '321 Pine Rd', 'Vancouver', 'British Columbia', 'V5K 4K4', '604-456-7890', 'www.branchC.com', 'Branch', 90),
('Branch D', '654 Cedar Ln', 'Calgary', 'Alberta', 'T2K 5K5', '403-567-8901', 'www.branchD.com', 'Branch', 85),
('Branch E', '987 Birch Blvd', 'Edmonton', 'Alberta', 'T5K 6K6', '780-678-9012', 'www.branchE.com', 'Branch', 75),
('Branch F', '213 Elm St', 'Halifax', 'Nova Scotia', 'B3K 7K7', '902-789-0123', 'www.branchF.com', 'Branch', 60),
('Branch G', '432 Willow Dr', 'Winnipeg', 'Manitoba', 'R3K 8K8', '204-890-1234', 'www.branchG.com', 'Branch', 65),
('Branch H', '654 Spruce Ct', 'Victoria', 'British Columbia', 'V8K 9K9', '250-901-2345', 'www.branchH.com', 'Branch', 55),
('Branch I', '876 Fir St', 'Regina', 'Saskatchewan', 'S4K 0K0', '306-012-3456', 'www.branchI.com', 'Branch', 50);

INSERT INTO Personnels (FirstName, LastName, DateOfBirth, SocialSecurityNumber, MedicareCardNumber, TelephoneNumber, Address, City, Province, PostalCode, EmailAddress, Role, Mandate) VALUES
('John', 'Doe', '1980-01-01', '123-45-6789', '1234567890', '416-123-4567', '123 Main St', 'Toronto', 'Ontario', 'M1K 1M1', 'john.doe@example.com', 'Administrator', 'Salaries'),
('Alice', 'Johnson', '1970-01-01', '111-11-1111', '1111111111', '416-111-1111', '123 Family St', 'Toronto', 'Ontario', 'M1K 1A1', 'alice.johnson@example.com', 'Trainer', 'Volunteer'),
('Bob', 'Williams', '1972-02-02', '222-22-2222', '2222222222', '416-222-2222', '456 Family Ave', 'Toronto', 'Ontario', 'M1K 2A2', 'bob.williams@example.com','Administrator', 'Salaries'),
('Jane', 'Smith', '1982-02-02', '234-56-7890', '2345678901', '416-234-5678', '456 Maple Ave', 'Toronto', 'Ontario', 'M1K 2M2', 'jane.smith@example.com', 'Trainer', 'Volunteer'),
('James', 'Brown', '1984-03-03', '345-67-8901', '3456789012', '514-345-6789', '789 Oak St', 'Montreal', 'Quebec', 'H1K 3K3', 'james.brown@example.com', 'Administrator', 'Salaries'),
('Emily', 'Davis', '1986-04-04', '456-78-9012', '4567890123', '604-456-7890', '321 Pine Rd', 'Vancouver', 'British Columbia', 'V5K 4K4', 'emily.davis@example.com', 'Trainer', 'Volunteer'),
('Michael', 'Wilson', '1988-05-05', '567-89-0123', '5678901234', '403-567-8901', '654 Cedar Ln', 'Calgary', 'Alberta', 'T2K 5K5', 'michael.wilson@example.com', 'Other', 'Salaries'),
('Sarah', 'Johnson', '1990-06-06', '678-90-1234', '6789012345', '780-678-9012', '987 Birch Blvd', 'Edmonton', 'Alberta', 'T5K 6K6', 'sarah.johnson@example.com', 'Administrator', 'Volunteer'),
('David', 'Lee', '1992-07-07', '789-01-2345', '7890123456', '902-789-0123', '213 Elm St', 'Halifax', 'Nova Scotia', 'B3K 7K7', 'david.lee@example.com', 'Trainer', 'Salaries'),
('Laura', 'King', '1994-08-08', '890-12-3456', '8901234567', '204-890-1234', '432 Willow Dr', 'Winnipeg', 'Manitoba', 'R3K 8K8', 'laura.king@example.com', 'Other', 'Volunteer'),
('Robert', 'Taylor', '1996-09-09', '901-23-4567', '9012345678', '250-901-2345', '654 Spruce Ct', 'Victoria', 'British Columbia', 'V8K 9K9', 'robert.taylor@example.com', 'Trainer', 'Salaries'),
('Patricia', 'White', '1998-10-10', '012-34-5678', '0123456789', '306-012-3456', '876 Fir St', 'Regina', 'Saskatchewan', 'S4K 0K0', 'patricia.white@example.com', 'Administrator', 'Volunteer'),
('Alex', 'Morgan', '1985-01-01', '123-45-6780', '1234567801', '416-123-7890', '321 Work Dr', 'Toronto', 'Ontario', 'M1K 1C1', 'alex.morgan@example.com', 'Administrator', 'Volunteer'),
('Betty', 'Sanders', '1986-02-02', '234-56-7891', '2345678912', '416-234-8901', '654 Work St', 'Toronto', 'Ontario', 'M1K 2C2', 'betty.sanders@example.com', 'Trainer', 'Salaries'),
('Carlos', 'Ramirez', '1987-03-03', '345-67-8902', '3456789023', '514-345-9012', '987 Work Ave', 'Montreal', 'Quebec', 'H1K 3C3', 'carlos.ramirez@example.com', 'Other', 'Volunteer'),
('Diana', 'Freeman', '1988-04-04', '456-78-9013', '4567890134', '604-456-0123', '213 Work Blvd', 'Vancouver', 'British Columbia', 'V5K 4C4', 'diana.freeman@example.com', 'Trainer', 'Salaries'),
('Ethan', 'Murphy', '1989-05-05', '567-89-0124', '5678901245', '403-567-1234', '432 Work Rd', 'Calgary', 'Alberta', 'T2K 5C5', 'ethan.murphy@example.com', 'Administrator', 'Volunteer'),
('Fiona', 'Wright', '1990-06-06', '678-90-1235', '6789012356', '780-678-2345', '654 Work Ln', 'Edmonton', 'Alberta', 'T5K 6C6', 'fiona.wright@example.com', 'Trainer', 'Salaries'),
('George', 'Hughes', '1991-07-07', '789-01-2346', '7890123467', '902-789-3456', '876 Work St', 'Halifax', 'Nova Scotia', 'B3K 7C7', 'george.hughes@example.com', 'Other', 'Volunteer'),
('Hannah', 'Anderson', '1992-08-08', '890-12-3457', '8901234578', '204-890-4567', '123 Work Dr', 'Winnipeg', 'Manitoba', 'R3K 8C8', 'hannah.anderson@example.com', 'Trainer', 'Salaries'),
('Ian', 'Thomas', '1993-09-09', '901-23-4568', '9012345689', '250-901-5678', '456 Work St', 'Victoria', 'British Columbia', 'V8K 9C9', 'ian.thomas@example.com', 'Administrator', 'Volunteer'),
('Jenny', 'Lopez', '1994-10-10', '012-34-5679', '0123456790', '306-012-6789', '789 Work Ave', 'Regina', 'Saskatchewan', 'S4K 0C0', 'jenny.lopez@example.com', 'Trainer', 'Salaries');


INSERT INTO PersonnelLocations (PersonnelID, LocationID, StartDate, EndDate) VALUES
(1, 1, '2022-01-01', NULL),
(2, 1, '2022-01-01', NULL),
(3, 2, '2022-01-01', NULL),
(4, 2, '2022-01-01', NULL),
(5, 3, '2022-01-01', NULL),
(6, 3, '2022-01-01', NULL),
(7, 4, '2022-01-01', NULL),
(8, 4, '2022-01-01', NULL),
(9, 5, '2022-01-01', NULL),
(10, 5, '2022-01-01', NULL),
(11, 6, '2022-01-01', NULL),
(12, 6, '2022-01-01', NULL),
(13, 7, '2022-01-01', NULL),
(14, 7, '2022-01-01', NULL),
(15, 8, '2022-01-01', NULL),
(16, 8, '2022-01-01', NULL),
(17, 9, '2022-01-01', NULL),
(18, 9, '2022-01-01', NULL),
(19, 10, '2022-01-01', NULL),
(20, 10, '2022-01-01', NULL),
(21, 1, '2022-01-01', NULL),
(22, 1, '2022-01-01', NULL);

INSERT INTO FamilyMembers (Type, FirstName, LastName, DateOfBirth, SocialSecurityNumber, MedicareCardNumber, TelephoneNumber, Address, City, Province, PostalCode, EmailAddress, LocationID) VALUES
('Mother', 'Alice', 'Johnson', '1970-01-01', '111-11-1111', '1111111111', '416-111-1111', '123 Family St', 'Toronto', 'Ontario', 'M1K 1A1', 'alice.johnson@example.com', 1),
('Father', 'Bob', 'Williams', '1972-02-02', '222-22-2222', '2222222222', '416-222-2222', '456 Family Ave', 'Toronto', 'Ontario', 'M1K 2A2', 'bob.williams@example.com', 1),
('GrandFather', 'Charlie', 'Brown', '1974-03-03', '333-33-3333', '3333333333', '514-333-3333', '789 Family Blvd', 'Montreal', 'Quebec', 'H1K 3A3', 'charlie.brown@example.com', 2),
('Partner', 'Diana', 'Smith', '1976-04-04', '444-44-4444', '4444444444', '604-444-4444', '321 Family Rd', 'Vancouver', 'British Columbia', 'V5K 4A4', 'diana.smith@example.com', 2),
('Tutor', 'Edward', 'Davis', '1978-05-05', '555-55-5555', '5555555555', '403-555-5555', '654 Family Ln', 'Calgary', 'Alberta', 'T2K 5A5', 'edward.davis@example.com', 3),
('Friend', 'Fiona', 'Wilson', '1980-06-06', '666-66-6666', '6666666666', '780-666-6666', '987 Family St', 'Edmonton', 'Alberta', 'T5K 6A6', 'fiona.wilson@example.com', 3),
('Other', 'George', 'White', '1982-07-07', '777-77-7777', '7777777777', '902-777-7777', '213 Family Ave', 'Halifax', 'Nova Scotia', 'B3K 7A7', 'george.white@example.com', 4),
('Mother', 'Hannah', 'Taylor', '1984-08-08', '888-88-8888', '8888888888', '204-888-8888', '432 Family Blvd', 'Winnipeg', 'Manitoba', 'R3K 8A8', 'hannah.taylor@example.com', 4),
('Father', 'Ian', 'King', '1986-09-09', '999-99-9999', '9999999999', '250-999-9999', '654 Family Rd', 'Victoria', 'British Columbia', 'V8K 9A9', 'ian.king@example.com', 5),
('Other', 'Jack', 'Lee', '1988-10-10', '000-00-0000', '0000000000', '306-000-0000', '876 Family Ln', 'Regina', 'Saskatchewan', 'S4K 0A0', 'jack.lee@example.com', 5),
('GrandMother', 'Karen', 'Parker', '1980-11-11', '123-45-6780', '1234567800', '416-123-8888', '321 Family Dr', 'Toronto', 'Ontario', 'M1K 1A3', 'karen.parker@example.com', 6),
('GrandFather', 'Larry', 'Adams', '1981-12-12', '234-56-7891', '2345678911', '416-234-9999', '654 Family St', 'Toronto', 'Ontario', 'M1K 2A4', 'larry.adams@example.com', 6),
('Partner', 'Megan', 'Clark', '1982-01-01', '345-67-8902', '3456789022', '514-345-1111', '987 Family Ave', 'Montreal', 'Quebec', 'H1K 3A5', 'megan.clark@example.com', 7),
('Tutor', 'Nathan', 'Hall', '1983-02-02', '456-78-9013', '4567890133', '604-456-2222', '213 Family Blvd', 'Vancouver', 'British Columbia', 'V5K 4A6', 'nathan.hall@example.com', 7),
('Friend', 'Olivia', 'Young', '1984-03-03', '567-89-0124', '5678901244', '403-567-3333', '432 Family Rd', 'Calgary', 'Alberta', 'T2K 5A7', 'olivia.young@example.com', 8),
('Other', 'Peter', 'Harris', '1985-04-04', '678-90-1235', '6789012355', '780-678-4444', '654 Family Ln', 'Edmonton', 'Alberta', 'T5K 6A8', 'peter.harris@example.com', 8),
('Mother', 'Quinn', 'Martinez', '1986-05-05', '789-01-2346', '7890123466', '902-789-5555', '876 Family St', 'Halifax', 'Nova Scotia', 'B3K 7A9', 'quinn.martinez@example.com', 9),
('Partner', 'Rebecca', 'Robinson', '1987-06-06', '890-12-3457', '8901234577', '204-890-6666', '123 Family Dr', 'Winnipeg', 'Manitoba', 'R3K 8A0', 'rebecca.robinson@example.com', 9),
('Father', 'Samuel', 'Lewis', '1988-07-07', '901-23-4568', '9012345688', '250-901-7777', '456 Family St', 'Victoria', 'British Columbia', 'V8K 9A1', 'samuel.lewis@example.com', 10),
('Friend', 'Tina', 'Walker', '1989-08-08', '012-34-5679', '0123456799', '306-012-8888', '789 Family Ave', 'Regina', 'Saskatchewan', 'S4K 0A2', 'tina.walker@example.com', 10);


-- Calculate the current year
SET @current_year = YEAR(CURDATE());

-- Insert data with the Status calculated based on the age
INSERT INTO ClubMembers (MembershipNumber, FirstName, LastName, DateOfBirth, SocialSecurityNumber, MedicareCardNumber, TelephoneNumber, Address, City, Province, PostalCode, FamilyMemberID, LocationID, TeamType, Status) VALUES
(1, 'Evan', 'Johnson', '2012-01-01', '111-22-3333', '1112233334', '416-111-2222', '123 Kid St', 'Toronto', 'Ontario', 'M1K 1B1', 1, 1, 'Boys', CASE WHEN @current_year - YEAR('2012-01-01') BETWEEN 4 AND 10 THEN 'Active' ELSE 'Inactive' END),
(2, 'Grace', 'Johnson', '2015-02-02', '222-33-4444', '2223344445', '416-111-3333', '123 Kid St', 'Toronto', 'Ontario', 'M1K 1B1', 1, 1, 'Girls', CASE WHEN @current_year - YEAR('2015-02-02') BETWEEN 4 AND 10 THEN 'Active' ELSE 'Inactive' END),
(3, 'Henry', 'Williams', '2020-03-03', '333-44-5555', '3334455556', '416-222-4444', '456 Kid Ave', 'Toronto', 'Ontario', 'M1K 2B2', 2, 2, 'Boys', CASE WHEN @current_year - YEAR('2020-03-03') BETWEEN 4 AND 10 THEN 'Active' ELSE 'Inactive' END),
(4, 'Ivy', 'Williams', '2019-04-04', '444-55-6666', '4445566667', '416-222-5555', '456 Kid Ave', 'Toronto', 'Ontario', 'M1K 2B2', 2, 2, 'Girls', CASE WHEN @current_year - YEAR('2019-04-04') BETWEEN 4 AND 10 THEN 'Active' ELSE 'Inactive' END),
(5, 'Jack', 'Brown', '2018-05-05', '555-66-7777', '5556677778', '514-333-6666', '789 Kid Blvd', 'Montreal', 'Quebec', 'H1K 3B3', 3, 3, 'Boys', CASE WHEN @current_year - YEAR('2018-05-05') BETWEEN 4 AND 10 THEN 'Active' ELSE 'Inactive' END),
(6, 'Katie', 'Brown', '2014-06-06', '666-77-8888', '6667788889', '514-333-7777', '789 Kid Blvd', 'Montreal', 'Quebec', 'H1K 3B3', 3, 3, 'Girls', CASE WHEN @current_year - YEAR('2014-06-06') BETWEEN 4 AND 10 THEN 'Active' ELSE 'Inactive' END),
(7, 'Leo', 'Smith', '2010-07-07', '777-88-9999', '7778899990', '604-444-8888', '321 Kid Rd', 'Vancouver', 'British Columbia', 'V5K 4B4', 4, 4, 'Boys', CASE WHEN @current_year - YEAR('2010-07-07') BETWEEN 4 AND 10 THEN 'Active' ELSE 'Inactive' END),
(8, 'Mia', 'Smith', '2017-08-08', '888-99-0000', '8889900001', '604-444-9999', '321 Kid Rd', 'Vancouver', 'British Columbia', 'V5K 4B4', 4, 4, 'Girls', CASE WHEN @current_year - YEAR('2017-08-08') BETWEEN 4 AND 10 THEN 'Active' ELSE 'Inactive' END),
(9, 'Nolan', 'Davis', '2009-09-09', '999-00-1111', '9990011112', '403-555-0000', '654 Kid Ln', 'Calgary', 'Alberta', 'T2K 5B5', 5, 5, 'Boys', CASE WHEN @current_year - YEAR('2009-09-09') BETWEEN 4 AND 10 THEN 'Active' ELSE 'Inactive' END),
(10, 'Olivia', 'Davis', '2013-10-10', '000-11-2222', '0001122223', '403-555-1111', '654 Kid Ln', 'Calgary', 'Alberta', 'T2K 5B5', 5, 5, 'Girls', CASE WHEN @current_year - YEAR('2013-10-10') BETWEEN 4 AND 10 THEN 'Active' ELSE 'Inactive' END);


INSERT INTO Teams (TeamName, LocationID, TeamType) VALUES
('Toronto Boys Team A', 1, 'Boys'),
('Toronto Girls Team A', 1, 'Girls'),
('Toronto Boys Team B', 2, 'Boys'),
('Toronto Girls Team B', 2, 'Girls'),
('Montreal Boys Team', 3, 'Boys'),
('Montreal Girls Team', 3, 'Girls'),
('Vancouver Boys Team', 4, 'Boys'),
('Vancouver Girls Team', 4, 'Girls'),
('Calgary Boys Team', 5, 'Boys'),
('Calgary Girls Team', 5, 'Girls');

INSERT INTO ClubMemberTeams (ClubMemberID, TeamID, StartDate, EndDate) VALUES
(1, 1, '2023-01-01', NULL),
(2, 2, '2023-01-01', NULL),
(3, 3, '2023-01-01', NULL),
(4, 4, '2023-01-01', NULL),
(5, 5, '2023-01-01', NULL),
(6, 6, '2023-01-01', NULL),
(7, 7, '2023-01-01', NULL),
(8, 8, '2023-01-01', NULL),
(9, 9, '2023-01-01', NULL),
(10, 10, '2023-01-01', NULL);

INSERT INTO FamilyMemberLocations (FamilyMemberID, LocationID, StartDate, EndDate) VALUES
(1, 1, '2022-01-01', NULL),
(2, 2, '2022-02-01', NULL),
(3, 3, '2022-03-01', NULL),
(4, 4, '2022-04-01', NULL),
(5, 5, '2022-05-01', NULL),
(6, 6, '2022-06-01', NULL),
(7, 7, '2022-07-01', NULL),
(8, 8, '2022-08-01', NULL),
(9, 9, '2022-09-01', NULL),
(10, 10, '2022-10-01', NULL),
(1, 2, '2023-01-01', NULL),
(2, 3, '2023-02-01', NULL),
(3, 4, '2023-03-01', NULL),
(4, 5, '2023-04-01', NULL),
(5, 6, '2023-05-01', NULL),
(6, 7, '2022-06-01', NULL),
(7, 8, '2022-07-01', NULL),
(8, 9, '2022-08-01', NULL),
(9, 10, '2022-09-01', NULL),
(10, 1, '2022-10-01', NULL);