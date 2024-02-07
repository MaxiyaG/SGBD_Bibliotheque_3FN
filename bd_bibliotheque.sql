/**
 * fichier : bd_bibliotheque_93.sql
 * auteur : GUNDUZ Maxime
 * date : 2024
 * information : Contient l'ensemble des code SQL pour satisfaire les demande du projet SGBD.
 */


/**
* CREATION DE TABLES
*/

/* Table Livre (T1) */
CREATE TABLE Livre (
    code_catalogue VARCHAR(25) PRIMARY KEY,
    titre VARCHAR(50) NOT NULL
);

/* Table Abonne (T4) */
CREATE TABLE Abonne (
    num_matricule VARCHAR(25) PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    adresse VARCHAR(150) NOT NULL,
    telephone VARCHAR(50) UNIQUE,
    date_adhesion DATE NOT NULL,
    date_naissance DATE NOT NULL,
    categorie_professionnelle VARCHAR(50) NOT NULL,
    date_fin_abonnement DATE NOT NULL,
    statut_abonnement BOOLEAN NOT NULL
);

/* Table Exemplaire (T3) */
CREATE TABLE Exemplaire(
    id_exemplaire VARCHAR(25) PRIMARY KEY,
    code_catalogue VARCHAR(25),
    etat_usure INT NOT NULL,
    date_acquisition DATE NOT NULL,
    CONSTRAINT FOREIGN KEY(code_catalogue) REFERENCES Livre(code_catalogue)
);

/* Table Rayon (T2) */
CREATE TABLE Rayon (
    code_rayon VARCHAR(25) PRIMARY KEY,
    id_exemplaire VARCHAR(25) NOT NULL,
    rayon VARCHAR(15) NOT NULL,
    CONSTRAINT FOREIGN KEY(id_exemplaire) REFERENCES Exemplaire(id_exemplaire)
);


/* Table Pret (T5) */
CREATE TABLE Pret (
    id_pret VARCHAR(15) PRIMARY KEY,
    num_matricule VARCHAR(25),
    id_exemplaire VARCHAR(25),
    date_pret DATE NOT NULL,
    date_retour DATE NOT NULL,
    pret_actif BOOLEAN NOT NULL,
    est_en_retard BOOLEAN NOT NULL,
    CONSTRAINT FOREIGN KEY(num_matricule) REFERENCES Abonne(num_matricule),
    CONSTRAINT FOREIGN KEY(id_exemplaire) REFERENCES Exemplaire(id_exemplaire)
);

/* Table Demande (T6) */
CREATE TABLE Demande (
    id_demande VARCHAR(25) PRIMARY KEY,
    priorite INT NOT NULL,
    date_demande DATE NOT NULL,
    num_matricule VARCHAR(25),
    code_catalogue VARCHAR(25) NOT NULL,
    CONSTRAINT FOREIGN KEY(num_matricule) REFERENCES Abonne(num_matricule),
    CONSTRAINT FOREIGN KEY(code_catalogue) REFERENCES Livre(code_catalogue)
);

/* Table Demandes_Abonne (T7) */
CREATE TABLE Demandes_Abonne (
    num_matricule VARCHAR(25) NOT NULL,
    code_catalogue VARCHAR(25) NOT NULL,
    id_demande VARCHAR(25) NOT NULL,
    CONSTRAINT FOREIGN KEY(num_matricule) REFERENCES Abonne(num_matricule),
    CONSTRAINT FOREIGN KEY(code_catalogue) REFERENCES Livre(code_catalogue),
    CONSTRAINT FOREIGN KEY(id_demande) REFERENCES Demande(id_demande),
    PRIMARY KEY (num_matricule, code_catalogue, id_demande)
);



/* Table MotCles (T8) */
CREATE TABLE MotCles (
    id_mots_cles VARCHAR(25) PRIMARY KEY,
    mots_cles VARCHAR(50) NOT NULL,
    code_catalogue VARCHAR(25),
    CONSTRAINT FOREIGN KEY(code_catalogue) REFERENCES Livre(code_catalogue)
);

