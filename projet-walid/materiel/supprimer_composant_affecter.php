<html>
<body marginheight="40" bgcolor="#fffcd9">
<?php
include('../connect_base.php');

echo("<link rel=\"stylesheet\" type=\"text/css\" href=\"../lien.css\">");


//r�cup�rer les donn�es envoy�es dans l'adresse URL apr�s confirmation
$id_materiel=$_GET['id_materiel'];
$id_composant=$_GET['id_composant'];

// requ�te affichage du nom du composant et du nom du materiel auquel le composant �tait affecter
  $requete="SELECT nom_materiel, libelle_composant
            from materiel m, composer co, composant c
	  where m.id_materiel=co.id_materiel and c.id_composant=co.id_composant and m.id_materiel=".$id_materiel ;
  // execution de la requ�te et test
  $resultat = mysql_query($requete);
  $row=mysql_fetch_array($resultat);
  
// requ�te suppression de l'enregistrement
  $requete="DELETE FROM composer WHERE id_materiel = ".$id_materiel." and id_composant=".$id_composant  ;

// execution de la requ�te et test
  $resultat = mysql_query($requete);

 if($resultat)
  {
    echo("<center><span class=style3>La suppression du composant ".$row[1]." affect� au mat�riel ".$row[0]." a correctement �t� effectu�</span><br>") ;
  }
  else
  {
    echo("<center><span class=style3>La suppression du composant ".$row[1]." affect� au mat�riel ".$row[0]." a �chou�</span><br>") ;
  }
	
  // bouton de retour
echo "<br><br>";
echo "<form>";
echo "<input type='button' value=\"Retour\" onclick=\"window.location='modifier_materiel_form.php?code=$id_materiel';\">";
echo "</form>";

  // deconnexion de la base
mysql_close(); 


?>
</body>
</html>
