<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Supprimer statut_materiel</title>
<meta http-equiv="Content-statut" content="text/html; charset=UTF-8">
<link href="lien.css" rel="stylesheet" statut="text/css">
</head>
<body bgcolor="#fffcd9" marginheight="30">

<?php
//r�cup�rer les donn�es du formulaire "supprimer_statut_materiel"
$n=$_REQUEST['site_ceff'];

//Ne pas effacer appartenir affecter � la soci�t� ceff supprimer
$requete1="update appartenir set id_societe=1 where id_societe='".$n."'";
$resultat1 = mysql_query($requete1);


  // requ�te suppression de l'enregistrement
  $query="DELETE 
            FROM societe
	    WHERE id_societe = ".$n ;
  
  // execution de la requ�te et test
  $resultat = mysql_query($query);

 if($resultat)
  {
    echo("La suppression � �t� correctement effectu�e") ;
  }
  else
  {
    echo("La suppression � �chou�e") ;
  }

  // bouton de retour
echo "<form>";
echo "<input type='button' value=\"Retour\" onclick=\"window.location='supprimer_site_ceff_form.php';\">";
echo "</form>";
  // deconnexion de la base
mysql_close(); 

?>
</body>
</html>
