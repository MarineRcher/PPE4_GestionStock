<?php
session_start();
// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/GestionMedicaments.php';
include_once '../model/Medications.php';

// Créer une instance de GestionMedicaments
$medicaments = new GestionMedicaments();

// Initialiser la variable $dataMedicaments
$dataMedicaments = [];

// Vérifiez si le formulaire a été soumis
if (isset($_POST['nom']) && !empty($_POST['nom'])) {

    $dataMedicaments = $medicaments->rechercherMedicament();
} else {

    $dataMedicaments = $medicaments->selectMedicament();
}

if (!empty($_POST['medicamentsSelectionne'])) {
echo 'here';
    $_SESSION['medicamentsSelectionne'] = array_map(function($item) {
        list($CIP, $nom, $type, $quantite, $prix) = explode('|', $item);
        return ['CIP' => $CIP, 'nom' => $nom, 'type' => $type, 'quantite_disponible' => $quantite, 'prix' => $prix];
    }, $_POST['medicamentsSelectionne']);
}
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
                    <form method="POST" action="">
                    <button class="buttonCommander" type="submit" name='medicamentsSelectionne[]' ><a href="FormulaireCommande.php">Commander</a></button>


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
                    $medicamentInfo = $item['CIP'] . '|' . $item['nom'] . '|' . $item['type'] . '|' . $item['quantite_disponible'] . '|' . $item['prix'];

                    echo "<tr>
        <td><input type='checkbox' name='medicamentsSelectionne[]' value='" . $medicamentInfo . "'></td>
        <td>" .$item['CIP'] . "</td>
        <td>" . $item['nom']. "</td>
        <td>" .$item['type'] . "</td>
        <td>" .$item['quantite_disponible'] . "</td>
        <td>" .$item['prix'] . "</td>
    </tr>";
                }

                echo "</table>";
            }
            ?>



        </div>
    </div>
    </form>
</div>

</body>
</html>
