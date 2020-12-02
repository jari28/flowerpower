DROP DATABASE IF EXISTS flowerpower;
-- create new db
CREATE DATABASE flowerpower;

-- select project 1 as the default database
USE flowerpower;



CREATE TABLE klant(
	klantcode VARCHAR(5),
	voorletters VARCHAR(20),
	tussenvoegsels VARCHAR(20),
	achternaam VARCHAR(20),
	adres VARCHAR(35),
	postcode VARCHAR(6),
	woonplaats VARCHAR(20),
	geboortedatum DATE,
	gebruikersnaam VARCHAR(20),
	Wachtwoord VARCHAR(250),
	PRIMARY KEY (klantcode)
);

CREATE TABLE artikel(
    artikelcode VARCHAR(10),
    artikel VARCHAR(20),
    prijs VARCHAR(3),
    PRIMARY KEY (artikelcode)
);

CREATE TABLE factuur(
    factuurnummer VARCHAR(3),
    factuurdatum DATE,
    klantcode VARCHAR(5)
    PRIMARY KEY(factuurnummer),
    FOREIGN KEY(klantcode) REFERENCES klant(klantcode)
);

CREATE TABLE factuurregel(
    factuurnummer VARCHAR(3),
    factuurdatum DATE,
    aantal INT(3),
    prijs INT(3),
    PRIMARY KEY(factuurnummer) REFERENCES factuur(factuurnummer),
    FOREIGN KEY(artikelcode) REFERENCES artikel(artikelcode)
);

CREATE TABLE bestelling(
	artikelcode VARCHAR(10),
	winkelcode VARCHAR(10),
	aantal VARCHAR(20),
	klantcode VARCHAR(10),
	medewerkerscode VARCHAR(10),
	afgehaald INT,
	FOREIGN KEY(artikelcode) REFERENCES artikel(artikelcode),
    FOREIGN KEY(winkelcode) REFERENCES winkel(winkelcode),
    FOREIGN KEY(klantcode) REFERENCES klant(klantcode),
    FOREIGN KEY(medewerkerscode) REFERENCES medewerker(medewerkerscode)
);

CREATE TABLE winkel(
	winkelcode VARCHAR(10),
	winkelnaam VARCHAR(20),
	winkeladres VARCHAR(35),
	winkelpostcode VARCHAR(6),
	vestigingsplaats VARCHAR(20),
	telefoonnummer VARCHAR(15),
	PRIMARY KEY (winkelcode)
);

CREATE TABLE medewerker(
    medewerkerscode VARCHAR(5),
    voorletters VARCHAR(25),
    voorvoegsels VARCHAR(25),
    achternaam VARCHAR(25),
    gebruikersnaam VARCHAR(25),
    wachtwoord VARCHAR(250),
    PRIMARY KEY(medewerkerscode)
);