/* Table Editeur (T9) */
CREATE TABLE Editeur (
    id_editeur VARCHAR(25) PRIMARY KEY,
    editeur VARCHAR(50) NOT NULL,
    code_catalogue VARCHAR(25),
    CONSTRAINT FOREIGN KEY(code_catalogue) REFERENCES Livre(code_catalogue)
);

/* Table Auteur (T10) */
CREATE TABLE Auteur (
    id_auteur VARCHAR(25) PRIMARY KEY,
    auteur VARCHAR(50) NOT NULL,
    code_catalogue VARCHAR(25),
    CONSTRAINT FOREIGN KEY(code_catalogue) REFERENCES Livre(code_catalogue)
);

/* Table Genre (T11) */
CREATE TABLE Genre (
    id_genre VARCHAR(25) PRIMARY KEY,
    genre VARCHAR(50) NOT NULL,
    code_catalogue VARCHAR(25),
    CONSTRAINT FOREIGN KEY(code_catalogue) REFERENCES Livre(code_catalogue)
);



/**
* INSERTION DES DONNEES DANS LES TABLES
*/

/* Insertion des livre */
INSERT INTO Livre (code_catalogue, titre) VALUES 
('A', 'aaaa'),
('B', 'bbbb'),
('C', 'cccc'),
('D', 'dddd'),
('E', 'eeee'),
('F', 'ffff'),
('G', 'gggg'),
('H', 'hhhh'),
('I', 'iiii'),
('J', 'jjjj'),
('K', 'kkkk'),
('L', 'llll'),
('M', 'mmmm'),
('N', 'nnnn'),
('O', 'oooo'),
('P', 'pppp'),
('Q', 'qqqq'),
('R', 'rrrr'),
('S', 'ssss'),
('T', 'tttt');

/* INSERTION DES ABONNES */
INSERT INTO Abonne (num_matricule, nom, adresse, telephone, date_adhesion, date_naissance, categorie_professionnelle, date_fin_abonnement, statut_abonnement) VALUES 
('M001', 'toto', '1 rue de liberté', '0123456791', '2022-02-01', '1980-09-05', 'journaliste', '2023-02-01', FALSE),
('M002', 'tata', '2 rue de liberté', '0123456792', '2022-02-01', '2000-09-05', 'etudiant', '2024-02-01', TRUE),
('M003', 'titi', '3 rue de la liberté', '0123456793', '2023-02-01', '2017-11-12', 'enfant', '2024-02-01', TRUE),
('M004', 'tutu', '4 rue de la liberté', '0123456794', '2023-02-01', '1978-06-30', 'médecin', '2024-02-01', TRUE),
('M005', 'tete', '5 rue de la liberté', '0123456795', '2023-02-01', '1992-01-25', 'architecte', '2024-02-01', TRUE),
('M006', 'tyty', '6 rue de la liberté', '0123456796', '2023-02-01', '1983-03-17', 'avocat', '2024-02-01', TRUE),
('M007', 'toutou', '7 rue de la liberté', '0123456797', '2023-02-01', '1990-07-19', 'dentiste', '2024-02-01', TRUE),
('M008', 'tatai', '8 rue de la liberté', '0123456798', '2023-02-01', '1986-04-05', 'ingénieur', '2024-02-01', TRUE),
('M009', 'tutai', '9 rue de la liberté', '0123456799', '2023-02-01', '1991-02-14', 'professeur', '2024-02-01', TRUE),
('M010', 'titai', '10 rue de la liberté', '0123456710', '2023-02-01', '1979-08-21', 'informaticien', '2024-02-01', TRUE),
('M011', 'tonton', '11 rue de la liberté', '0123456711', '2023-02-01', '1982-12-11', 'chef', '2024-02-01', TRUE),
('M012', 'tintin', '12 rue de la liberté', '0123456712', '2023-02-01', '1988-09-09', 'pilote', '2024-02-01', TRUE),
('M013', 'tulipe', '13 rue de la liberté', '0123456713', '2023-02-01', '1975-05-25', 'peintre', '2024-02-01', TRUE),
('M014', 'terter', '14 rue de la liberté', '0123456714', '2023-02-01', '1993-10-31', 'musicien', '2024-02-01', TRUE),
('M015', 'totoro', '15 rue de la liberté', '0123456715', '2023-02-01', '1981-01-01', 'acteur', '2024-02-01', TRUE),
('M016', 'titine', '16 rue de la liberté', '0123456716', '2023-02-01', '1994-06-18', 'écrivain', '2024-02-01', TRUE),
('M017', 'tactic', '17 rue de la liberté', '0123456717', '2023-02-01', '1972-03-08', 'réalisateur', '2024-02-01', TRUE),
('M018', 'tictac', '18 rue de la liberté', '0123456718', '2023-02-01', '1976-07-22', 'photographe', '2024-02-01', TRUE),
('M019', 'tacit', '19 rue de la liberté', '0123456719', '2023-02-01', '1995-11-30', 'graphiste', '2024-02-01', TRUE),
('M020', 'tululu', '20 rue de la liberté', '0123456720', '2023-02-01', '1996-02-29', 'journaliste', '2024-02-01', TRUE);

