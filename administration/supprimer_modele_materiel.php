<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Supprimer modele_materiel</title>
<meta http-equiv="Content-modele" content="text/html; charset=UTF-8">
<link href="lien.css" rel="stylesheet" modele="text/css">
</head>
<body bgcolor="#fffcd9" marginheight="30">

<?php
//r�cup�rer les donn�es du formulaire "supprimer_modele_materiel"
$n=$_REQUEST['libmodele_materiel'];

//Ne pas effacer les materiels du modele supprimer
$requete1="update materiel set id_modele_materiel=1 where id_modele_materiel='".$n."'";
$resultat1 = mysql_query($requete1);

  // requ�te suppression de l'enregistrement
  $query="DELETE 
            FROM modele_materiel
	    WHERE id_modele_materiel = ".$n ;
  
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
echo "<input type='button' value=\"Retour\" onclick=\"window.location='supprimer_modele_materiel_form.php';\">";
echo "</form>";
  // deconnexion de la base
mysql_close(); 

?>
</body>
</html>
