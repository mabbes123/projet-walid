<?php
include('../connect_base.php');
?>
<html>
<head>
<title>Modifier Batiment-Etage</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="lien.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#fffcd9" marginheight="30">

<p align="center" class="style2"><strong>- Modifier un batiment-�tage</strong> - </p>
<?php
  //requ�te SQL:
    $sql = "SELECT *
	      FROM batiment_etage where id_batiment_etage>1" ;
  
    //ex�cution de la requ�te:
    $requete = mysql_query( $sql) ;
  
    //affichage des donn�es:
    while( $result = mysql_fetch_object( $requete ) )
    {
       echo("<div align=\"center\">".$result->libelle_batiment_etage."<a href=\"modifier_batiment_etage_form2.php?id_batiment_etage=".$result->id_batiment_etage."\"> Modifier</a><br>\n") ;
    }
echo "<br>";	
echo "<form action=\"batiment_etage.php\">\n";
echo "<input type=submit value=\"Retour � la page d'administration des Batiments-Etages\">";
echo"</form>";

    // deconnexion de la base
mysql_close(); 
  ?>
</body>
</html>