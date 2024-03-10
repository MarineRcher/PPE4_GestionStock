<?php
session_start();

// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/CommandesController.php';
include_once '../model/Commandes.php';

$commandesParUtilisateur = new CommandesController();
$commandes = $commandesParUtilisateur->selectCommandeParUtilisateur();

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
        <div class="containerSearchButton">
            <form class="searchBar" method="POST">
                <input class="inputSearchBar" id="nom" type="search" name="nom" placeholder="Rechercher par numéro de commande..." ">
                <input type = "submit"  value = "Rechercher" class="buttonRechercher">
            </form>
        </div>
        <?php
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
                    <th class='enTete'>Catégorie</th>
                </tr>";
        foreach ($commandes as $item) {

                echo "<tr>
                    <td >" . $item['date_commande'] . "</td>
                    <td >" . $item['id_commande'] . "</td>
                    <td >" . $item['statut'] . "</td>
                    <td>" . $item['date_disponibilite'] . "</td>
                 <td>" . $item['categorie'] . "</td>
                </tr>";

            }

            echo "</table>";



        }
        ?>
    </div>
</div>
</body>