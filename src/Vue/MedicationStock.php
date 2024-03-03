<?php
session_start();
// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/GestionMedicaments.php';
include_once '../model/Medications.php';



// Créer une instance de GestionMedicaments
$medicaments = new GestionMedicaments();

// Vérifiez si le formulaire a été soumis
if (isset($_POST['nom'])) {

    $dataMedicaments = $medicaments->rechercherMedicament();
} else {

    $dataMedicaments = $medicaments->selectMedicament();
}
$medicamentsSelectionne= [];
$_SESSION['medicamentsSelectionne'] = [];
if (!empty($_POST['medicamentsSelectionne']) ) {
    $_SESSION['medicamentsSelectionne'] =  $_POST['medicamentsSelectionne'];

}

var_dump($_SESSION['medicamentsSelectionne']);
?>


<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/MedicationStock.css">
</head>

<body>
<?php require '../Vue/Header.php'; ?>
<div class="containerTitleTable">
    <h2>Médicaments</h2>
    <div class="containerTitleTable">
        <div class="containerSearchTable">
            <div class="containerSearchButton">
                <form class="searchBar" method="POST">
                    <input class="inputSearchBar" id="nom" type="search" name="nom" placeholder="Rechercher..." ">
                    <input type = "submit"  value = "Rechercher" class="buttonRechercher">
                </form>
                <div class="buttons">

                    <button class="buttonHistorique">Historique</button>
                    <form method="POST" action="FormulaireCommande.php" id="monFormulaire">
                       <button class="buttonCommander" type="submit" name="medicamentsSelectionne[]" >Commander</button>

                </div>
            </div>
            <?php
            // Vérifie si $dataMedicaments est vide
            if (empty($dataMedicaments)) {
                echo '<div>Aucun médicament en stock</div>';
            } else {


                // Si $dataMedicaments n'est pas vide, afficher les données
            echo "<table>
                <tr>
                    <th class='enTete'></th>
                    <th class='enTete'>CIP</th>
                    <th class='enTete'>Nom</th>
                    <th class='enTete'>Type</th>
                    <th class='enTete'>Quantité</th>
                    <th class='enTete'>Prix</th>
                </tr>";
                    foreach ($dataMedicaments as $item) {

                                echo "<tr>
                    <td><input type='checkbox' name='medicamentsSelectionne[]' value='" . $item['CIP'] . "'></td>
                    <td>" .$item['CIP'] . "</td>
                    <td>" . $item['nom']. "</td>
                    <td>" .$item['type'] . "</td>
                    <td>" .$item['quantite_disponible'] . "</td>
                    <td>" .$item['prix'] . "</td>
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
