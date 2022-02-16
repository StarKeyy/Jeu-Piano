--BD Simon


DROP TABLE NOTES;
DROP TABLE NIVEAU;


CREATE TABLE Notes(
NumNote Number,
Son Varchar2(10),
CONSTRAINT pk_numnote PRIMARY KEY (NumNote)
);

CREATE TABLE Niveau(
IdNiveau Number,
NbNotes Number,
Vitesse Number,
CONSTRAINT pk_idniveau PRIMARY KEY (IdNiveau)
);

CREATE TABLE Collection(
IdCollection Number,
IdNiveau Number,
Taille Number,
CONSTRAINT pk_collection PRIMARY KEY (IdCollection),
CONSTRAINT fk_idniveauc foreign key (IdNiveau) REFERENCES Niveau(IdNiveau)
);

CREATE TABLE Joueur(
Pseudo Varchar2(50),
IdNiveau Number,
Mail VARCHAR(100),
MotDePasse VARCHAR(50),
CONSTRAINT pk_pseudo PRIMARY KEY (Pseudo),
CONSTRAINT fk_idniveauj foreign key (IdNiveau) REFERENCES Niveau(IdNiveau)
);

CREATE TABLE Partie(
IdPartie Number,
Pseudo Varchar2(50),
IdNiveau Number,
Jour DATE,
Score Number,
CONSTRAINT pk_partie PRIMARY KEY (IdPartie),
CONSTRAINT fk_pseudo foreign key (Pseudo) REFERENCES Joueur(Pseudo),
CONSTRAINT fk_idniveaup foreign key (IdNiveau) REFERENCES Niveau(IdNiveau)
);

CREATE TABLE Coups(
IdCoup Number,
IdPartie Number,
NumNote Number,
Etat Number,
CONSTRAINT pk_coups PRIMARY KEY (IdCoup),
CONSTRAINT fk_idpartiec foreign key (IdPartie) REFERENCES Partie(IdPartie),
CONSTRAINT fk_numnotec foreign key (NumNote) REFERENCES Notes(NumNote)
);

CREATE TABLE Melodie(
IdMelodie Number,
IdPartie Number,
NumNote Number,
Manche Number,
CONSTRAINT pk_melodie PRIMARY KEY (IdMelodie),
CONSTRAINT fk_idpartiem foreign key (IdPartie) REFERENCES Partie(IdPartie),
CONSTRAINT fk_numnotem foreign key (NumNote) REFERENCES Notes(NumNote)
);