/* INSERTION DES EXEMPLAIRES */
INSERT INTO Exemplaire (id_exemplaire, code_catalogue, etat_usure, date_acquisition) VALUES 
('EX001', 'A', 0, '2023-01-01'),
('EX002', 'A', 1, '2023-02-01'),
('EX003', 'A', 2, '2023-03-01'),
('EX004', 'B', 0, '2023-04-01'),
('EX005', 'B', 1, '2023-05-01'),
('EX006', 'B', 2, '2023-06-01'),  
('EX007', 'C', 0, '2023-07-01'),
('EX008', 'C', 1, '2023-08-01'),
('EX009', 'C', 2, '2023-09-01'),
('EX010', 'D', 0, '2023-10-01'),
('EX011', 'D', 1, '2023-11-01'),
('EX012', 'D', 2, '2023-12-01'),
('EX013', 'E', 0, '2024-01-01'),
('EX014', 'E', 1, '2024-02-01'),
('EX015', 'E', 2, '2024-03-01'),
('EX016', 'F', 0, '2024-04-01'),
('EX017', 'F', 1, '2024-05-01'),
('EX018', 'F', 3, '2024-06-01'),
('EX019', 'G', 0, '2024-07-01'),
('EX020', 'G', 1, '2024-08-01');

/* INSERTION DES RAYONS */

INSERT INTO Rayon (code_rayon, id_exemplaire, rayon) VALUES 
('R001', 'EX001', 'Litterature'),
('R002', 'EX002', 'Science-fiction'),
('R003', 'EX003', 'Poesie'),
('R004', 'EX004', 'Theatre'),
('R005', 'EX005', 'Biographie'),
('R006', 'EX006', 'Histoire'),
('R007', 'EX007', 'Aventure'),
('R008', 'EX008', 'Fantastique'),
('R009', 'EX009', 'Roman'),
('R010', 'EX010', 'Nouvelle'),
('R011', 'EX011', 'Essai'),
('R012', 'EX012', 'Manga'),
('R013', 'EX013', 'Politique'),
('R014', 'EX014', 'Religion'),
('R015', 'EX015', 'Sport'),
('R016', 'EX016', 'Art'),
('R017', 'EX017', 'Musique'),
('R018', 'EX018', 'Cuisine'),
('R019', 'EX019', 'Voyage'),
('R020', 'EX020', 'Technologie');

