<?php
include('../connect_base.php');
?>
<html>
<head>
<title>Recherche intervenation en fonction du nom du mat�riel</title>
<link href="../lien.css" rel="stylesheet" type="text/css">
</head>

<body marginheight="40" bgcolor="#fffcd9">
<?
$intervenant=$_POST['intervenant'];

$requete1="select nom_complet_intervenant from intervenant where id_intervenant=".$intervenant.";";
$resultat1 = mysql_query($requete1) or die("erreur dans la requete : " . $requete1);
$row=mysql_fetch_array($resultat1);
$nom_intervenant=$row[0];


$requete="select nom_materiel, probleme_intervention, date_probleme, date_intervention, duree_intervention, compte_rendu_intervention, libelle_type_materiel 
				from materiel , intervention , intervenant, type_materiel
				where materiel.id_materiel=intervention.id_materiel 
						and materiel.id_type_materiel=type_materiel.id_type_materiel
						and intervenant.id_intervenant=intervention.id_intervenant
						and intervenant.id_intervenant=".$intervenant.";";
							
$resultat = mysql_query($requete) or die("erreur dans la requete : " . $requete);
?>
<p align="center" class="style2"><strong>- Recherche d'intervention r�alis�e par <?=$nom_intervenant?> -</strong></p>
<TABLE border="1" align="center" class="tableau">
    <tr>
      <th width="140" align="center" class="style3" >Nom du mat�riel</th>
	  <th width="140" align="center" class="style3" >Type de mat�riel</th>
      <th width="140" align="center" class="style3" >Probl�me</th>
      <th width="120" align="center" class="style3" >Date du probl�me</th>
	  <th width="120" align="center" class="style3" >Date intervention</th>
	  <th width="100" align="center" class="style3" >Dur�e intervention</th>
	  <th width="180" align="center" class="style3" >Compte-rendu</th>
    </tr>

<?
while ($row=mysql_fetch_array($resultat))
{
$nom_materiel=$row[0];
$probleme_intervention=$row[1];
$date_probleme=$row[2];
// $date_probleme est une valeur r�cup�r�e au format YYYY-MM-DD
list($y,$m,$d) = explode('-', $date_probleme);
$date_probleme=$d.'/'.$m.'/'.$y; // date au format fran�ais

$date_intervention=$row[3];
// $date_intervention est une valeur r�cup�r�e au format YYYY-MM-DD
list($y,$m,$d) = explode('-', $date_intervention);
$date_intervention=$d.'/'.$m.'/'.$y; // date au format fran�ais

$duree_intervention=$row[4];
$compte_rendu=$row[5];
$type_materiel=$row[6];



?>
	<td align="center">
        <?=$nom_materiel."&nbsp;"?>      </td>
	<td align="center">
        <?=$type_materiel."&nbsp;"?>      </td>	
	<td align="center">
        <?=$probleme_intervention."&nbsp;"?>      </td>
    <td align="center">
        <?=$date_probleme."&nbsp;"?>      </td>  	
	<td align="center">
        <?=$date_intervention."&nbsp;"?>      </td>
	<td align="center">
        <?=$duree_intervention."&nbsp;"?>      </td>
	<td align="center">
        <?=$compte_rendu."&nbsp;"?>      </td>
</tr>
<?php
}
?>
</TABLE><br>
<center><input type="button" value="Retour" onClick="window.location='liste_intervention.php'"></input></center>

</body>
</html>
<?php
// deconnexion de la base
mysql_close();
?>