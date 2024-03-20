<?php
session_start();

// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/CommandeStockController.php';
include_once '../model/CommandeStock.php';

$modelCommandes = new \controller\CommandeStockController();
$commandes = $modelCommandes->selectCommandesFournisseurs();


?>


<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/Demandes.css">
</head>

<body>
<?php require '../Vue/Header.php'; ?>
<div class="containerTitleTable">
    <h2>Commandes fournisseurs</h2>

    <div class="containerSearchTable">

        <?php

        echo'<div class="bouttons">
      <a href="selectionFournisseur.php"><button>commander</button></a>
         <form method="POST" action="ChangerStatut.php">
          <button class="buttonChangerStatut" type="submit" name="commandeSelectionne[]">Changer le status</button>
</div>';
        // Vérifie si $dataMedicaments est vide
        if (empty($commandes) or !isset($commandes)) {
            echo '<div>Aucune commande enregistrée</div>';
        } else {

            echo "<table>
                <tr>
                     <th></th>
                    <th class='enTete'>Date de de la demande</th>
                    <th class='enTete'>Numéro de la demande</th>
                    <th class='enTete'>Statut de la demande</th>
                    <th class='enTete'>Date de disponibilité souhaitée</th>
                    <th class='enTete'>Catégorie</th>
                    <th class='enTete'>Prix total</th>";



            "</tr>";
            foreach ($commandes as $item) {

                echo "<tr>
                       <td ><input type='checkbox' name='commandeSelectionne[]' value='" . $item['id_commande'] . "'></td>
                     
                    <td >" . $item['date_commande'] . "</td>
                    <td >" . $item['id_commande'] . "</td>
                    <td >" . $item['statut'] . "</td>
                    <td>" . $item['date_disponibilite'] . "</td>
                 <td>" . $item['categorie'] . "</td>
                 <td>" . $item['total_prix'] . "</td>
                 
                 ";
echo"
              
          
              


                </tr>";

            }

            echo "</table>";

           echo" </form>";

        }
        ?>
    </div>
</div>
</body>