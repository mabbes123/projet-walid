<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Supprimer type_intervenant</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="lien.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#fffcd9" marginheight="30">

<?php
//r�cup�rer les donn�es du formulaire "supprimer_type_intervenant"
$n=$_REQUEST['libtype_intervenant'];

//Ne pas effacer les intervenants du type associ� supprim�
$requete1="update intervenant set id_type_intervenant=1 where id_type_intervenant='".$n."'";
$resultat1 = mysql_query($requete1);

  // requ�te suppression de l'enregistrement
  $query="DELETE 
            FROM type_intervenant
	    WHERE id_type_intervenant = ".$n ;
  
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
echo "<input type='button' value=\"Retour\" onclick=\"window.location='supprimer_type_intervenant_form.php';\">";
echo "</form>";
  // deconnexion de la base
mysql_close(); 

?>
</body>
</html>
