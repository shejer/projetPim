---------------------------------------------------------------
-- Paquetage g�n�rique arbre n-aire. 
-- La valeur d'un noeud est de type T.
-- ************************************************************
-- Les contrats, les modes de passage et les exceptions ne sont
-- volontairement pas pr�cis�s ici, mais vous DEVEZ les ajouter
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
-- S�mantique: D�tecter si un arbre n-aire est vide ou non
-- Param�tres: a: arbre_n
-- Type retour: bool�en (vaut vrai si a est vide)
Function An_Vide (a : IN arbre_n) return boolean;
-----------------------------------------------------------
-- Fonction An_Creer_Vide
-- S�mantique: Cr�er un arbre n-aire vide
-- Param�tres: /
-- Type retour: arbre_n
Function An_Creer_Vide return arbre_n;
----------------------------------------------------------
-- Fonction An_Valeur
-- S�mantique: Retourner la valeur rang�e � la racine d'un arbre n-aire
-- Param�tres: a: arbre_n
-- Type retour: T
-- Exception An_Valeur_Null lev�e si a est vide
Function An_Valeur (a : IN arbre_n) return T;
----------------------------------------------------------
-- Fonction An_Est_Feuille
-- S�mantique: Indiquer si un arbre n-aire est une feuille (pas de fils)
-- Param�tres: a: arbre_n
-- Type retour: bool�en (vaut vrai si a n'a pas de fils)
-- Exception An_Est_Feuille_Null lev�e si a est vide
Function An_Est_Feuille (a : IN arbre_n) return boolean;
-----------------------------------------------------------
-- Fonction An_Creer_Feuille
-- S�mantique: Cr�er un arbre n-aire avec une valeur mais sans fils, ni fr�re, 
-- ni p�re
-- Param�tres: nouveau: T
-- Type retour: arbre_n
Function An_Creer_Feuille (nouveau : IN T) return arbre_n;
----------------------------------------------------------
-- Fonction An_Pere
-- S�mantique: Retourner l'arbre n-aire p�re d'un arbre n-aire
-- Param�tres: a: arbre_n
-- Type retour: arbre_n
-- Precondition: a a un p�re
Function An_Pere (a : IN arbre_n) return arbre_n;
----------------------------------------------------------
-- Fonction An_Frere
-- S�mantique: Retourner le nieme  Frere d'un arbre n-aire
--        le numero 1 est le premier frere droit
--        le numero 0 est l'arbre lui-m�me. 
--        le numero -1 est le premier frere gauche
-- Param�tres: a: arbre_n,
--             n : entier, le num�ro du fr�re
-- Type retour: arbre_n
-- Postcondition: le r�sultat /= null
Function An_Frere (a : IN arbre_n; n : IN integer) return arbre_n;
----------------------------------------------------------
-- Fonction An_Fils
-- S�mantique: Retourner le nieme fils de a
--   le numero 1 est le premier fils
--   Attention : le 2�me fils est le fr�re droit, pas le petit-fils
-- Param�tres: a: arbre_n,
--             n : entier, le num�ro du fils
-- Type retour: arbre_n
Function An_Fils (a : IN arbre_n; n : IN integer) return arbre_n;
-----------------------------------------------------------
-- Proc�dure An_Afficher
-- S�mantique: Afficher le contenu complet d'un arbre n-aire
-- Param�tres: a: arbre_n
procedure An_Afficher(a : IN arbre_n);
----------------------------------------------------------
-- Fonction An_Nombre_Noeuds
-- S�mantique : Retourner le nombre total de noeuds d'un arbre n-aire
-- Param�tres : a : arbre_n
-- Type retour : Entier
Function An_Nombre_Noeuds(a : IN arbre_n) return integer;
----------------------------------------------------------
-- Fonction An_Rechercher
-- S�mantique: Rechercher une valeur dans un arbre n-aire et 
-- retourner l'arbre n-aire dont la valeur est racine si elle 
-- est trouv�e, un arbre n-aire vide sinon
-- Param�tres: a: arbre_n,
--             data: T, la valeur � rechercher
-- Type retour: arbre_n
Function An_Rechercher(a : IN arbre_n; data : IN T) return arbre_n;
----------------------------------------------------------
-- Fonction An_Nombre_Noeuds_Valeur
-- S�mantique : Retourner le nombre de noeuds d'un arbre n-aire
-- dont la valeur est �gale � une valeur donn�e.
-- Param�tres : a : arbre_n, 
--              data: T, la valeur � rechercher
-- Type retour : Entier
Function An_Nombre_Noeuds_Valeur(a : IN arbre_n; data : IN T) return integer;
----------------------------------------------------------
-- Fonction An_Est_Racine
-- S�mantique: Indiquer si un arbre n-aire est sans p�re
-- Param�tres: a: arbre_n
-- Type retour: bool�en (vaut vrai si a n'a pas de p�re)
Function An_Est_Racine (a : IN arbre_n) return boolean;
-------------------------------------------------------
-- Proc�dure An_Changer_Valeur
-- S�mantique: Changer la valeur du noeud d'un arbre n-aire
-- Param�tres: a: arbre_n
--             data: T, la nouvelle valeur
Procedure An_Changer_Valeur(a : IN OUT arbre_n; data : IN T);
-------------------------------------------------------
-- Proc�dure An_Inserer_Fils
-- S�mantique: Ins�rer un arbre n-aire sans fr�re en position de premier 
-- fils d'un arbre n-aire a. L'ancien fils de a devient alors le premier 
-- fr�re de l'arbre n-aire ins�r�.
-- Param�tres: a: arbre_n, 
--             a_ins: arbre_n, l'arbre � ins�rer
Procedure An_Inserer_Fils(a : IN arbre_n; a_ins : IN arbre_n);
-------------------------------------------------------
-- Proc�dure An_Inserer_Frere
-- S�mantique: Ins�rer un arbre n-aire sans fr�re en position de premier 
-- fr�re d'un arbre n-aire a
-- Param�tres: a: arbre_n,
--             a_ins: arbre_n, l'arbre � ins�rer
Procedure An_Inserer_Frere(a : IN arbre_n; a_ins : IN arbre_n);
-------------------------------------------------------
-- Proc�dure An_Supprimer_frere
-- S�mantique: Supprime le nieme frere d'un arbre n-aire
-- Param�tres: a: arbre_n, 
--             n : entier, le num�ro du fr�re (et tous ses descendants) � supprimer
Procedure An_Supprimer_frere(a : IN OUT arbre_n; n : IN integer);
-------------------------------------------------------
-- Proc�dure An_Supprimer_fils
-- S�mantique: Supprime le nieme fils d'un arbre n-aire
-- Param�tres: a: arbre_n,
--             n : entier, le num�ro du fils (et tous ses descendants) � supprimer
Procedure An_Supprimer_fils(a : IN OUT arbre_n; n : IN integer);
-------------------------------------------------------

end p_arbre_n;
