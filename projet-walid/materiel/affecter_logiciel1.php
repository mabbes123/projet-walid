<html>
<body marginheight="40" bgcolor="#fffcd9">
<?php

echo("<link rel=\"stylesheet\" type=\"text/css\" href=\"../lien.css\">");
include('../connect_base.php');

echo("<b><u>R�capitulatif sur l'installation du logiciel :  </u></b><BR>");

//r�cup�rer les donn�es du formulaire "affecter_logiciel_form"

$materiel=$_POST['materiel'];
$logiciel=$_POST['logiciel'];


//Gestion du nom et version du logiciel
$requete1="select nom_logiciel, version_logiciel, libelle_service_pack 
				from logiciel l, service_pack s 
				where s.id_service_pack=l.id_service_pack
					and id_logiciel=".$logiciel.";";
					
$resultat1 = mysql_query($requete1) or die("erreur dans la requete : " . $requete1);
$row1=mysql_fetch_row($resultat1);
$nom_logiciel=$row1[0];
$version_logiciel=$row1[1];
$libelle_service_pack=$row1[2];


//Gestion du nom_materiel
$requete2="select nom_materiel, libelle_type_materiel 
			from materiel m, type_materiel t
			where t.id_type_materiel=m.id_type_materiel
					and id_materiel=".$materiel.";";
					
$resultat2 = mysql_query($requete2) or die("erreur dans la requete : " . $requete2);
$row2=mysql_fetch_row($resultat2);
$nom_materiel=$row2[0];
$libelle_type_materiel=$row2[1];

echo"<BR>";
echo("<b>Type de mat�riel affect� : </b>");
echo($libelle_type_materiel);echo"<BR>";
echo("<b>Nom du mat�riel affect� : </b>");
echo($nom_materiel);echo"<BR>";
echo("<b>Logiciel install� : </b>");
echo($nom_logiciel); echo "&nbsp;"; echo($version_logiciel);echo"&nbsp;";echo($libelle_service_pack);

  // bouton de retour
  
echo "<form>";
echo "<br><input type='button' value=\"Retour\" onclick=\"window.location='modifier_materiel_form.php?code=$materiel';\">";
echo "</form>";


  // requ�te insertion du nouvel enregistrement dans la table materiel
  $requete5="insert into installer values ('".$logiciel."','".$materiel."');";
  // execution de la requ�te
  $resultat5 = mysql_query($requete5) or die("Le logiciel est d�j� assign� ");
 

  // deconnexion de la base
mysql_close(); 

?>
</body>
</html>

