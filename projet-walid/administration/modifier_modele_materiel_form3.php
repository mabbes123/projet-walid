<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Modifier mod�le de mat�riel</title>
<meta http-equiv="Content-modele" content="text/html; charset=UTF-8">
<link rel="stylesheet" modele="text/css" href="lien.css">
</head>

<body bgcolor="#fffcd9" marginheight="30">
<?php

 //r�cup�ration des valeurs des champs:
  //libell�:
  $libelle_modele_materiel     = $_POST["libelle_modele_materiel"] ;
  
  //r�cup�ration de l'identifiant du modele de materiel:
  $id_modele_materiel         = $_POST["id_modele_materiel"] ;
  
  //cr�ation de la requ�te SQL:
  $sql = "UPDATE modele_materiel
            SET libelle_modele_materiel        = '$libelle_modele_materiel'

           WHERE id_modele_materiel = '$id_modele_materiel' " ;
  
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
echo "<form action=\"modifier_modele_materiel_form.php\">\n";
echo "<input type=submit value=\"Retour\">";
echo"</form>";
    // deconnexion de la base
mysql_close(); 
?>
</body>
</html>