<?php
include('../connect_base.php');
?>
<html>
<head>
<title>Modifier Service</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="lien.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#fffcd9" marginheight="30">

<p align="center" class="style2"><strong>- Modifier un service</strong> - </p>
<?php
  //requ�te SQL:
    $sql = "SELECT *
	      FROM service where id_service >1" ;
  
    //ex�cution de la requ�te:
    $requete = mysql_query( $sql) ;
  
    //affichage des donn�es:
    while( $result = mysql_fetch_object( $requete ) )
    {
       echo("<div align=\"center\">".$result->libelle_service."<a href=\"modifier_service_form2.php?id_service=".$result->id_service."\"> Modifier</a><br>\n") ;
    }
echo "<br>";	
echo "<form action=\"service.php\">\n";
echo "<input type=submit value=\"Retour � la page d'administration des Services\">";
echo"</form>";

    // deconnexion de la base
mysql_close(); 
  ?>
</body>
</html>