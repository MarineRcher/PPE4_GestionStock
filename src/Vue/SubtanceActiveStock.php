<?php
session_start();

// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/SubtanceActiveController.php';
include_once '../model/Materiel.php';


// Créer une instance
$SubtanceActive = new \controller\SubtanceActiveController();

// Vérifiez si le formulaire a été soumis
if (isset($_POST['CIS'])) {

    $dataSubtanceActive = $SubtanceActive->rechercherSubtanceActive();
} else {

    $dataSubtanceActive = $SubtanceActive->selectSubtanceActive();
}
$subtanceActiveSelectionne= [];
$_SESSION['subtanceActiveSelectionne'] = [];
if (!empty($_POST['subtanceActiveSelectionne']) ) {
    $_SESSION['subtanceActiveSelectionne'] =  $_POST['subtanceActiveSelectionne'];

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
    <h2>Subtances actives</h2>
    <div class="containerTitleTable">
        <div class="containerSearchTable">
            <div class="containerSearchButton">
                <form class="searchBar" method="POST">
                    <input class="inputSearchBar" id="CIS" type="search" name="CIS" placeholder="Rechercher..." ">
                    <input type = "submit"  value = "Rechercher" class="buttonRechercher">
                </form>
                <div class="buttons">

                    <button class="buttonHistorique">Historique</button>
                    <form method="POST" action="CommandeSubtanceActive.php" id="monFormulaire">
                        <button class="buttonCommander" type="submit" name="subtanceActiveSelectionne[]" >Réserver</button>

                </div>
            </div>
            <?php
            // Vérifie si $dataMedicaments est vide
            if (empty($dataSubtanceActive)) {
                echo '<div>Aucun subtance active en stock</div>';
            } else {


                // Si $dataMedicaments n'est pas vide, afficher les données
                echo "<table>
                <tr>
                    <th class='enTete'></th>
                    <th class='enTete'>CIS</th>
                    <th class='enTete'>Nom</th>
                    <th class='enTete'>Type</th>
                      <th class='enTete'>Masse / unité</th>
                    <th class='enTete'>Quantité</th>
                </tr>";
                foreach ($dataSubtanceActive as $item) {

                    echo "<tr>
                    <td><input type='checkbox' name='subtanceActiveSelectionne[]' value='" . $item['CIS'] . "'></td>
                    <td><a href='https://base-donnees-publique.medicaments.gouv.fr/extrait.php?specid=".$item['CIS'] . "'>" .$item['CIS'] . "</a></td>
                    <td>" . $item['nom']. "</td>
                    <td>" .$item['type'] . "</td>
                     <td>" .$item['masse'] . "</td>
                    <td>" .$item['quantite_disponible'] . "</td>
                </tr>";
                }
                echo'</form>';
                echo "</table>";



            }
            ?>


        </div>

    </div>

</div>

</body>
</html>

