---------------------------------------------------------------
-- Paquetage générique arbre n-aire. 
-- La valeur d'un noeud est de type T.
-- ************************************************************
-- Les contrats, les modes de passage et les exceptions ne sont
-- volontairement pas précisés ici, mais vous DEVEZ les ajouter
-- ************************************************************
---------------------------------------------------------------
generic 
 type T is private;
 with procedure affich (variable : T );
package p_arbre_n is
 type noeud;
 type arbre_n is access noeud;
 type noeud is record
  racine : T;
  prec : arbre_n;
  suiv : arbre_n;
  fils : arbre_n;
  pere : arbre_n;
 end record;
 An_Valeur_Null : exception;
 An_Est_Feuille_Null : exception;
 An_Pere_Null : exception;
 An_Pere_PasDePere : exception;
 An_Frere_PasDeNiemeFrere : exception;
 An_Fils_Null : exception;
 An_Fils_PasdeNiemeFils : exception;
 An_Afficher_Null : exception;
 An_est_Racine_Null : exception;
 An_Inserer_Fils_Null : exception;
 An_Inserer_Frere_Null : exception;
 An_Supprimer_frere_exception : exception;
 An_Supprimer_frere_PasDeNiemeFrere : exception;
 An_Supprimer_fils_Exception : exception;
 An_Supprimer_fils_PasDeNiemeFils : exception;
