<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Supprimer Service</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="lien.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#fffcd9" marginheight="30">

<?php
//r�cup�rer les donn�es du formulaire "supprimer_service"
$n=$_REQUEST['libservice'];

//Ne pas effacer appartenir du service supprimer
$requete1="update appartenir set id_service=1 where id_service='".$n."'";
$resultat1 = mysql_query($requete1);


  // requ�te suppression de l'enregistrement
  $query="DELETE 
            FROM service
	    WHERE id_service = ".$n ;
  
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
echo "<input type='button' value=\"Retour\" onclick=\"window.location='supprimer_service_form.php';\">";
echo "</form>";
  // deconnexion de la base
mysql_close(); 

?>
</body>
</html>
