<?php
include('../connect_base.php');
?>
<html>
<head>
<title>Affecter mat�riel � un utilisateur</title>
<link href="../lien.css" rel="stylesheet" type="text/css">
<script>
List = new Array();
function Remplir(valeur){
	var sel="";
    sel ="<select size='1' name='materiel'>";
   // Parcourir le tableau
   for (var i=0;i<List.length;i++)
    {
      // tester si la ligne du tableau (materiel) correspond � la valeur du type_materiel
      if (List[i][1]==valeur)
      {
        // Ajouter une rubrique materiel au variable SEL
        sel= sel + "<option value="+List[i][0]+">"+List[i][2]+"</option>";
      }
  
    }
    sel =sel + "</select>";
    // Modifier le DIV id_materiel par la nouvelle List � partir du variable SEL
    document.getElementById('id_materiel').innerHTML=sel;
 }
 </script>

 </head>
 <body marginheight="40" bgcolor="#fffcd9">
<p align="center" class="style2"><strong>- Affecter un mat�riel � un utilisateur -</strong></p>
 <center>
 <form method="POST" action="affecter_materiel.php">
 <table align="center">
 <tr>
 	<td>Type de mat�riel : </td>
    <td><select size="1" name="type_materiel" OnChange="Remplir(type_materiel.value)">
  		<?php
 			$i=0; // variable de test
 			$j=0; // variable pour garder la valeur du premier enregistrement cat�gorie pour l'affichage
  
 			// S�l�ction de tous les enregistrements de la table Cat�gorie
 			$requete1="Select id_type_materiel, libelle_type_materiel from type_materiel where id_type_materiel >1 and libelle_type_materiel <>'Serveur' and libelle_type_materiel <>'Switch' order by libelle_type_materiel;";
 			$resultat1= mysql_query ($requete1) or die ("Select impossible");
  
			 while ($recup1=mysql_fetch_row($resultat1))
 			{
  				// Remplir la liste d�roulante des cat�gorie
 				 echo "\t\t<option value=".($recup1[0]).">".($recup1[1])."</option>";
  				 if ($i==0) { $j=$recup1[0]; $i=1; } // garder la valeur du premier enregistrement
  			}
 
 		?>

 		</select></td></tr>
 	 <tr><td> <font>Nom du mat�riel :</font></td>
	 <td><DIV id="id_materiel">
 <select size="1" name="materiel">
 </select>
 
 </DIV></td>
  <td> Utilisateur du mat�riel : </td>
  <td><?php
			$requete2 = mysql_query("SELECT * FROM utilisateur where nom_complet_utilisateur <> 'admin admin' and id_utilisateur>1");
			?>

			<select name="utilisateur" id="utilisateur">
			<?php
				while($recup2 = mysql_fetch_array($requete2)) {
			?>
   			<option value="<?php echo $recup2['id_utilisateur']; ?>" selected><?php echo $recup2['nom_complet_utilisateur']; ?>
			</option>
			<?php
    		}
			?>
            </select>
  </tr>
  <br><br><?php
  
 // S�l�ction de tous les enregistrements de la table materiel
 $requete3="Select id_materiel, id_type_materiel, nom_materiel from materiel 
 		where id_utilisateur is null 
		order by nom_materiel;";
 $resultat3= mysql_query ($requete3) or die ("Select impossible");
 // $i = initialise le variable i
 $i=0;
 while ($recup3=mysql_fetch_row($resultat3))
 {
  // Remplir le tableau (array) en javascript
  // ex : List[1]=new Array (1,1,"materiel 1");
  // ex : List[2]=new Array (2,1,"materiel 2");
  echo "<script>List[".$i."] = new Array(".($recup3[0]).",".($recup3[1]).",'".($recup3[2])."');</script>";
  $i=$i+1; // Incr�mentation de $i
 }
 echo "<script>Remplir ($j); </script>"; // Remplir la deuxi�me liste de choix avec les donn�es
                                         // des materiels en utilisant la valeur j
 ?>
 </table>
 <br><br>
 <table>
   <tr><td><td><input type="submit" name="Envoyer" value="Affecter"></td></td></tr>
   	</table>

 </form>
 </center>
 </body>
 </html>
<?php
// deconnexion de la base
mysql_close();
?>