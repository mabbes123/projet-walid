<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Modifier un batiment_etage</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="lien.css">
</head>

<body bgcolor="#fffcd9" marginheight="30">
<?php

 //r�cup�ration des valeurs des champs:
  //libell�:
  $libelle_batiment_etage     = $_POST["libelle_batiment_etage"] ;
  
  //r�cup�ration de l'identifiant du batiment_etage:
  $id_batiment_etage         = $_POST["id_batiment_etage"] ;
  
  //cr�ation de la requ�te SQL:
  $sql = "UPDATE batiment_etage
            SET libelle_batiment_etage        = '$libelle_batiment_etage'

           WHERE id_batiment_etage = '$id_batiment_etage' " ;
  
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
echo "<form action=\"modifier_batiment_etage_form.php\">\n";
echo "<input type=submit value=\"Retour\">";
echo"</form>";
    // deconnexion de la base
mysql_close(); 
?>
</body>
</html>