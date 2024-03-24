<?php



require_once __DIR__ . '/../controller/CommandeStockController.php';
require_once __DIR__ . '/../model/CommandeStock.php';


$dataSubtanceActive = [];
$dataMateriel = [];

$commandeStock= new controller\CommandeStockController();


    $categorie = $commandeStock->selectCategorieFournisseur();

    foreach ($categorie as $item) {
        if ($item['Categorie'] == 'Substances actives') {

                $dataSubtanceActive = $commandeStock->selectSubtancesActives();

        } elseif ($item['Categorie'] == 'Materiel') {

                $dataMateriel = $commandeStock->selectMateriel();


        }elseif($item['Categorie'] == 'Medicament'){

                $dataMedicaments = $commandeStock->selectMedicaments();

        }
    }

?>

<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/Stock.css">
</head>

<body>
<?php require __DIR__ . '/../Vue/Header.php'; ?>
<div class="containerTitleTable">
    <h2>Commande</h2>
    <div class="containerTitleTable">
        <div class="containerSearchTable">
            <div class="containerSearchButton">

                <div class="buttons">
                    <?php if (!empty($dataSubtanceActive)) { ?>
                        <form method="POST" action="index?page=Commande" id="monFormulaire">
                            <button class="buttonCommander" type="submit" name="subtanceActiveSelectionne[]">Commander</button>

                    <?php } elseif (!empty($dataMateriel)) { ?>
                        <form method="POST" action="index?page=Commande" id="monFormulaire">
                            <button class="buttonCommander" type="submit" name="materielSelectionne[]">Commander</button>

                    <?php } elseif (!empty($dataMedicaments)) { ?>
                            <form method="POST" action="index?page=Commande" id="monFormulaire">
                                <button class="buttonCommander" type="submit" name="medicamentsSelectionne[]">Commander</button>

                                <?php } ?>
                </div>
            </div>
            <?php
            if (empty($dataSubtanceActive) && empty($dataMateriel) && empty($dataMedicaments)) {
                echo '<div>Aucune donnée en stock</div>';
            } elseif (!empty($dataSubtanceActive)) {
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

                foreach ($dataSubtanceActive as $item) {
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
            }elseif (!empty($dataMedicaments)) {
                foreach ($_POST['fournisseurSelectionne'] as $item) {
                    echo "<input type='hidden' name='idFournisseur' value='" . $item . "' >";
                    echo "<input type='hidden' name='fournisseurSelectionne' value='" . $item . "' >";
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

                foreach ($dataMedicaments as $item) {
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
            } elseif (!empty($dataMateriel)) {
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

                foreach ($dataMateriel as $item) {
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
