<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Modifier statut de mat�riel</title>
<meta http-equiv="Content-statut" content="text/html; charset=UTF-8">
<link rel="stylesheet" statut="text/css" href="lien.css">
</head>

<body bgcolor="#fffcd9" marginheight="30">
<?php

 //r�cup�ration des valeurs des champs:
  //libell�:
  $libelle_statut_materiel     = $_POST["libelle_statut_materiel"] ;
  
  //r�cup�ration de l'identifiant du statut de materiel:
  $id_statut_materiel         = $_POST["id_statut_materiel"] ;
  
  //cr�ation de la requ�te SQL:
  $sql = "UPDATE statut
            SET libelle_statut  = '$libelle_statut_materiel'

           WHERE id_statut = '$id_statut_materiel' " ;
  
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
echo "<form action=\"modifier_statut_materiel_form.php\">\n";
echo "<input type=submit value=\"Retour\">";
echo"</form>";
    // deconnexion de la base
mysql_close(); 
?>
</body>
</html>