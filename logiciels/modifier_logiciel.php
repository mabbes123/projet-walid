<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Modifier logiciel</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body bgcolor="#fffcd9" marginheight="25" leftmargin="25">
<?
//r�cup�ration des donn�es � modifier
$code=$_POST["code"];
$nom=$_POST["nom"];
$version=$_POST["version"];
$achat=$_POST["dateachat"];
$societe=$_POST["societe"];

// $achat est une valeur r�cup�r�e au format fran�ais
list($d,$m,$y) = explode('/', $achat);
$achat=$y.'-'.$m.'-'.$d; // date au format anglais

$service_pack=$_POST["service_pack"];
$observation=$_POST["observation"];

//requete de mise � jour du logiciel
$requete="update logiciel set nom_logiciel='".$nom."', version_logiciel='".$version."', date_achat_logiciel='".$achat."', observation_logiciel='".$observation."', id_service_pack='".$service_pack."', id_societe='".$societe."' where id_logiciel='".$code."'";
$resultat=mysql_query($requete) or die(mysql_error());

if($resultat)
  {
    echo("La modification � �t� correctement effectu�e") ;
  }
  else
  {
    echo("La modification � �chou�e") ;
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