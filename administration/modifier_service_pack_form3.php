<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Modifier un service pack</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="lien.css">
</head>

<body bgcolor="#fffcd9" marginheight="30">
<?php

 //r�cup�ration des valeurs des champs:
  //libell�:
  $libelle_service_pack     = $_POST["libelle_service_pack"] ;
  
  //r�cup�ration de l'identifiant du service_pack:
  $id_service_pack         = $_POST["id_service_pack"] ;
  
  //cr�ation de la requ�te SQL:
  $sql = "UPDATE service_pack
            SET libelle_service_pack        = '$libelle_service_pack'

           WHERE id_service_pack = '$id_service_pack' " ;
  
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
echo "<form action=\"modifier_service_pack_form.php\">\n";
echo "<input type=submit value=\"Retour\">";
echo"</form>";
    // deconnexion de la base
mysql_close(); 
?>
</body>
</html>