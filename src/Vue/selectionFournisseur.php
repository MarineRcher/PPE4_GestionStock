<?php
session_start();
// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/FournisseurController.php';
include_once '../model/Fournisseur.php';

$fournisseur = new controller\FournisseurController();
$fournisseurs = $fournisseur->selectFournisseurs();

if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['fournisseurSelectionne'])){
    $fournisseurs = $fournisseur->supprimerFournisseur();
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
    <h2>Fournisseurs</h2>

    <div class="containerSearchTable">
        <div class="containerSearchButton">
            <form class="searchBar" method="POST">
                <input class="inputSearchBar" id="nom" type="search" name="nom" placeholder="Rechercher..." ">
                <input type = "submit"  value = "Rechercher" class="buttonRechercher">
            </form>
            <div class="buttons">
                <form class="" method="POST" action="CommandeStock.php">
                    <button class="buttonFournisseurAjout"  type="submit" name="fournisseurSelectionne">Commander</button>

            </div>
        </div>
        <?php
        // Vérifie si $dataMedicaments est vide
        if (empty($fournisseurs)) {
            echo '<div>Aucun fournisseur enregistré</div>';
        } else {

            echo "<table>
                <tr>
                    <th class='enTete'></th>
                    <th class='enTete'>Nom</th>
                    <th class='enTete'>SIRET</th>
                    <th class='enTete'>Email</th>
                    <th class='enTete'>Téléphone</th>
                    <th class='enTete'>Ville</th>
                    <th class='enTete'>Catégorie</th>
                    
                </tr>";
            foreach ($fournisseurs as $item) {

                echo "<tr>
                    <td ><input type='checkbox' name='fournisseurSelectionne[]' value='" . $item['id_fournisseur'] . "'></td>
                    <td >" .$item['nom'] . "</td>
                    <td >" . $item['SIRET']. "</td>
                    <td >" .$item['email'] . "</td>
                    <td>" .$item['telephone'] . "</td>
                      <td>" .$item['ville'] . "</td>
                      <td>" .$item['categorie'] . "</td>
                </tr>";
            }
            echo '</form>';

            echo'</form>';
            echo "</table>";



        }
        ?>
    </div>
</div>
</body>
