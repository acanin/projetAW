SET DB_CLOSE_DELAY -1;         
;              
CREATE USER IF NOT EXISTS SA SALT '1421609708b95c85' HASH '451d03bb69df54113feeaf6d81446db5fc5243564d9d8faede11b98e5cb75760' ADMIN;            
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_0C94006F_DE93_4F62_B66B_1751B85A4DCC START WITH 1 BELONGS_TO_TABLE;     
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_33AF5438_FF1A_48B5_BE9B_ADB257C17804 START WITH 2 BELONGS_TO_TABLE;     
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_4F23D7E7_4F2B_4782_8545_BA02C529BED0 START WITH 2 BELONGS_TO_TABLE;     
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_0B44D20E_8A1F_4793_A465_C36936D0A7C6 START WITH 2 BELONGS_TO_TABLE;     
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_9D7C4174_65C2_4F6B_B947_82EFD4BF0878 START WITH 3 BELONGS_TO_TABLE;     
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_8D1986EF_D3EC_4902_9C87_ED5AAC30B842 START WITH 1 BELONGS_TO_TABLE;     
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_9457AE31_C4DD_4826_9C27_A0D3550E9D24 START WITH 2 BELONGS_TO_TABLE;     
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_0992A3B8_5E42_4732_8070_37D93A1604BA START WITH 2 BELONGS_TO_TABLE;     
CREATE MEMORY TABLE PUBLIC.ADMIN(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_0C94006F_DE93_4F62_B66B_1751B85A4DCC) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_0C94006F_DE93_4F62_B66B_1751B85A4DCC,
    OWNER_ID INTEGER
);   
ALTER TABLE PUBLIC.ADMIN ADD CONSTRAINT PUBLIC.CONSTRAINT_3 PRIMARY KEY(ID);   
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.ADMIN;    
CREATE MEMORY TABLE PUBLIC.CENTRE(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_33AF5438_FF1A_48B5_BE9B_ADB257C17804) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_33AF5438_FF1A_48B5_BE9B_ADB257C17804,
    ADRESSE VARCHAR(255),
    NB_ESSAIS INTEGER NOT NULL,
    NB_SUCCES INTEGER NOT NULL,
    NOM VARCHAR(255),
    VILLE VARCHAR(255)
);
ALTER TABLE PUBLIC.CENTRE ADD CONSTRAINT PUBLIC.CONSTRAINT_7 PRIMARY KEY(ID);  
-- 1 +/- SELECT COUNT(*) FROM PUBLIC.CENTRE;   
INSERT INTO PUBLIC.CENTRE(ID, ADRESSE, NB_ESSAIS, NB_SUCCES, NOM, VILLE) VALUES
(1, 'jjn', 0, 0, 'Fr', 'lll'); 
CREATE MEMORY TABLE PUBLIC.DONNEUR(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_0992A3B8_5E42_4732_8070_37D93A1604BA) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_0992A3B8_5E42_4732_8070_37D93A1604BA,
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
-- 1 +/- SELECT COUNT(*) FROM PUBLIC.DONNEUR;  
INSERT INTO PUBLIC.DONNEUR(ID, AGE, ANTECEDENTS, ATTENTE, CHEVEUX, DISPONIBILITE, LOISIRS, NOM, PEAU, POIDS, PRENOM, SEXE, SIGNALE, TAILLE, YEUX, OWNER_ID) VALUES
(1, 25, 0, FALSE, 0, TRUE, 0, 'nom', 0, 55, 'prenom', FALSE, FALSE, 141, 0, 1);             
CREATE MEMORY TABLE PUBLIC.MEDECIN(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_9457AE31_C4DD_4826_9C27_A0D3550E9D24) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_9457AE31_C4DD_4826_9C27_A0D3550E9D24,
    NOM VARCHAR(255),
    SEXE BOOLEAN NOT NULL,
    SPECIALISATION INTEGER,
    OWNER_ID INTEGER
);    
ALTER TABLE PUBLIC.MEDECIN ADD CONSTRAINT PUBLIC.CONSTRAINT_6 PRIMARY KEY(ID); 
-- 1 +/- SELECT COUNT(*) FROM PUBLIC.MEDECIN;  
INSERT INTO PUBLIC.MEDECIN(ID, NOM, SEXE, SPECIALISATION, OWNER_ID) VALUES
(1, 'dd', FALSE, 2, 1);             
CREATE MEMORY TABLE PUBLIC.RDV(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_4F23D7E7_4F2B_4782_8545_BA02C529BED0) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_4F23D7E7_4F2B_4782_8545_BA02C529BED0,
    HEURE INTEGER NOT NULL,
    JOUR INTEGER NOT NULL,
    MOIS INTEGER NOT NULL,
    DONNEUR_ID INTEGER,
    MEDECIN_ID INTEGER
);         
ALTER TABLE PUBLIC.RDV ADD CONSTRAINT PUBLIC.CONSTRAINT_1 PRIMARY KEY(ID);     
-- 1 +/- SELECT COUNT(*) FROM PUBLIC.RDV;      
INSERT INTO PUBLIC.RDV(ID, HEURE, JOUR, MOIS, DONNEUR_ID, MEDECIN_ID) VALUES
(1, 13, 1, 1, 1, 1);              
CREATE MEMORY TABLE PUBLIC.RECEVEUR(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_0B44D20E_8A1F_4793_A465_C36936D0A7C6) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_0B44D20E_8A1F_4793_A465_C36936D0A7C6,
    AGE INTEGER NOT NULL,
    NBECHECS INTEGER NOT NULL,
    NBSUCCES INTEGER NOT NULL,
    NOM VARCHAR(255),
    PRENOM VARCHAR(255),
    SEXE BOOLEAN NOT NULL
);    
ALTER TABLE PUBLIC.RECEVEUR ADD CONSTRAINT PUBLIC.CONSTRAINT_F PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.RECEVEUR; 
CREATE MEMORY TABLE PUBLIC.UTILISATEUR(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_9D7C4174_65C2_4F6B_B947_82EFD4BF0878) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_9D7C4174_65C2_4F6B_B947_82EFD4BF0878,
    IDPROFILASSOCIE INTEGER NOT NULL,
    ISRECEVEUR BOOLEAN NOT NULL,
    MAIL VARCHAR(255),
    MDP VARCHAR(255)
);               
ALTER TABLE PUBLIC.UTILISATEUR ADD CONSTRAINT PUBLIC.CONSTRAINT_5 PRIMARY KEY(ID);             
-- 2 +/- SELECT COUNT(*) FROM PUBLIC.UTILISATEUR;              
INSERT INTO PUBLIC.UTILISATEUR(ID, IDPROFILASSOCIE, ISRECEVEUR, MAIL, MDP) VALUES
(1, 1, FALSE, 'mail', 'mdp'),
(2, 1, TRUE, 'a', 'a');        
CREATE MEMORY TABLE PUBLIC.NOTIFICATION(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_8D1986EF_D3EC_4902_9C87_ED5AAC30B842) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_8D1986EF_D3EC_4902_9C87_ED5AAC30B842,
    STATU INTEGER,
    TEXT VARCHAR(255),
    DONNEUR_ID INTEGER,
    RECEVEUR_ID INTEGER
);       
ALTER TABLE PUBLIC.NOTIFICATION ADD CONSTRAINT PUBLIC.CONSTRAINT_A PRIMARY KEY(ID);            
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.NOTIFICATION;             
ALTER TABLE PUBLIC.NOTIFICATION ADD CONSTRAINT PUBLIC.FKAEXHYK31QAG3SF0C4LWV6DPC5 FOREIGN KEY(DONNEUR_ID) REFERENCES PUBLIC.DONNEUR(ID) NOCHECK;               
ALTER TABLE PUBLIC.RDV ADD CONSTRAINT PUBLIC.FKPCFVLYV97JF3TIWGBSQ2B71MR FOREIGN KEY(DONNEUR_ID) REFERENCES PUBLIC.DONNEUR(ID) NOCHECK;        
ALTER TABLE PUBLIC.RDV ADD CONSTRAINT PUBLIC.FKSJVIYMT7HVM6QQBR0P1HXL0T4 FOREIGN KEY(MEDECIN_ID) REFERENCES PUBLIC.MEDECIN(ID) NOCHECK;        
ALTER TABLE PUBLIC.DONNEUR ADD CONSTRAINT PUBLIC.FKJ8QTRC1588GU5L4KUXRK4EFB3 FOREIGN KEY(OWNER_ID) REFERENCES PUBLIC.CENTRE(ID) NOCHECK;       
ALTER TABLE PUBLIC.MEDECIN ADD CONSTRAINT PUBLIC.FK30SJW8WA1WKDAW1QTS0PNOFW4 FOREIGN KEY(OWNER_ID) REFERENCES PUBLIC.CENTRE(ID) NOCHECK;       
ALTER TABLE PUBLIC.NOTIFICATION ADD CONSTRAINT PUBLIC.FK5RB0RJT7ARPNL6OWNSJS6S5XP FOREIGN KEY(RECEVEUR_ID) REFERENCES PUBLIC.RECEVEUR(ID) NOCHECK;             
