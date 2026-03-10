drop database if exists `MVC_Basics_2509AB`;
create database `MVC_Basics_2509AB`;
use `MVC_Basics_2509AB`;




create table smartphones
(
    id smallint unsigned not null auto_increment,
    merk varchar(50) not null,
    model varchar(50) not null,
    price decimal(6,2) not null,
    geheugen decimal(4,0) not null,
    besturingssysteem varchar(25) not null,
    schermgrootte decimal(3,2) not null,
    releasedatum date not null,
    megapixels decimal(3,0) not null,
    isactief bit not null default 1,
    opmerking varchar(255) null default null,
    datumaangemaakt datetime(6) not null default now(6),
    datumgewijzigd datetime(6) not null default now(6) on update now(6),
    constraint pk_smartphones_id primary key (id)
) engine=innoDB;




insert into smartphones 
(merk, model, price, geheugen, besturingssysteem, schermgrootte, releasedatum, megapixels, isactief, opmerking)
values
('Apple', 'iPhone 14 Pro Max', 1199.00, 256, 'iOS', 6.7, '2022-09-16', 48, 1, 'Topmodel van Apple met geavanceerde functies.'),
('Samsung', 'Galaxy S22 Ultra', 1099.00, 256, 'Android', 6.8, '2022-02-25', 108, 1, 'High-end smartphone met krachtige prestaties.'),
('Google', 'Pixel 7 Pro', 899.00, 128, 'Android', 6.7, '2022-10-13', 50, 1, 'Smartphone met uitstekende camera en pure Android-ervaring.'),
('OnePlus', 'OnePlus 10 Pro', 799.00, 256, 'Android', 6.7, '2022-01-11', 48, 1, 'Flagship smartphone met snelle prestaties en mooi design.'),
('Xiaomi', 'Mi 12 Pro', 699.00, 128, 'Android', 6.73, '2022-12-28', 50, 1, 'Krachtige smartphone met goede prijs-kwaliteitverhouding.');


CREATE TABLE Sneakers
(
    Id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Merk VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Type VARCHAR(25) NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerking VARCHAR(255) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
    CONSTRAINT PK_Sneakers_Id PRIMARY KEY (Id)
) ENGINE=InnoDB;

INSERT INTO Sneakers
(
    Merk,
    Model,
    Type
)
VALUES
('Nike', 'Air Jordan 1', 'Hardloop'),
('Adidas', 'Yeezy Boost 350', 'Basketbal'),
('New Balance', 'Pixel 9 Pro', 'Casual'),
('Trico', 'New Age', 'Casual'),
('Overlord', 'Tristar 6', 'Hardloop');


CREATE TABLE Horloges
(
    Id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Merk VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Prijs DECIMAL(6,0) NOT NULL,
    IsActief BIT NOT NULL DEFAULT 1,
    Opmerking VARCHAR(255) NULL DEFAULT NULL,
    DatumAangemaakt DATETIME(6) NOT NULL DEFAULT NOW(6),
    DatumGewijzigd DATETIME(6) NOT NULL DEFAULT NOW(6),
    CONSTRAINT PK_Horloges_Id PRIMARY KEY (Id)
) ENGINE=InnoDB;

INSERT INTO Horloges
(
    Merk,
    Model,
    Prijs
)
VALUES
('Rolex', 'Daytona 126500LN', 19800),
('Omega', 'Speedmaster Moonwatch Professional', 8500),
('Vacheron Constantin', 'Overseas Perpetual Calendar Ultra-Thin', 98000),
('Jaeger-LeCoultre', 'Reverso Tribute Duoface', 17000);
