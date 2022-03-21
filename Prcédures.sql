CREATE OR REPLACE PROCEDURE VERIF_PSEUDO
                        (ppseudo IN joueur.pseudo%type,
                         pmotdepasse IN joueur.motdepasse%type,
                         pmail IN joueur.mail%type,
                         pretour OUT number) AS

vpseudo joueur.pseudo%type;
                  
BEGIN
pretour := 0;
select pseudo into vpseudo from joueur
where vpseudo = ppseudo;

COMMIT;

EXCEPTION
when no_data_found then
    pretour := 1;
when others then
    pretour := SQLCODE;

END VERIF_PSEUDO;

create or replace PROCEDURE VERIF_CONNEXION
                    (ppseudo IN joueur.pseudo%TYPE, 
                    pmotdepasse IN joueur.motdepasse%type,
                    pretour OUT number) AS
                    

vmotdepasse joueur.motdepasse%type;


--Selection du mdp en fonction du pseudo renseigné--
BEGIN
pretour := 0;
select motdepasse into vmotdepasse from joueur
where joueur.pseudo = ppseudo;

--Vérification du mdp renseigné et du mdp enregistré dans la base de donnée--
if vmotdepasse != pmotdepasse then
    pretour := 2;
end if;

COMMIT;

EXCEPTION
--Nom d'utilisateur invalide--
when no_data_found then
    pretour := 1;

--Erreur inconnu--
when others then
    pretour := SQLCODE;

END VERIF_CONNEXION;