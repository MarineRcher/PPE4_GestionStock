<?php

session_start();

require_once '../controller/CommandeStockController.php';
require_once '../model/CommandeStock.php';

$subtanceActive = [];
$materiel = [];

$commandeStock= new controller\CommandeStockController();


    $categorie = $commandeStock->selectCategorieFournisseur();
    foreach ($categorie as $item) {
        if ($item['Categorie'] == 'Substances actives') {
            $subtanceActive = $commandeStock->selectSubtancesActives();
        } elseif ($item['Categorie'] == 'Materiel') {
            $materiel = $commandeStock->selectMateriel();

        }elseif($item['Categorie'] == 'Medicament'){
            $medicaments = $commandeStock->selectMedicaments();
        }
    }

?>

<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/Stock.css">
</head>

<body>
<?php require '../Vue/Header.php'; ?>
<div class="containerTitleTable">
    <h2>Commande</h2>
    <div class="containerTitleTable">
        <div class="containerSearchTable">
            <div class="containerSearchButton">
                <form class="searchBar" method="POST">
                    <input class="inputSearchBar" id="CIS" type="search" name="CIS" placeholder="Rechercher...">
                    <input type="submit" value="Rechercher" class="buttonRechercher">
                </form>
                <div class="buttons">
                    <?php if (!empty($subtanceActive)) { ?>
                        <form method="POST" action="CommandeStockDetail.php" id="monFormulaire">
                            <button class="buttonCommander" type="submit" name="subtanceActiveSelectionne[]">Commander</button>

                    <?php } elseif (!empty($materiel)) { ?>
                        <form method="POST" action="CommandeStockDetail.php" id="monFormulaire">
                            <button class="buttonCommander" type="submit" name="materielSelectionne[]">Commander</button>

                    <?php } elseif (!empty($medicaments)) { ?>
                            <form method="POST" action="CommandeStockDetail.php" id="monFormulaire">
                                <button class="buttonCommander" type="submit" name="medicamentsSelectionne[]">Commander</button>

                                <?php } ?>
                </div>
            </div>
            <?php
            if (empty($subtanceActive) && empty($materiel) && empty($medicaments)) {
                echo '<div>Aucune donnée en stock</div>';
            } elseif (!empty($subtanceActive)) {
                foreach ($_POST['fournisseurSelectionne'] as $item) {
                    echo "<input type='hidden' name='idFournisseur' value='" . $item . "' >";
                }
                echo "<table>
                <tr>
                    <th class='enTete'></th>
                    <th class='enTete'>CIS</th>
                    <th class='enTete'>Nom</th>
                    <th class='enTete'>Type</th>
                    <th class='enTete'>Masse / unité</th>
                    <th class='enTete'>Quantité</th>
                       <th class='enTete'>Prix unitaire</th>
                </tr>";

                foreach ($subtanceActive as $item) {
                    echo "<tr>
                    <td><input type='checkbox' name='subtanceActiveSelectionne[]' value='" . $item['CIS'] . "'></td>
                    <td><a href='https://base-donnees-publique.medicaments.gouv.fr/extrait.php?specid=".$item['CIS'] . "'>" .$item['CIS'] . "</a></td>
                    <td>" . $item['nom']. "</td>
                    <td>" .$item['type'] . "</td>
                    <td>" .$item['masse'] . "</td>
                    <td>" .$item['quantite_disponible'] . "</td>
                    <td>" .$item['prix'] . "</td>
                </tr>";
                }
                echo '</form>';
                echo "</table>";
            }elseif (!empty($medicaments)) {
                foreach ($_POST['fournisseurSelectionne'] as $item) {
                    echo "<input type='hidden' name='idFournisseur' value='" . $item . "' >";
                }
                echo "<table>
                <tr>
                    <th class='enTete'></th>
                    <th class='enTete'>CIS</th>
                    <th class='enTete'>Nom</th>
                    <th class='enTete'>Type</th>
                    <th class='enTete'>Quantité</th>
                       <th class='enTete'>Prix unitaire</th>
                </tr>";

                foreach ($medicaments as $item) {
                    echo "<tr>
                    <td><input type='checkbox' name='medicamentsSelectionne[]' value='" . $item['CIS'] . "'></td>
                    <td><a href='https://base-donnees-publique.medicaments.gouv.fr/extrait.php?specid=".$item['CIS'] . "'>" .$item['CIS'] . "</a></td>
                    <td>" . $item['nom']. "</td>
                    <td>" .$item['type'] . "</td>
                    <td>" .$item['quantite_disponible'] . "</td>
                      <td>" .$item['prix'] . "</td>
                </tr>";
                }
                echo '</form>';
                echo "</table>";
            } elseif (!empty($materiel)) {
                foreach ($_POST['fournisseurSelectionne'] as $item) {
                    echo "<input type='hidden' name='idFournisseur' value='" . $item . "' >";
                }
                echo "<table>
                <tr>
                    <th class='enTete'></th>
                    <th class='enTete'>Nom</th>
                    <th class='enTete'>Quantité</th>
                       <th class='enTete'>Prix unitaire</th>
                </tr>";

                foreach ($materiel as $item) {
                    echo "<tr>
                    <td><input type='checkbox' name='materielSelectionne[]' value='" . $item['id_stock'] . "'></td>
                    <td>" . $item['nom']. "</td>
                    <td>" .$item['quantite_disponible'] . "</td>
                      <td>" .$item['prix'] . "</td>
                </tr>";
                }
                echo '</form>';
                echo "</table>";
            }
            ?>
        </div>
    </div>
</div>
</body>
</html>
