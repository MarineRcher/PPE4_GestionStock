<?php
session_start();

// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/CommandesController.php';
include_once '../model/Commandes.php';

$commandesParUtilisateur = new CommandesController();
if($_SESSION['role'] == 'SuperUser'){
    $commandes = $commandesParUtilisateur->selectCommandeSuperUser();
}else {
    $commandes = $commandesParUtilisateur->selectCommandeParUtilisateur();
}

?>




<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/Demandes.css">
</head>

<body>
<?php require '../Vue/Header.php'; ?>
<div class="containerTitleTable">
    <h2>Commandes</h2>

    <div class="containerSearchTable">

        <?php

        if($_SESSION['role']=='SuperUser'){

        echo'<form method="POST">
    <button>Changer le statut</button>';
        }
        // Vérifie si $dataMedicaments est vide
        if (empty($commandes) or !isset($commandes)) {
            echo '<div>Aucune commande enregistrée</div>';
        } else {

            echo "<table>
                <tr>
                    <th class='enTete'>Date de de la demande</th>
                    <th class='enTete'>Numéro de la demande</th>
                    <th class='enTete'>Statut de la demande</th>
                    <th class='enTete'>Date de disponibilité souhaitée</th>
                    <th class='enTete'>Catégorie</th>";
  if($_SESSION['role'] == 'SuperUser'){
      echo"<th class='enTete'>Nom du demandeur</th>
<th class='enTete'>Changer le statut</th>";
            }
                    "</tr>";
        foreach ($commandes as $item) {

                echo "<tr>
                    <td >" . $item['date_commande'] . "</td>
                    <td >" . $item['id_commande'] . "</td>
                    <td >" . $item['statut'] . "</td>
                    <td>" . $item['date_disponibilite'] . "</td>
                 <td>" . $item['categorie'] . "</td>
                 ";
            if($_SESSION['role'] == 'SuperUser'){
                echo"
                <td>".$item['nom']."</td>
                <td><select name='statut[]'>
           <option value='Admin' " . ($item['statut'] == 'en_attente' ? 'selected' : '') . ">En attente</option>
           <option value='SuperUser' " . ($item['statut'] == 'validee' ? 'selected' : '') . ">Validee</option>
           <option value='User' " . ($item['statut'] == 'invalidée' ? 'selected' : '') . ">Invalide</option>
                </select></td>
                </form>";
            }

                "</tr>";

            }

            echo "</table>";



        }
        ?>
    </div>
</div>
</body>