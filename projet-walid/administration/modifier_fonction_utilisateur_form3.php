<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Modifier un fonction_utilisateur</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="lien.css">
</head>

<body bgcolor="#fffcd9" marginheight="30">
<?php

 //r�cup�ration des valeurs des champs:
  //libell�:
  $libelle_fonction_utilisateur     = $_POST["libelle_fonction_utilisateur"] ;
  
  //r�cup�ration de l'identifiant du batiment_etage:
  $id_fonction_utilisateur         = $_POST["id_fonction_utilisateur"] ;
  
  //cr�ation de la requ�te SQL:
  $sql = "UPDATE fonction_utilisateur
            SET libelle_fonction_utilisateur        = '$libelle_fonction_utilisateur'

           WHERE id_fonction_utilisateur = '$id_fonction_utilisateur' " ;
  
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
echo "<form action=\"modifier_fonction_utilisateur_form.php\">\n";
echo "<input type=submit value=\"Retour\">";
echo"</form>";
    // deconnexion de la base
mysql_close(); 
?>
</body>
</html>