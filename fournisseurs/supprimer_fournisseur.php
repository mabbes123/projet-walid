<html>
<body marginheight="40" bgcolor="#fffcd9">
<?php
include('../connect_base.php');

echo("<link rel=\"stylesheet\" type=\"text/css\" href=\"../lien.css\">");


//r�cup�rer les donn�es envoy�es dans l'adresse URL apr�s confirmation
$societe=$_GET['code'];

//Ne pas effacer les logiciels affect�s � la societe supprim�e
$requete1="update logiciel set id_societe=1 where id_societe='".$societe."'";
$resultat1 = mysql_query($requete1);

//Ne pas effacer les intervenants affect�s � la societe supprim�e
$requete2="update intervenant set id_societe=1 where id_societe='".$societe."'";
$resultat2 = mysql_query($requete2);

//Ne pas effacer appartenir affect� � la societe supprim�e
$requete3="update appartenir set id_societe=1 where id_societe='".$societe."'";
$resultat3 = mysql_query($requete3);

//Ne pas effacer les materiels affect�s � la societe supprim�e
$requete4="update materiel set id_societe=1 where id_societe='".$societe."'";
$resultat4 = mysql_query($requete4);

//Ne pas effacer les composants affect�s � la societe supprim�e
$requete5="update composant set id_societe=1 where id_societe='".$societe."'";
$resultat5 = mysql_query($requete5);

// requ�te affichage du nom et du libelle_type de la soci�t�
  $requete="SELECT nom_societe, libelle_type_societe
            from societe s, type_societe t 
	  where s.id_type_societe=t.id_type_societe and id_societe=".$societe ;
  // execution de la requ�te et test
  $resultat = mysql_query($requete);
  $row=mysql_fetch_array($resultat);
  
// requ�te suppression de l'enregistrement
  $requete="DELETE FROM societe WHERE id_societe = ".$societe ;

// execution de la requ�te et test
  $resultat = mysql_query($requete);

 if($resultat)
  {
    echo("<center><span class=style3>La suppression de la soci�t� ".$row[0]." de type ".$row[1]." a correctement �t� effectu�e</span><br>") ;
  }
  else
  {
    echo("<center><span class=style3>La suppression de la soci�t� ".$row[0]." de type ".$row[1]." a �chou�e</span><br>") ;
  }
	
  // bouton de retour
echo "<br><br>";
echo "<form>";
echo "<input type='button' value=\"Retour\" onclick=\"window.location='liste_fournisseur.php';\">";
echo "</form>";

  // deconnexion de la base
mysql_close(); 


?>
</body>
</html>
