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
$date1=$_POST['date1'];
// $date1 est une valeur r�cup�r�e au format DD/MM/YYYY
list($d,$m,$y) = explode('/', $date1);
$date_1=$y.'-'.$m.'-'.$d; // date au format anglais

$date2=$_POST['date2'];
// $date2 est une valeur r�cup�r�e au format DD/MM/YYYY
list($d,$m,$y) = explode('/', $date2);
$date_2=$y.'-'.$m.'-'.$d; // date au format anglais


$requete="select nom_complet_intervenant, probleme_intervention, date_probleme, date_intervention, duree_intervention, compte_rendu_intervention, nom_materiel, libelle_type_materiel 
				from materiel , intervention , intervenant, type_materiel
				where materiel.id_materiel=intervention.id_materiel 
						and materiel.id_type_materiel=type_materiel.id_type_materiel
						and intervenant.id_intervenant=intervention.id_intervenant
						and date_intervention between '".$date_1."' and '".$date_2."';";
							
$resultat = mysql_query($requete) or die("erreur dans la requete : " . $requete);
?>

<p align="center" class="style2"><font size="4"><strong>- Recherche d'intervention(s) r�alis�e(s) entre le <?=$date1?> et le <?=$date2?> -</strong></font></p>

<TABLE border="1" align="center" class="tableau">
    <tr>
      <th width="140" align="center" class="style3" >Nom de l'intervenant</th>
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
$nom_intervenant=$row[0];
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
$nom_materiel=$row[6];
$type_materiel=$row[7];





?>
	<td align="center">
        <?=$nom_intervenant."&nbsp;"?>      </td>
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