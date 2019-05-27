SET DB_CLOSE_DELAY -1;         
;              
CREATE USER IF NOT EXISTS SA SALT '59240079f03b4b0d' HASH 'fd473cafc7e287d31924bb3e8a62d6524ff8e71a14cc75dcd0cba458cddadb63' ADMIN;            
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_4B94E0EF_3A9A_4084_B58F_2C405BBA00D8 START WITH 7 BELONGS_TO_TABLE;     
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_17993BB1_9DB4_4F35_99A0_0EADD1A63B94 START WITH 11 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_FED001F0_76E2_4EC9_8BB3_022F3B7E1BF6 START WITH 9 BELONGS_TO_TABLE;     
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_EA6F5AF7_7C7D_414C_87B1_FDD4F5A7CE44 START WITH 20 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_3C6EDB3F_105C_4236_80A8_155A8E5F513E START WITH 8 BELONGS_TO_TABLE;     
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_FB8FED4D_75B7_4BAE_896D_B5D42C700FA3 START WITH 19 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_C6DD8197_6091_46E7_90F5_56D71B1959A3 START WITH 15 BELONGS_TO_TABLE;    
CREATE MEMORY TABLE PUBLIC.CENTRE(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_3C6EDB3F_105C_4236_80A8_155A8E5F513E) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_3C6EDB3F_105C_4236_80A8_155A8E5F513E,
    ADRESSE VARCHAR(255),
    NOM VARCHAR(255),
    VILLE VARCHAR(255)
);
ALTER TABLE PUBLIC.CENTRE ADD CONSTRAINT PUBLIC.CONSTRAINT_7 PRIMARY KEY(ID);  
-- 7 +/- SELECT COUNT(*) FROM PUBLIC.CENTRE;   
INSERT INTO PUBLIC.CENTRE(ID, ADRESSE, NOM, VILLE) VALUES
(5, '46 rue Schubert', 'Gaillard', 'Caen'),
(1, '45 rue Dicaprio', 'Pitt', 'Nice'),
(2, '20 avenue Johnson', 'Michelet', 'Toulouse'),
(6, '14 avenue Washington', 'Albin', 'Toulouse'),
(3, '10 rue des troubadours', 'Franklin', 'Strasbourg'),
(4, '1 rue du ballon rouge', 'Oranger', 'Biarritz'),
(7, '15 impasse des souvenirs', 'Kooks', 'Biarritz');          
CREATE MEMORY TABLE PUBLIC.DONNEUR(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_17993BB1_9DB4_4F35_99A0_0EADD1A63B94) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_17993BB1_9DB4_4F35_99A0_0EADD1A63B94,
    AGE INTEGER NOT NULL,
    ANTECEDENTS INTEGER,
    ATTENTE BOOLEAN NOT NULL,
    CHEVEUX INTEGER,
    DISPONIBILITE BOOLEAN NOT NULL,
    LOISIRS INTEGER,
    NOM VARCHAR(255),
    PEAU INTEGER,
    POIDS INTEGER NOT NULL,
    PRENOM VARCHAR(255),
    SEXE BOOLEAN NOT NULL,
    SIGNALE BOOLEAN NOT NULL,
    TAILLE INTEGER NOT NULL,
    YEUX INTEGER,
    OWNER_ID INTEGER
);             
ALTER TABLE PUBLIC.DONNEUR ADD CONSTRAINT PUBLIC.CONSTRAINT_9 PRIMARY KEY(ID); 
-- 9 +/- SELECT COUNT(*) FROM PUBLIC.DONNEUR;  
INSERT INTO PUBLIC.DONNEUR(ID, AGE, ANTECEDENTS, ATTENTE, CHEVEUX, DISPONIBILITE, LOISIRS, NOM, PEAU, POIDS, PRENOM, SEXE, SIGNALE, TAILLE, YEUX, OWNER_ID) VALUES
(1, 26, 6, FALSE, 3, TRUE, 6, 'Martin', 1, 64, 'Thomas', FALSE, FALSE, 169, 3, 1),
(2, 78, 7, FALSE, 0, TRUE, 8, 'Arnaud', 1, 50, 'Louis', FALSE, FALSE, 120, 5, 1),
(3, 43, 4, TRUE, 3, TRUE, 3, 'Gluck', 0, 82, 'Larry', FALSE, FALSE, 169, 1, 3),
(7, 18, 1, FALSE, 1, TRUE, 1, 'Stark', 0, 50, 'Brandon', FALSE, FALSE, 100, 2, 7),
(4, 31, 5, TRUE, 2, TRUE, 5, 'Taglia', 1, 65, 'Anna', TRUE, TRUE, 176, 3, 5),
(5, 26, 3, FALSE, 0, TRUE, 7, 'Point', 3, 85, 'Elias', FALSE, FALSE, 192, 2, 2),
(8, 46, 1, FALSE, 1, TRUE, 2, 'Tully', 2, 68, 'Laura', TRUE, FALSE, 178, 3, 2),
(10, 31, 5, FALSE, 2, TRUE, 5, 'Bleach', 1, 65, 'Anita', TRUE, TRUE, 176, 3, 3),
(9, 45, 0, TRUE, 0, FALSE, 1, 'Davio', 1, 76, 'Gontrande', FALSE, FALSE, 45, 4, 1); 
CREATE MEMORY TABLE PUBLIC.MEDECIN(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_FB8FED4D_75B7_4BAE_896D_B5D42C700FA3) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_FB8FED4D_75B7_4BAE_896D_B5D42C700FA3,
    NOM VARCHAR(255),
    SEXE BOOLEAN NOT NULL,
    SPECIALISATION INTEGER,
    OWNER_ID INTEGER
);    
ALTER TABLE PUBLIC.MEDECIN ADD CONSTRAINT PUBLIC.CONSTRAINT_6 PRIMARY KEY(ID); 
-- 18 +/- SELECT COUNT(*) FROM PUBLIC.MEDECIN; 
INSERT INTO PUBLIC.MEDECIN(ID, NOM, SEXE, SPECIALISATION, OWNER_ID) VALUES
(1, 'Roche', TRUE, 0, 1),
(2, 'Bentle', FALSE, 2, 3),
(3, 'Sourire', FALSE, 0, 2),
(4, 'Pawlin', TRUE, 2, 2),
(5, 'Lannis', TRUE, 0, 5),
(15, 'Gregory', TRUE, 2, 6),
(16, 'Alpa', FALSE, 2, 6),
(6, 'Firmint', TRUE, 0, 4),
(17, 'Auvoir', TRUE, 0, 7),
(7, 'Audair', FALSE, 1, 5),
(18, 'Yvonne', FALSE, 2, 1),
(8, 'Lucir', FALSE, 0, 3),
(9, 'Cude', TRUE, 1, 4),
(10, 'Blanc', TRUE, 1, 1),
(11, 'Di', FALSE, 2, 4),
(12, 'Etoile', FALSE, 1, 6),
(13, 'Diverti', TRUE, 1, 1),
(14, 'Gynie', TRUE, 1, 2);      
CREATE MEMORY TABLE PUBLIC.NOTIFICATION(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_4B94E0EF_3A9A_4084_B58F_2C405BBA00D8) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_4B94E0EF_3A9A_4084_B58F_2C405BBA00D8,
    STATU INTEGER,
    DONNEUR_ID INTEGER,
    RECEVEUR_ID INTEGER
);              
ALTER TABLE PUBLIC.NOTIFICATION ADD CONSTRAINT PUBLIC.CONSTRAINT_A PRIMARY KEY(ID);            
-- 1 +/- SELECT COUNT(*) FROM PUBLIC.NOTIFICATION;             
INSERT INTO PUBLIC.NOTIFICATION(ID, STATU, DONNEUR_ID, RECEVEUR_ID) VALUES
(6, 0, 8, 2);       
CREATE MEMORY TABLE PUBLIC.RDV(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_C6DD8197_6091_46E7_90F5_56D71B1959A3) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_C6DD8197_6091_46E7_90F5_56D71B1959A3,
    HEURE INTEGER NOT NULL,
    JOUR INTEGER NOT NULL,
    MOIS INTEGER NOT NULL,
    DONNEUR_ID INTEGER,
    MEDECIN_ID INTEGER
);         
ALTER TABLE PUBLIC.RDV ADD CONSTRAINT PUBLIC.CONSTRAINT_1 PRIMARY KEY(ID);     
-- 9 +/- SELECT COUNT(*) FROM PUBLIC.RDV;      
INSERT INTO PUBLIC.RDV(ID, HEURE, JOUR, MOIS, DONNEUR_ID, MEDECIN_ID) VALUES
(6, 12, 1, 1, 1, 1),
(7, 14, 2, 3, 2, 1),
(8, 9, 18, 5, 3, 8),
(9, 15, 16, 11, 4, 5),
(10, 12, 12, 12, 5, 14),
(11, 18, 15, 3, 7, 17),
(12, 14, 14, 12, 8, 4),
(13, 14, 19, 6, 9, 18),
(14, 14, 14, 12, 10, 8);   
CREATE MEMORY TABLE PUBLIC.RECEVEUR(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_FED001F0_76E2_4EC9_8BB3_022F3B7E1BF6) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_FED001F0_76E2_4EC9_8BB3_022F3B7E1BF6,
    AGE INTEGER NOT NULL,
    NOM VARCHAR(255),
    PRENOM VARCHAR(255),
    SEXE BOOLEAN NOT NULL
);  
ALTER TABLE PUBLIC.RECEVEUR ADD CONSTRAINT PUBLIC.CONSTRAINT_F PRIMARY KEY(ID);
-- 8 +/- SELECT COUNT(*) FROM PUBLIC.RECEVEUR; 
INSERT INTO PUBLIC.RECEVEUR(ID, AGE, NOM, PRENOM, SEXE) VALUES
(5, 48, 'Renard', 'Francis', FALSE),
(6, 48, 'Martin', 'Christophe', FALSE),
(7, 35, 'Alerte', 'Aimery', FALSE),
(1, 84, 'Berry', 'Brigitte', TRUE),
(2, 38, 'Da', 'Dali', TRUE),
(3, 19, 'Cari', 'Delphine', TRUE),
(4, 24, 'Aro', 'Lili', TRUE),
(8, 19, 'Renatta', 'Julia', TRUE);           
CREATE MEMORY TABLE PUBLIC.UTILISATEUR(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_EA6F5AF7_7C7D_414C_87B1_FDD4F5A7CE44) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_EA6F5AF7_7C7D_414C_87B1_FDD4F5A7CE44,
    IDPROFILASSOCIE INTEGER NOT NULL,
    ISRECEVEUR BOOLEAN NOT NULL,
    MAIL VARCHAR(255),
    MDP VARCHAR(255)
);               
ALTER TABLE PUBLIC.UTILISATEUR ADD CONSTRAINT PUBLIC.CONSTRAINT_5 PRIMARY KEY(ID);             
-- 17 +/- SELECT COUNT(*) FROM PUBLIC.UTILISATEUR;             
INSERT INTO PUBLIC.UTILISATEUR(ID, IDPROFILASSOCIE, ISRECEVEUR, MAIL, MDP) VALUES
(1, 1, FALSE, 'tom', 'tommar'),
(2, 1, TRUE, 'brig', 'berry'),
(3, 2, FALSE, 'louloudu79', 'loulou'),
(4, 3, FALSE, 'superlarry', '1234'),
(5, 4, FALSE, 'anna', 'taglia'),
(6, 2, TRUE, 'dalida', 'dalida'),
(7, 5, FALSE, 'elias', 'point'),
(8, 3, TRUE, 'delphi', 'so'),
(10, 7, FALSE, 'bthebroken', 'king'),
(11, 4, TRUE, 'lil.aro', 'lil'),
(12, 5, TRUE, 'francis', 'rere'),
(13, 6, TRUE, 'chris.m', 'receveur4ever'),
(14, 7, TRUE, 'aim.ri', 'aalerte'),
(15, 8, FALSE, 'laulau', 'lautully'),
(16, 8, TRUE, 'juju', 'jujulove'),
(17, 9, FALSE, 'gontrande', 'monmotdepasse'),
(18, 10, FALSE, 'anitab', '0000');               
ALTER TABLE PUBLIC.NOTIFICATION ADD CONSTRAINT PUBLIC.FKAEXHYK31QAG3SF0C4LWV6DPC5 FOREIGN KEY(DONNEUR_ID) REFERENCES PUBLIC.DONNEUR(ID) NOCHECK;               
ALTER TABLE PUBLIC.RDV ADD CONSTRAINT PUBLIC.FKPCFVLYV97JF3TIWGBSQ2B71MR FOREIGN KEY(DONNEUR_ID) REFERENCES PUBLIC.DONNEUR(ID) NOCHECK;        
ALTER TABLE PUBLIC.RDV ADD CONSTRAINT PUBLIC.FKSJVIYMT7HVM6QQBR0P1HXL0T4 FOREIGN KEY(MEDECIN_ID) REFERENCES PUBLIC.MEDECIN(ID) NOCHECK;        
ALTER TABLE PUBLIC.DONNEUR ADD CONSTRAINT PUBLIC.FKJ8QTRC1588GU5L4KUXRK4EFB3 FOREIGN KEY(OWNER_ID) REFERENCES PUBLIC.CENTRE(ID) NOCHECK;       
ALTER TABLE PUBLIC.MEDECIN ADD CONSTRAINT PUBLIC.FK30SJW8WA1WKDAW1QTS0PNOFW4 FOREIGN KEY(OWNER_ID) REFERENCES PUBLIC.CENTRE(ID) NOCHECK;       
ALTER TABLE PUBLIC.NOTIFICATION ADD CONSTRAINT PUBLIC.FK5RB0RJT7ARPNL6OWNSJS6S5XP FOREIGN KEY(RECEVEUR_ID) REFERENCES PUBLIC.RECEVEUR(ID) NOCHECK;             
