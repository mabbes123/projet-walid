<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Ajouter Batiment_Etage</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="lien.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#fffcd9" marginheight="30">

<?php
echo("<b><u>R�capitulatif du batiment_etage :  </u></b><BR>");
//r�cup�rer les donn�es du formulaire "ajout_batiment_etage_form"
$libelle=$_REQUEST['libelle'];


echo"<BR>";echo("<b>Libell� : </b>");
echo($libelle);echo"<BR>";


  $requete="select max(id_batiment_etage) from batiment_etage;";
  $resultat = mysql_query($requete) or die("erreur dans la requete : " . $requete);
 while($ctItem = mysql_fetch_array($resultat))//compteur pour afficher le rang de l inscrit
{
	$id_batiment_etage = $ctItem[0]+1;
}


  // requ�te insertion du nouvel enregistrement
  $query="insert into batiment_etage values ('".$id_batiment_etage."','".$libelle."');";

  // execution de la requ�te
  $resultat = mysql_query($query) or die("erreur dans la requete : " . $query);

  // bouton de retour
echo "<form>";
echo "<input type='button' value=\"Retour\" onclick=\"window.location='ajout_batiment_etage_form.php';\">";
echo "</form>";
  // deconnexion de la base
mysql_close(); 

?>
</body>
</html>