/* INSERTION DES PRETS */
INSERT INTO Pret (id_pret, num_matricule, id_exemplaire, date_pret, date_retour, pret_actif, est_en_retard) VALUES 
('P001', 'M002', 'EX001', '2022-02-10', '2022-02-24', true, false),
('P002', 'M002', 'EX002', '2023-03-15', '2023-03-29', true, false),
('P003', 'M002', 'EX003', '2023-01-20', '2023-05-04', false, false),
('P004', 'M004', 'EX004', '2023-05-25', '2023-06-08', true, false),
('P005', 'M005', 'EX005', '2023-06-30', '2023-07-14', true, false),
('P006', 'M006', 'EX006', '2023-07-05', '2023-07-19', true, false),
('P007', 'M007', 'EX007', '2023-08-10', '2023-08-24', true, false),
('P008', 'M008', 'EX008', '2023-09-15', '2023-09-29', true, false),
('P009', 'M009', 'EX009', '2023-10-20', '2023-11-03', true, false),
('P010', 'M010', 'EX010', '2023-11-25', '2023-12-09', true, false),
('P011', 'M011', 'EX011', '2023-12-30', '2024-01-13', true, false),
('P012', 'M012', 'EX012', '2024-01-05', '2024-01-19', true, false),
('P013', 'M013', 'EX013', '2024-02-10', '2024-02-24', true, false),
('P014', 'M014', 'EX014', '2024-03-15', '2024-03-29', true, false),
('P015', 'M015', 'EX015', '2024-04-20', '2024-05-04', true, false),
('P016', 'M016', 'EX016', '2024-05-25', '2024-06-08', true, false),
('P017', 'M017', 'EX017', '2024-06-30', '2024-07-14', true, false),
('P018', 'M018', 'EX018', '2024-07-05', '2024-07-19', true, false),
('P019', 'M001', 'EX019', '2022-09-15', '2022-09-29', true, true),
('P020', 'M001', 'EX020', '2022-09-15', '2022-09-29', false, true),
('P021', 'M001', 'EX017', '2022-09-15', '2022-09-29', true, true);

/* INSERTION DES DEMANDES */
INSERT INTO Demande (id_demande, priorite, date_demande, num_matricule, code_catalogue) VALUES 
('D001', 2, '2023-02-15', 'M002', 'A'),
('D002', 1, '2023-03-20', 'M002', 'B'),
('D003', 6, '2023-04-25', 'M003', 'C'),
('D004', 4, '2023-05-30', 'M004', 'D'),
('D005', 5, '2023-06-30', 'M005', 'E'),
('D006', 2, '2023-07-30', 'M006', 'F'),
('D007', 3, '2023-08-30', 'M007', 'G'),
('D008', 5, '2023-09-30', 'M008', 'H'),
('D009', 1, '2023-10-30', 'M009', 'I'),
('D010', 10, '2023-11-30', 'M010', 'J'),
('D011', 9, '2023-12-30', 'M011', 'K'),
('D012', 7, '2024-01-30', 'M012', 'L'),
('D013', 5, '2024-02-28', 'M013', 'M'),
('D014', 7, '2024-03-30', 'M014', 'N'),
('D015', 8, '2024-04-30', 'M015', 'O'),
('D016', 9, '2024-05-30', 'M016', 'P'),
('D017', 10, '2024-06-30', 'M017', 'Q'),
('D018', 10, '2024-07-30', 'M018', 'R'),
('D019', 2, '2024-08-30', 'M019', 'S'),
('D020', 9, '2024-09-30', 'M020', 'A');

/* INSERTION DES DEMANDES_ABONNE */
INSERT INTO Demandes_Abonne (num_matricule, code_catalogue, id_demande) VALUES 
('M002', 'A', 'D001'),
('M002', 'B', 'D002'),
('M003', 'C', 'D003'),
('M004', 'D', 'D004'),
('M005', 'E', 'D005'),
('M006', 'F', 'D006'),
('M007', 'G', 'D007'),
('M008', 'H', 'D008'),
('M009', 'I', 'D009'),
('M010', 'J', 'D010'),
('M011', 'K', 'D011'),
('M012', 'L', 'D012'),
('M013', 'M', 'D013'),
('M014', 'N', 'D014'),
('M015', 'O', 'D015'),
('M016', 'P', 'D016'),
('M017', 'Q', 'D017'),
('M018', 'R', 'D018'),
('M019', 'S', 'D019'),
('M020', 'A', 'D020');

/* INSERTION DES MOTS CLÉS */
INSERT INTO MotCles (id_mots_cles, mots_cles, code_catalogue) VALUES 
('MC001', 'livre', 'A'),
('MC002', 'histoire', 'A'),
('MC003', 'roman', 'C'),
('MC004', 'poesie', 'D'),
('MC005', 'theatre', 'E'),
('MC006', 'biographie', 'F'),
('MC007', 'essai', 'G'),
('MC008', 'science-fiction', 'H'),
('MC009', 'polar', 'I'),
('MC010', 'jeunesse', 'J'),
('MC011', 'BD', 'K'),
('MC012', 'manga', 'L'),
('MC013', 'album', 'M'),
('MC014', 'musique', 'N'),
('MC015', 'cinema', 'O'),
('MC016', 'photographie', 'P'),
('MC017', 'voyage', 'Q'),
('MC018', 'mode', 'R'),
('MC019', 'documentaire', 'S'),
('MC020', 'architecture', 'T');

