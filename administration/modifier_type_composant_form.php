<?php
include('../connect_base.php');
?>
<html>
<head>
<title>Modifier Type de composant</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="lien.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#fffcd9" marginheight="30">

<p align="center" class="style2"><strong>- Modifier un type de composant</strong> - </p>
<?php
  //requ�te SQL:
    $sql = "SELECT *
	      FROM type_composant where id_type_composant >1" ;
  
    //ex�cution de la requ�te:
    $requete = mysql_query( $sql) ;
  
    //affichage des donn�es:
    while( $result = mysql_fetch_object( $requete ) )
    {
       echo("<div align=\"center\">".$result->libelle_type_composant."<a href=\"modifier_type_composant_form2.php?id_type_composant=".$result->id_type_composant."\"> Modifier</a><br>\n") ;
    }
echo "<br>";	
echo "<form action=\"type_composant.php\">\n";
echo "<input type=submit value=\"Retour � la page d'administration des types de composant\">";
echo"</form>";

    // deconnexion de la base
mysql_close(); 
  ?>
</body>
</html>