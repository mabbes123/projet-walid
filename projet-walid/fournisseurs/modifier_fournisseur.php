<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Modifier fournisseur</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body bgcolor="#fffcd9" marginheight="25" leftmargin="25">
<?
//r�cup�ration des donn�es � modifier
$code=$_POST["code"];
$nom=$_POST["nom"];
$adresse=$_POST["adresse"];
$ville=$_POST["ville"];
$cp=$_POST["cp"];
$site=$_POST["site"];
$tel=$_POST["tel"];
$port=$_POST["port"];
$fax=$_POST["fax"];
$mail=$_POST["mail"];
$observation=$_POST["observation"];
$type_societe=$_POST["type_societe"];


//requete de mise � jour 
$requete="update societe set nom_societe='".$nom."', adresse_societe='".$adresse."', ville_societe='".$ville."', cp_societe='".$cp."', site_web_societe='".$site."', tel_societe='".$tel."', portable_societe='".$port."', fax_societe='".$fax."', email_societe='".$mail."', observation_societe='".$observation."', id_type_societe='".$type_societe."' where id_societe='".$code."'";
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
echo "<input type='button' value=\"Retour\" onclick=\"window.location='liste_fournisseur.php';\">";
echo "</form>";

// deconnexion de la base
mysql_close(); 

?>
</body>
</html>