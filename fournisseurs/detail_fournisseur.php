<?php
include('../connect_base.php');
?>

<html>
<head>
<title>D�tail fournisseur</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../lien.css" rel="stylesheet" type="text/css">
</head>

<body marginheight="40" bgcolor="#fffcd9" leftmargin="30">
<form action="modifier_fournisseur.php" method="POST">
<?php
$societe=$_GET["code"];

//requ�te de travail
$requete="select * from societe where id_societe='$societe'";
$resultat=mysql_query($requete) or die(mysql_error());
while ($row=mysql_fetch_array($resultat))
{
$code=$row[0];
$nom=$row[1];
$adresse=$row[2];
$ville=$row[3];
$cp=$row[4];
$site=$row[5];
$tel=$row[6];
$port=$row[7];
$fax=$row[8];
$mail=$row[9];
$observation=$row[10];
$type_societe=$row[11];
}

// requ�te affichage du nom et du libelle_type de la soci�t�
  $requete1="SELECT libelle_type_societe
            from type_societe t 
	  where id_type_societe=".$type_societe ;
  // execution de la requ�te et test
  $resultat1 = mysql_query($requete1);
  $row1=mysql_fetch_array($resultat1);

$libelle_type_societe=$row1[0];


echo "<center><span class=style2>D�tail sur la soci�t� ".$nom."</span><br>";
echo "<br><br>";
?>
<input type="hidden" name="code" value="<?=$code?>">
Nom : <input name="nom" type="text"  value="<?=$nom?>" readonly="1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
Type de soci�t� : <input name="type_societe" type="text"  value="<?=$libelle_type_societe?>" readonly="1"><br><br>
Adresse : <textarea name="adresse" readonly="1"><?=$adresse?></textarea><br><br>
Ville : <input name="ville" type="text"  value="<?=$ville?>" readonly="1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
Code postal : <input name="cp" type="text"  value="<?=$cp?>" readonly="1"><br><br>
Site Web : <input name="site" type="text" value="<?=$site?>" readonly="1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
T�l�phone : <input name="tel" type="text"  value="<?=$tel?>" readonly="1"><br><br>
T�l�phone Portable : <input name="port" type="text"  value="<?=$port?>" readonly="1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
Fax : <input name="fax" type="text"  value="<?=$fax?>" readonly="1"><br><br>
E-Mail : <input name="mail" type="text"  value="<?=$mail?>" readonly="1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
Observation : <textarea name="observation" readonly="1"><?=$observation?></textarea><br><br>




<input type="button" value="Retour" onClick="window.location='liste_fournisseur.php';">
</form>

</body>
</html>

<?
// deconnexion de la base
mysql_close(); 
?>