/* INSERTION DES EDITEURS */
INSERT INTO Editeur (id_editeur, editeur, code_catalogue) VALUES 
('ED001', 'do', 'A'),
('ED002', 're', 'B'),
('ED003', 'mi', 'C'),
('ED004', 'sa', 'D'),
('ED005', 'so', 'E'),
('ED006', 'la', 'F'),
('ED007', 'si', 'G'),
('ED008', 'no', 'H'),
('ED009', 'to', 'I'),
('ED010', 'me', 'J'),
('ED011', 'de', 'K'),
('ED012', 'red', 'L'),
('ED013', 'green', 'M'),
('ED014', 'yellow', 'N'),
('ED015', 'purple', 'O'),
('ED016', 'gray', 'P'),
('ED017', 'blue', 'Q'),
('ED018', 'white', 'R'),
('ED019', 'black', 'S'),
('ED020', 'pink', 'T');

/* INSERTION DES AUTEURS */
INSERT INTO Auteur (id_auteur, auteur, code_catalogue) VALUES 
('AU001', 'sisi', 'A'),
('AU002', 'soso', 'B'),
('AU003', 'sasa', 'C'),
('AU004', 'shom', 'D'),
('AU005', 'sham', 'E'),
('AU006', 'sato', 'F'),
('AU007', 'satu', 'G'),
('AU008', 'setu', 'H'),
('AU009', 'seshu', 'I'),
('AU010', 'seres', 'J'),
('AU011', 'seras', 'K'),
('AU012', 'sesha', 'L'),
('AU013', 'sasha', 'M'),
('AU014', 'sarah', 'N'),
('AU015', 'sli', 'O'),
('AU016', 'sla', 'P'),
('AU017', 'syl', 'Q'),
('AU018', 'spo', 'R'),
('AU019', 'sazerty', 'S'),
('AU020', 'sqzerty', 'T');

/* INSERTION DES GENRES */
INSERT INTO Genre (id_genre, genre, code_catalogue) VALUES 
('GE001', 'romance', 'A'),
('GE002', 'polar', 'B'),
('GE003', 'science-fiction', 'C'),
('GE004', 'horreur', 'D'),
('GE005', 'fantastique', 'E'),
('GE006', 'glauque', 'F'),
('GE007', 'biographie', 'G'),
('GE008', 'histoire', 'H'),
('GE009', 'roman', 'I'),
('GE010', 'poesie', 'J'),
('GE011', 'theatre', 'K'),
('GE012', 'bd', 'L'),
('GE013', 'jeunesse', 'M'),
('GE014', 'album', 'N'),
('GE015', 'musique', 'O'),
('GE016', 'cinema', 'P'),
('GE017', 'photographie', 'Q'),
('GE018', 'voyage', 'R'),
('GE019', 'mode', 'S'),
('GE020', 'manga', 'T');

/*
*#####################################################
* Cinq requêtes de jointure impliquant deux tables 
*#####################################################
*/ 

/* Obtenir le genre du livre qui a le titre "aaaa" */

SELECT genre FROM 
Genre INNER JOIN Livre ON Genre.code_catalogue = livre.code_catalogue
Where titre = "aaaa"; 

/* Obtenir tout les exemplaire du livre qui a le titre "aaaa" */

SELECT * FROM
Exemplaire INNER JOIN Livre ON Exemplaire.code_catalogue = Livre.code_catalogue
WHERE titre = "aaaa"; 

/* Obtenir le nom de editeurs qui a publier le livre ayant pour titre "cccc" */

SELECT editeur FROM
Editeur INNER JOIN Livre ON Editeur.code_catalogue = Livre.code_catalogue
WHERE titre = "cccc";

/* Obtenir le titre les tire de livre qui ont l'un des mots clé suivant : "livre, histoire, roman  " */

SELECT DISTINCT titre
FROM Livre
INNER JOIN MotCles ON MotCles.code_catalogue = Livre.code_catalogue
WHERE MotCles.mots_cles IN ('livre', 'histoire', 'roman');

