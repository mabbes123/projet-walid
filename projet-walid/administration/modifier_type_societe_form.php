<?php
include('../connect_base.php');
?>
<html>
<head>
<title>Modifier Type de soci�t�</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="lien.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#fffcd9" marginheight="30">

<p align="center" class="style2"><strong>- Modifier un type de soci�t�</strong> - </p>
<?php
  //requ�te SQL:
    $sql = "SELECT *
	      FROM type_societe where id_type_societe>1" ;
  
    //ex�cution de la requ�te:
    $requete = mysql_query( $sql) ;
  
    //affichage des donn�es:
    while( $result = mysql_fetch_object( $requete ) )
    {
       echo("<div align=\"center\">".$result->libelle_type_societe."<a href=\"modifier_type_societe_form2.php?id_type_societe=".$result->id_type_societe."\"> Modifier</a><br>\n") ;
    }
echo "<br>";	
echo "<form action=\"type_societe.php\">\n";
echo "<input type=submit value=\"Retour � la page d'administration des types de soci�t�\">";
echo"</form>";

    // deconnexion de la base
mysql_close(); 
  ?>
</body>
</html>