<html>
<body marginheight="40" bgcolor="#fffcd9">
<?php

echo("<link rel=\"stylesheet\" type=\"text/css\" href=\"../lien.css\">");

include('../connect_base.php');

//r�cup�rer les donn�es de l'URL de la page de confirmation "confirmation_supprimer_logiciel"
$logiciel=$_GET['code'];

// requ�te affichage du nom et de la version du logiciel
  $requete="SELECT nom_logiciel, version_logiciel
            FROM logiciel
	    WHERE id_logiciel = ".$logiciel ;
  // execution de la requ�te et test
  $resultat = mysql_query($requete);
  $row=mysql_fetch_array($resultat);


// requ�te suppression de l'enregistrement
  $requete1="DELETE FROM logiciel WHERE id_logiciel = ".$logiciel ;

// execution de la requ�te et test
  $resultat1 = mysql_query($requete1);

 if($resultat1)
  {
    echo("<center><span class=style3>La suppression du logiciel ".$row[0]." ".$row[1]." a correctement �t� effectu�e</span><br>") ;
  }
  else
  {
    echo("<center><span class=style3>La suppression du logiciel ".$row[0]." ".$row[1]." a �chou�e</span><br>") ;
  }
	
  // bouton de retour
echo "<br><br>";
echo "<form>";
echo "<input type='button' value=\"Retour\" onclick=\"window.location='liste_logiciel.php';\">";
echo "</form>";

  // deconnexion de la base
mysql_close(); 


?>
</body>
</html>
