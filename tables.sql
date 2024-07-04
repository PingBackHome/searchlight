-- Klanten Tabel
CREATE TABLE Klanten (
    klant_id SERIAL PRIMARY KEY,
    naam_bedrijf VARCHAR(255) NOT NULL,
    locatie_bedrijf VARCHAR(255),
    contact_persoon VARCHAR(255),
    functie VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    telefoonnummer VARCHAR(15),
    CONSTRAINT chk_telefoonnummer CHECK (telefoonnummer ~ '^[0-9]{10,15}$')
);

-- Software Tabel
CREATE TABLE Software (
    software_id SERIAL PRIMARY KEY,
    product_naam VARCHAR(255) NOT NULL,
    software_naam VARCHAR(255) NOT NULL,
    software_versie VARCHAR(50),
    release_date DATE,
    change_password DATE,
    licentie_verloop DATE,
    klant_id INTEGER REFERENCES Klanten(klant_id) ON DELETE SET NULL
);

-- IP Adressen en Hostnames Tabel
CREATE TABLE IP_Hostnames (
    id SERIAL PRIMARY KEY,
    ipv4_address INET,
    hostname VARCHAR(255),
    software_id INTEGER REFERENCES Software(software_id) ON DELETE CASCADE
);

-- Software Versies Tabel
CREATE TABLE Software_Versies (
    versie_id SERIAL PRIMARY KEY,
    software_id INTEGER REFERENCES Software(software_id) ON DELETE CASCADE,
    versie VARCHAR(50),
    release_date DATE,
    actief BOOLEAN DEFAULT TRUE
);

-- Indexen
CREATE INDEX idx_klant_id ON Software(klant_id);
CREATE INDEX idx_software_id ON IP_Hostnames(software_id);
CREATE UNIQUE INDEX idx_unique_ip_hostname ON IP_Hostnames(ipv4_address, hostname);
