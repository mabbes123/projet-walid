<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Modifier un service</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="lien.css">
</head>

<body bgcolor="#fffcd9" marginheight="30">
<?php

 //r�cup�ration des valeurs des champs:
  //libell�:
  $libelle_service     = $_POST["libelle_service"] ;
  
  //r�cup�ration de l'identifiant du service:
  $id_service         = $_POST["id_service"] ;
  
  //cr�ation de la requ�te SQL:
  $sql = "UPDATE service
            SET libelle_service        = '$libelle_service'

           WHERE id_service = '$id_service' " ;
  
  //ex�cution de la requ�te SQL:
  $requete = mysql_query($sql) or die( mysql_error() ) ;
 
  
  //affichage des r�sultats, pour savoir si la modification a march�e:
  if($requete)
  {
    echo("La modification � �t� correctement effectu�e") ;
  }
  else
  {
    echo("La modification � �chou�e") ;
  }
echo "<form action=\"modifier_service_form.php\">\n";
echo "<input type=submit value=\"Retour\">";
echo"</form>";
    // deconnexion de la base
mysql_close(); 
?>
</body>
</html>