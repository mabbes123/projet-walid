<?php
include('../connect_base.php');
?>

<html>
<head>
<title>Modifier Type de soci�t�</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="lien.css">
</head>

<body bgcolor="#fffcd9" marginheight="30">
<?php

 //r�cup�ration des valeurs des champs:
  //libell�:
  $libelle_type_societe     = $_POST["libelle_type_societe"] ;
  
  //r�cup�ration de l'identifiant du type de societe:
  $id_type_societe         = $_POST["id_type_societe"] ;
  
  //cr�ation de la requ�te SQL:
  $sql = "UPDATE type_societe
            SET libelle_type_societe        = '$libelle_type_societe'

           WHERE id_type_societe = '$id_type_societe' " ;
  
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
echo "<form action=\"modifier_type_societe_form.php\">\n";
echo "<input type=submit value=\"Retour\">";
echo"</form>";
    // deconnexion de la base
mysql_close(); 
?>
</body>
</html>