-----------------------------------------------------------
-- Fonction An_Vide
-- Sémantique: Détecter si un arbre n-aire est vide ou non
-- Paramètres: a: arbre_n
-- Type retour: booléen (vaut vrai si a est vide)
Function An_Vide (a : IN arbre_n) return boolean;
-----------------------------------------------------------
-- Fonction An_Creer_Vide
-- Sémantique: Créer un arbre n-aire vide
-- Paramètres: /
-- Type retour: arbre_n
Function An_Creer_Vide return arbre_n;
----------------------------------------------------------
-- Fonction An_Valeur
-- Sémantique: Retourner la valeur rangée à la racine d'un arbre n-aire
-- Paramètres: a: arbre_n
-- Type retour: T
-- Exception An_Valeur_Null levée si a est vide
Function An_Valeur (a : IN arbre_n) return T;
----------------------------------------------------------
-- Fonction An_Est_Feuille
-- Sémantique: Indiquer si un arbre n-aire est une feuille (pas de fils)
-- Paramètres: a: arbre_n
-- Type retour: booléen (vaut vrai si a n'a pas de fils)
-- Exception An_Est_Feuille_Null levée si a est vide
Function An_Est_Feuille (a : IN arbre_n) return boolean;
-----------------------------------------------------------
-- Fonction An_Creer_Feuille
-- Sémantique: Créer un arbre n-aire avec une valeur mais sans fils, ni frère, 
-- ni père
-- Paramètres: nouveau: T
-- Type retour: arbre_n
Function An_Creer_Feuille (nouveau : IN T) return arbre_n;
----------------------------------------------------------
-- Fonction An_Pere
-- Sémantique: Retourner l'arbre n-aire père d'un arbre n-aire
-- Paramètres: a: arbre_n
-- Type retour: arbre_n
-- Precondition: a a un père
Function An_Pere (a : IN arbre_n) return arbre_n;
----------------------------------------------------------
-- Fonction An_Frere
-- Sémantique: Retourner le nieme  Frere d'un arbre n-aire
--        le numero 1 est le premier frere droit
--        le numero 0 est l'arbre lui-même. 
--        le numero -1 est le premier frere gauche
-- Paramètres: a: arbre_n,
--             n : entier, le numéro du frère
-- Type retour: arbre_n
-- Postcondition: le résultat /= null
Function An_Frere (a : IN arbre_n; n : IN integer) return arbre_n;
----------------------------------------------------------
-- Fonction An_Fils
-- Sémantique: Retourner le nieme fils de a
--   le numero 1 est le premier fils
--   Attention : le 2ème fils est le frère droit, pas le petit-fils
-- Paramètres: a: arbre_n,
--             n : entier, le numéro du fils
-- Type retour: arbre_n
Function An_Fils (a : IN arbre_n; n : IN integer) return arbre_n;
-----------------------------------------------------------
-- Procédure An_Afficher
-- Sémantique: Afficher le contenu complet d'un arbre n-aire
-- Paramètres: a: arbre_n
procedure An_Afficher(a : IN arbre_n);
----------------------------------------------------------
-- Fonction An_Nombre_Noeuds
-- Sémantique : Retourner le nombre total de noeuds d'un arbre n-aire
-- Paramètres : a : arbre_n
-- Type retour : Entier
Function An_Nombre_Noeuds(a : IN arbre_n) return integer;
----------------------------------------------------------
-- Fonction An_Rechercher
-- Sémantique: Rechercher une valeur dans un arbre n-aire et 
-- retourner l'arbre n-aire dont la valeur est racine si elle 
-- est trouvée, un arbre n-aire vide sinon
-- Paramètres: a: arbre_n,
--             data: T, la valeur à rechercher
-- Type retour: arbre_n
Function An_Rechercher(a : IN arbre_n; data : IN T) return arbre_n;
----------------------------------------------------------
-- Fonction An_Nombre_Noeuds_Valeur
-- Sémantique : Retourner le nombre de noeuds d'un arbre n-aire
-- dont la valeur est égale à une valeur donnée.
-- Paramètres : a : arbre_n, 
--              data: T, la valeur à rechercher
-- Type retour : Entier
Function An_Nombre_Noeuds_Valeur(a : IN arbre_n; data : IN T) return integer;
----------------------------------------------------------
-- Fonction An_Est_Racine
-- Sémantique: Indiquer si un arbre n-aire est sans père
-- Paramètres: a: arbre_n
-- Type retour: booléen (vaut vrai si a n'a pas de père)
Function An_Est_Racine (a : IN arbre_n) return boolean;
-------------------------------------------------------
-- Procédure An_Changer_Valeur
-- Sémantique: Changer la valeur du noeud d'un arbre n-aire
-- Paramètres: a: arbre_n
--             data: T, la nouvelle valeur
Procedure An_Changer_Valeur(a : IN OUT arbre_n; data : IN T);
-------------------------------------------------------
-- Procédure An_Inserer_Fils
-- Sémantique: Insérer un arbre n-aire sans frère en position de premier 
-- fils d'un arbre n-aire a. L'ancien fils de a devient alors le premier 
-- frère de l'arbre n-aire inséré.
-- Paramètres: a: arbre_n, 
--             a_ins: arbre_n, l'arbre à insérer
Procedure An_Inserer_Fils(a : IN arbre_n; a_ins : IN arbre_n);
-------------------------------------------------------
-- Procédure An_Inserer_Frere
-- Sémantique: Insérer un arbre n-aire sans frère en position de premier 
-- frère d'un arbre n-aire a
-- Paramètres: a: arbre_n,
--             a_ins: arbre_n, l'arbre à insérer
Procedure An_Inserer_Frere(a : IN arbre_n; a_ins : IN arbre_n);
-------------------------------------------------------
-- Procédure An_Supprimer_frere
-- Sémantique: Supprime le nieme frere d'un arbre n-aire
-- Paramètres: a: arbre_n, 
--             n : entier, le numéro du frère (et tous ses descendants) à supprimer
Procedure An_Supprimer_frere(a : IN OUT arbre_n; n : IN integer);
-------------------------------------------------------
-- Procédure An_Supprimer_fils
-- Sémantique: Supprime le nieme fils d'un arbre n-aire
-- Paramètres: a: arbre_n,
--             n : entier, le numéro du fils (et tous ses descendants) à supprimer
Procedure An_Supprimer_fils(a : IN OUT arbre_n; n : IN integer);
-------------------------------------------------------

end p_arbre_n;
