<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Supprimer service pack</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="lien.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#fffcd9" marginheight="30">

<?php

//r�cup�rer les donn�es du formulaire "supprimer_service_pack"
$n=$_REQUEST['libservice_pack'];

//Ne pas effacer les logiciels qui poss�de le service pack supprimer
$requete1="update logiciel set id_service_pack=1 where id_service_pack='".$n."'";
$resultat1 = mysql_query($requete1);

  // requ�te suppression de l'enregistrement
  $query="DELETE 
            FROM service_pack
	    WHERE id_service_pack = ".$n ;
  
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
echo "<input type='button' value=\"Retour\" onclick=\"window.location='supprimer_service_pack_form.php';\">";
echo "</form>";
  // deconnexion de la base
mysql_close(); 

?>
</body>
</html>