/* Obtenir tout les prêts finalisés par l'abonné nommé "toto" qui ont été rendus en retard */

SELECT id_pret, date_pret, date_retour
FROM Pret
INNER JOIN Abonne ON Pret.num_matricule = Abonne.num_matricule
WHERE nom = 'toto' AND pret_actif = false AND est_en_retard = true;


/*
*#####################################################
* Cinq requêtes de jointure impliquant trois tables
*#####################################################
*/ 

/* Obtenir les code_catalogue et les ID exemplaire des livre emprunter et non rendu par l'abonné nommé "toto" */

SELECT Exemplaire.code_catalogue, Exemplaire.id_exemplaire
FROM Pret
INNER JOIN Abonne ON Pret.num_matricule = Abonne.num_matricule
INNER JOIN Exemplaire ON Pret.id_exemplaire = Exemplaire.id_exemplaire
WHERE nom = 'toto' AND pret_actif = true;

/* Obtenir les titres des livre demander par l'abonne nommé "titi" */

SELECT titre
FROM Demande
INNER JOIN Abonne ON Demande.num_matricule = Abonne.num_matricule
INNER JOIN Livre ON Demande.code_catalogue = Livre.code_catalogue
WHERE nom = 'titi';

/* Obtenir le titre des livre qui ce trouve dans le rayon "Littérature" */

SELECT titre 
FROM Livre 
INNER JOIN Exemplaire ON Exemplaire.code_catalogue = Livre.code_catalogue
INNER JOIN Rayon ON Rayon.id_exemplaire = Exemplaire.id_exemplaire
WHERE rayon = "Litterature";

/* Obtenir la date d'acquisition des exemplaire de livre écrite par l'auteur nommé "satu" */

SELECT DISTINCT Exemplaire.date_acquisition
FROM Exemplaire
INNER JOIN Livre ON Exemplaire.code_catalogue = Livre.code_catalogue
INNER JOIN Auteur ON Livre.code_catalogue = Auteur.code_catalogue
WHERE Auteur.auteur = 'satu';

/* Obtenir les noms des auteurs qui ont ecrit un livre du genre romance */

SELECT auteur 
FROM Auteur
INNER jOIN Livre ON Auteur.code_catalogue = Livre.code_catalogue
INNER jOIN Genre ON Genre.code_catalogue = Livre.code_catalogue
WHERE genre = "romance"; 

/*
*#####################################################
* Trois requêtes comportant une négation
*#####################################################
*/ 

/* Obtenir tout les abonnées qui n'ont pas emprunter de livre */

SELECT DISTINCT nom
FROM Abonne
WHERE NOT EXISTS (
    SELECT *
    FROM Pret
    WHERE Abonne.num_matricule = Pret.num_matricule
);

/* Obtenir tout les exemplaire qui sont actuellement disponible a la bibliotheque (Non preté et disponible)*/

SELECT DISTINCT id_exemplaire
FROM Exemplaire
WHERE NOT EXISTS (
    SELECT *
    FROM Pret
    WHERE Exemplaire.id_exemplaire = Pret.id_exemplaire
    AND pret_actif = true
);

/* Obtenir les titre et les code_catalogue des livres qui n'ont pas étais demandé par les abonnées : */

SELECT DISTINCT titre, code_catalogue
FROM Livre 
WHERE NOT EXISTS (
    SELECT *
    FROM Demande 
    WHERE Livre.code_catalogue = Demande.code_catalogue
);

/*
*#####################################################
* Quatre requêtes SQL dont chacune comportera : MAX, AVG, SUM et BETWEEN
*#####################################################
*/ 

/* Obtenir la plus grande priorité des demandes */

SELECT MAX(priorite) FROM Demande;

/* Obtenir la moyenne d'état d'usure des exemplaires des livres */

SELECT AVG(etat_usure) FROM Exemplaire;

/* Obtenir la somme des priorité des demandes*/

SELECT SUM(priorite) FROM Demande;

/* Obtenir les exemplaire ayant une date d'acquisition entre le 1er Juillet 2023 et le 1er septembre 2023 */

SELECT * FROM Exemplaire
WHERE date_acquisition BETWEEN '2023-07-01' AND '2023-09-01';
