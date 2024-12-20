/*
Neil Fisher (40240320)

COMP 353 Summer 2024

Assignment 1
*/

/* PART 1 */

-- a)

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Donors;
CREATE TABLE Donors
(
    ID            INT PRIMARY KEY,
    firstName     VARCHAR(50),
    lastName      VARCHAR(50),
    middleInitial CHAR(1),
    dateOfBirth   DATE,
    address       VARCHAR(100),
    city          VARCHAR(50),
    postalCode    VARCHAR(20),
    province      VARCHAR(50),
    gender        CHAR(1),
    SSN           CHAR(9),
    phone         VARCHAR(20),
    email         VARCHAR(50),
    hobby         VARCHAR(50)
);

DROP TABLE IF EXISTS Donations;
CREATE TABLE Donations
(
    ID      INT PRIMARY KEY,
    donorID INT,
    date    DATE,
    type    ENUM ('Money', 'Products'),
    amount  DECIMAL(10, 2),
    FOREIGN KEY (donorID) REFERENCES Donors (ID)
);


DROP TABLE IF EXISTS Products;
CREATE TABLE Products
(
    ID          INT PRIMARY KEY,
    description VARCHAR(100),
    date        DATE,
    price       DECIMAL(10, 2),
    weight      DECIMAL(10, 2),
    location    VARCHAR(100) null,
    color       VARCHAR(50)  null
);

DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales
(
    ID          INT PRIMARY KEY,
    date        DATE,
    amount      DECIMAL(10, 2),
    deliveryFee DECIMAL(10, 2)
);

DROP TABLE IF EXISTS SalesItems;
CREATE TABLE SalesItems
(
    sID INT,
    pID INT,
    PRIMARY KEY (sID, pID),
    FOREIGN KEY (sID) REFERENCES Sales (ID),
    FOREIGN KEY (pID) REFERENCES Products (ID)
);

SET FOREIGN_KEY_CHECKS = 1;


-- b)
ALTER TABLE Donors
    DROP COLUMN hobby;

-- c)
ALTER TABLE Products
    MODIFY location VARCHAR(100) DEFAULT 'Unknown',
    MODIFY color VARCHAR(50) DEFAULT 'Unknown';

-- d)
INSERT INTO Donors (ID, firstName, lastName, middleInitial, dateOfBirth, address, city, postalCode, province, gender,
                    SSN, phone, email)
VALUES (1, 'John', 'Doe', 'A', '1980-01-01', '123 Main St', 'Montreal', 'H1A1A1', 'QC', 'M', '123456789', '555-1234',
        'john.doe@example.com'),
       (2, 'Jane', 'Smith', 'B', '1990-02-02', '456 Elm St', 'Laval', 'H2B2B2', 'QC', 'F', '987654321', '555-5678',
        'jane.smith@example.com');

INSERT INTO Donations (ID, donorID, date, type, amount)
VALUES (1, 1, '2023-07-01', 'money', 100.00),
       (2, 2, '2023-08-01', 'products', 200.00),
       (3, 1, '2023-09-01', 'money', 150.00);

-- e)
DELETE
FROM Donations
WHERE donorID IN (1, 2);
DELETE
FROM Donors
WHERE ID IN (1, 2);

-- f)
DROP TABLE SalesItems;
DROP TABLE Sales;
DROP TABLE Products;
DROP TABLE Donations;
DROP TABLE Donors;

/* PART 2 */

-- a)
SELECT id,
       firstname,
       lastname,
       middleinitial,
       dateofbirth,
       phone,
       email,
       ssn
FROM Donors
WHERE gender = 'M'
  AND (city = 'Montreal' OR city = 'Laval');

-- b)
SELECT s.ID, p.ID, p.description, p.price, p.weight
FROM Sales s
         JOIN SalesItems si ON s.ID = si.sID
         JOIN Products p ON si.pID = p.ID
WHERE p.color = 'red'
  AND s.date = '2024-02-14';

-- c)
SELECT SUM(amount) AS totalAmount
FROM Sales
WHERE date = '2024-02-14';

-- d)
SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       COUNT(*)                   AS totalSales,
       SUM(amount)                AS totalAmount,
       SUM(deliveryFee)           AS totalDeliveryFees
FROM Sales
WHERE YEAR(date) = 2023
GROUP BY DATE_FORMAT(date, '%Y-%m');

-- e)
SELECT d.ID, d.firstName, d.lastName, d.gender, SUM(n.amount)
FROM Donors d
         JOIN Donations n ON d.ID = n.donorID
WHERE d.city = 'Brossard'
  AND n.date BETWEEN '2022-01-01' AND '2023-12-31'
GROUP BY d.ID, d.firstName, d.lastName, d.gender
ORDER BY d.gender DESC, d.lastName, d.firstName;
