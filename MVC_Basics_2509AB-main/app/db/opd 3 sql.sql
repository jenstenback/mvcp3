-- =========================================
-- DATABASE AANMAKEN
-- =========================================
DROP DATABASE IF EXISTS BankSys;
CREATE DATABASE BankSys;
USE BankSys;

-- =========================================
-- TABEL: Bank
-- =========================================
CREATE TABLE Bank (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Naam VARCHAR(100) NOT NULL,
    Telefoonnummer VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    Vestigingsdatum DATE,
    IsActief BOOLEAN NOT NULL DEFAULT TRUE,
    Opmerking TEXT,
    DatumAangemaakt DATETIME DEFAULT CURRENT_TIMESTAMP,
    DatumGewijzigd DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =========================================
-- TABEL: Klant
-- =========================================
CREATE TABLE Klant (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Voornaam VARCHAR(50) NOT NULL,
    Tussenvoegsel VARCHAR(20),
    Achternaam VARCHAR(50) NOT NULL,
    Geboortedatum DATE NOT NULL,
    Mobiel VARCHAR(20),
    Email VARCHAR(100) UNIQUE,
    IsActief BOOLEAN NOT NULL DEFAULT TRUE,
    Opmerking TEXT,
    DatumAangemaakt DATETIME DEFAULT CURRENT_TIMESTAMP,
    DatumGewijzigd DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =========================================
-- TUSSENTABEL: KlantBank (veel-op-veel oplossing)
-- =========================================
CREATE TABLE KlantBank (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    KlantId INT NOT NULL,
    BankId INT NOT NULL,
    DatumAangemaakt DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (KlantId) REFERENCES Klant(Id) ON DELETE CASCADE,
    FOREIGN KEY (BankId) REFERENCES Bank(Id) ON DELETE CASCADE
);

-- =========================================
-- TABEL: Rekening
-- =========================================
CREATE TABLE Rekening (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    KlantBankId INT NOT NULL,
    IBAN VARCHAR(34) NOT NULL UNIQUE,
    Rekeningnummer VARCHAR(20) NOT NULL UNIQUE,
    Rekeningtype VARCHAR(50) NOT NULL,
    Saldo DECIMAL(15,2) NOT NULL CHECK (Saldo >= 0),
    Openingsdatum DATE NOT NULL,
    IsActief BOOLEAN DEFAULT TRUE,
    Opmerking TEXT,
    DatumAangemaakt DATETIME DEFAULT CURRENT_TIMESTAMP,
    DatumGewijzigd DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY (KlantBankId) REFERENCES KlantBank(Id) ON DELETE CASCADE
);

-- =========================================
-- DATA INVULLEN (MINIMAAL 5 PER TABEL)
-- =========================================

-- BANKEN
INSERT INTO Bank (Naam, Telefoonnummer, Email, Vestigingsdatum) VALUES
('ING', '0201234567', 'info@ing.nl', '1990-01-01'),
('Rabobank', '0301234567', 'info@rabo.nl', '1985-05-01'),
('ABN AMRO', '0207654321', 'info@abn.nl', '1970-03-15'),
('SNS Bank', '0401231234', 'info@sns.nl', '1995-07-20'),
('ASN Bank', '0509876543', 'info@asn.nl', '2000-09-10');

-- KLANTEN
INSERT INTO Klant (Voornaam, Tussenvoegsel, Achternaam, Geboortedatum, Mobiel, Email) VALUES
('Jan', NULL, 'Jansen', '1990-02-10', '0612345678', 'jan@email.nl'),
('Piet', 'van', 'Dijk', '1985-06-15', '0623456789', 'piet@email.nl'),
('Sara', NULL, 'Meijer', '1992-09-20', '0634567890', 'sara@email.nl'),
('Emma', NULL, 'Visser', '1988-12-05', '0645678901', 'emma@email.nl'),
('Tom', NULL, 'Bakker', '1995-04-18', '0656789012', 'tom@email.nl');

-- KOPPELING KLANT-BANK
INSERT INTO KlantBank (KlantId, BankId) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

-- REKENINGEN
INSERT INTO Rekening (KlantBankId, IBAN, Rekeningnummer, Rekeningtype, Saldo, Openingsdatum) VALUES
(1,'NL01BANK0123456789','123456789','Betaalrekening',1500.00,'2022-01-01'),
(2,'NL02BANK0123456790','123456790','Spaarrekening',3000.00,'2021-05-10'),
(3,'NL03BANK0123456791','123456791','Betaalrekening',500.00,'2023-03-15'),
(4,'NL04BANK0123456792','123456792','Spaarrekening',4500.00,'2020-08-20'),
(5,'NL05BANK0123456793','123456793','Beleggingsrekening',10000.00,'2019-11-30');

-- =========================================
-- SELECT QUERY (GEVRAAGDE RESULTATEN)
-- =========================================
SELECT 
    CONCAT(
        k.Voornaam, ' ',
        IFNULL(CONCAT(k.Tussenvoegsel, ' '), ''),
        k.Achternaam
    ) AS VolledigeNaam,
    k.Geboortedatum,
    k.Mobiel,
    b.Naam AS Banknaam,
    r.IBAN,
    r.Rekeningnummer,
    r.Rekeningtype,
    r.Saldo,
    r.Openingsdatum
FROM Klant k
JOIN KlantBank kb ON k.Id = kb.KlantId
JOIN Bank b ON kb.BankId = b.Id
JOIN Rekening r ON kb.Id = r.KlantBankId;