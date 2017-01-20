with text_io; use text_io;
with ada.integer_text_io; use ada.integer_text_io;
with p_arbre_n;
procedure test_p_arbre_n is
procedure afficher(a : IN integer) is Begin put(a); end afficher;
package p_arbre_integer is new p_arbre_n(integer,afficher);
use p_arbre_integer;
vide : arbre_n;
arbre0 : arbre_n;
arbre1 : arbre_n;
arbre2 : arbre_n;
arbre3 : arbre_n;
arbre4 : arbre_n;
arbre5 : arbre_n;
arbre6 : arbre_n;
arbre7 : arbre_n;
arbre8 : arbre_n;
arbre9 : arbre_n;


Begin

-- Initialisation des arbres tests

arbre0:=new noeud;
arbre0.all.racine:=1;
arbre0.all.pere:=Null;
arbre0.all.fils:=Null;
arbre0.all.suiv:=Null;
arbre0.all.prec:=Null;
-- arbre0 est un simple noeud qui contient 1 comme racine : (1)

arbre1:=new noeud;
arbre1.all:=arbre0.all;
arbre1.all.suiv:=new noeud;
arbre1.all.suiv.all.racine:=0;
-- arbre1 est l'ensemble de deux noeud de même génération le premier contenant 1 et son frère droit contenant 0 : (1,0)

arbre2:=new noeud;
arbre2.all:=arbre0.all;
arbre2.all.fils:=new noeud;
arbre2.all.fils.all:=arbre0.all;
--arbre2 est l'ensemble de deux noeuds contenant 1 dont l'un est fils de l'autre :  (1(1))

arbre3:=new noeud;
arbre3.all:=arbre2.all;
arbre3.all.fils.all.fils:=new noeud;
arbre3.all.fils.all.fils.all:=arbre1.all;
-- arbre3 : (1(1(1,0)))


arbre4:=new noeud;
arbre5:=new noeud;
arbre6:=new noeud;
arbre7:=new noeud;
arbre8:=new noeud;
arbre9:=new noeud;




--test de la fonction An_Vide
put("Test de la fonction est_Vide dans le cas d'un paramètre vide: ");
if An_Vide(Null) then put("ok"); else put("ko"); end if;
New_line;
put("Test de la fonction est_Vide dans le cas d'un paramètre non vide: ");
if An_Vide(arbre0) then put("ko"); else put("ok"); end if;
New_line;

--test de la fonction An_Creer_Vide
put("Test de la fonction An_Creer_Vide : ");
vide:=An_Creer_Vide;
if vide=Null then put("ok"); else put("ko"); end if;
New_line;

--test de la fonction An_Valeur
put("test de la fonction An_Valeur");
if An_Valeur(arbre0)=1 then put("ok"); else put("ko"); end if;
New_line;
	--test de l'exception levée
	Begin
	if An_Valeur(Null)=2 then null; else null; end if;
	put("test de l'exception An_Valeur_Null : ko"); -- si le programme a accès a cette instruction c'est que le test de l'exception a échoué
	Exception
	when An_Valeur_Null =>
	put("test de l'exception An_Valeur_Null : ok ");
	end;
New_line;

--test de la fonction An_Est Feuille
put("Test de la fonction An_Est_Feuille dans le cas où le paramètre est une feille : ");
if An_Est_Feuille(arbre0) then put("ok"); else put("ko"); end if;
New_line;
put("Test de la fonction An_Est_Feuille dans le cas où le paramètre n'est pas une feuille : ");
if An_Est_Feuille(arbre2) then put("ko"); else put("ok"); end if;
New_line;
	--test de l'exception levée
	Begin
	if An_Est_Feuille(Null) then null; else null; end if;
	put("test de l'exception An_Est_Feuille_Null : ko"); -- si le programme a accès a cette instruction c'est que le test de l'exception a échoué
	Exception
	when An_Est_Feuille_Null =>
	put("test de l'exception An_Est_Feuille_Null : ok ");
	end;
New_line;

--test de la fonction An_Creer_Feuille
put("test de la fonction An_Creer_Feuille : ");
if An_Creer_Feuille(1)=arbre0 then put("ok"); else put("ko"); end if;
New_line;

end test_p_arbre_n;
