ALTER TABLE facture DROP FOREIGN KEY facture_ibfk_1;
ALTER TABLE ligne_facture DROP FOREIGN KEY ligne_facture_ibfk_1;
ALTER TABLE ligne_facture DROP FOREIGN KEY ligne_facture_ibfk_2;
ALTER TABLE payement DROP FOREIGN KEY payement_ibfk_1;

DROP TABLE IF EXISTS ligue;
DROP TABLE IF EXISTS prestation;
DROP TABLE IF EXISTS facture;
DROP TABLE IF EXISTS ligne_facture;
DROP TABLE IF EXISTS payement;

create table ligue (
compte INT PRIMARY KEY NOT NULL,
intitule VARCHAR(64),
tresorier VARCHAR(64),
sport VARCHAR(64)
);

insert into ligue (compte, intitule, tresorier, sport) VALUES
(411007, 'Ligue Lorraine Escrime', 'Valérie LAHEURTE', 'escrime'),
(411008, 'Ligue Lorraine de FootBall', 'Pierre LENOIR', 'football'),
(411009, 'Ligue Lorraine de Basket', 'Mohamed BOURGARD', 'basket'),
(411010, 'Ligue de Baby-foot', 'Sylvain Delahousse', 'BABYFOOT');

create table prestation (
code VARCHAR(64) PRIMARY KEY NOT NULL,
libelle VARCHAR(64),
pu DECIMAL(10, 2)
);

insert into prestation (code, libelle, pu) VALUES
('AFFRAN', 'Affranchissement', 3.33),
('PHOTOCOULEUR', 'Photocopies couleur', 0.24),
('PHOTONetB', 'Photocopies Noir et Blanc', 0.055),
('TRACEUR', 'Utilisation du traceur', 0.356);

create table facture (
numfacture VARCHAR(64) PRIMARY KEY NOT NULL,
date VARCHAR(64),
echeance VARCHAR(64),
compte_ligue INT,
FOREIGN KEY (compte_ligue) REFERENCES ligue(compte)
);

insert into facture (numfacture, date, echeance, compte_ligue) VALUES
('FC 5218', '01/01/2012', '31/01/2012', 411010);

create table ligne_facture (
numfacture VARCHAR(64),
FOREIGN KEY (numfacture) REFERENCES facture(numfacture),
code_prestation VARCHAR(64),
FOREIGN KEY (code_prestation) REFERENCES prestation(code),
quantite INT,
montant_ttc DECIMAL(10, 2)
);

insert into ligne_facture (numfacture, code_prestation, quantite, montant_ttc) VALUES
('FC 5218', 'AFFRAN', 0, 0.00),
('FC 5218', 'PHOTOCOULEUR', 300, 72.00),
('FC 5218', 'PHOTONetB', 552, 30.36),
('FC 5218', 'TRACEUR', 1, 0.36);

create table payement (
numfacture VARCHAR(64),
total_ttc DECIMAL(10, 2),
FOREIGN KEY (numfacture) REFERENCES facture(numfacture)
);

insert into payement (numfacture, total_ttc) VALUES
('FC 5218', 102.72);