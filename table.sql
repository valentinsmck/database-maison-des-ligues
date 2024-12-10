drop table if EXISTS ligue;
drop table if EXISTS prestation;
drop table if EXISTS facture;
drop table if EXISTS ligne_facture;
drop table if EXISTS payement;

create table ligue(
compte integer(64) PRIMARY KEY NOT NULL,
intitule varchar(64),
tresorier varchar(64),
sport varchar(64)
);

insert into ligue(compte,intitule,tresorier,sport) values 
(411007,"Ligue Lorraine Escrime","Valérie LAHEURTE","escrime"),
(411008,"Ligue Lorraine de FootBall","Pierre LENOIR","football"),
(411009,"Ligue Lorraine de Basket","Mohamed BOURGARD","basket"),
(411010,"Ligue de Baby-foot","Sylvain Delahousse","BABYFOOT");

create table prestation(
code varchar(64) PRIMARY KEY NOT NULL,
libelle varchar(64),
pu integer(64)
);

insert into prestation(code,libelle,pu) values
("AFFRAN","Affranchissement",3.330),
("PHOTOCOULEUR","Photocopies couleur",0.240),
("PHOTONetB","Photocopies Noir et Blanc",0.055),
("TRACEUR","Utilisation du traceur",0.356);

create table facture(
numfacture varchar(64) PRIMARY KEY NOT NULL,
date varchar(64),
echeance varchar(64),
compte_ligue integer(64),
foreign key (compte_ligue) references ligue(compte)
);

insert into facture(numfacture,date,echeance,compte_ligue) values
("FC 5218","01/01/2012","31/01/2012",411010);

create table ligne_facture(
numfacture varchar(64),
foreign key (numfacture) references facture(numfacture),
code_prestation varchar(64),
foreign key (code_prestation) references prestation(code),
quantite integer(64),
montant_ttc integer (64)
);

insert into ligne_facture(numfacture,code_prestation,quantite,montant_ttc) values
("FC 5218","AFFRAN",0,0),
("FC 5218","PHOTOCOULEUR",300,72),
("FC 5218","PHOTON&B",552,30.36),
("FC 5218","TRACEUR",1,0.36);

create table payement(
numfacture varchar(64),
total_ttc integer,
foreign key (numfacture) references facture(numfacture)
);

insert into payement(numfacture,total_ttc) values
("FC 5218",102.72);