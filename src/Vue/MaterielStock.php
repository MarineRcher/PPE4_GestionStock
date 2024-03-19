<?php
session_start();

// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/MaterielController.php';
include_once '../model/Materiel.php';


// Créer une instance de GestionMedicaments
$materiel= new \controller\MaterielController();

// Vérifiez si le formulaire a été soumis
if (isset($_POST['nom'])) {
    $dataMateriel = $materiel->rechercherMateriel();
} else {
    $dataMateriel = $materiel->selectMateriel();
}
$materielSelectionne= [];
$_SESSION['materielSelectionne'] = [];
if (!empty($_POST['materielSelectionne']) ) {
    $_SESSION['materielSelectionne'] =  $_POST['materielSelectionne'];

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
    <h2>Matériel</h2>
    <div class="containerTitleTable">
        <div class="containerSearchTable">
            <div class="containerSearchButton">
                <form class="searchBar" method="POST">
                    <input class="inputSearchBar" id="nom" type="search" name="nom" placeholder="Rechercher..." ">
                    <input type = "submit"  value = "Rechercher" class="buttonRechercher">
                </form>
                <div class="buttons">
                    <form action="Historique.php" method="POST">
                    <button class="buttonHistorique" name="categorie" type="submit">Historique</button>
                    <input type="hidden" name="categorie" value="Materiel">
                    </form>
                    <form method="POST" action="CommandeMateriel.php" id="monFormulaire">
                        <button class="buttonCommander" type="submit" name="materielSelectionne[]">Réserver</button>

                </div>
            </div>
            <?php
            // Vérifie si $dataMedicaments est vide
            if (empty($dataMateriel)) {
                echo '<div>Aucun matériel en stock</div>';
            } else {


                // Si $dataMedicaments n'est pas vide, afficher les données
                echo "<table>
                <tr>
                    <th class='enTete'></th>
                    <th class='enTete'>Nom</th>  
                    <th class='enTete'>Quantité</th>
                </tr>";
                foreach ($dataMateriel as $item) {

                    echo "<tr>
                    <td><input type='checkbox' name='materielSelectionne[]' value='" . $item['id_stock'] . "'></td>
                    <td>" . $item['nom']. "</td>
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
