<?php

require_once __DIR__ . '/../controller/GestionMedicaments.php';
include_once __DIR__ . '/../model/Medications.php';

include_once __DIR__ . '/../controller/JWT.php';
$jwt = new \controller\JWT();
$payload = $jwt->get_payload($_COOKIE['JWT']);
// Créer une instance de GestionMedicaments
$medicaments = new GestionMedicaments();

// Vérifiez si le formulaire a été soumis
if (isset($_POST['CIS'])) {

    $dataMedicaments = $medicaments->rechercherMedicament();
} else {

    $dataMedicaments = $medicaments->selectMedicament();
}
$medicamentsSelectionne= [];
$_SESSION['medicamentsSelectionne'] = [];
if (!empty($_POST['medicamentsSelectionne']) ) {
    $_SESSION['medicamentsSelectionne'] =  $_POST['medicamentsSelectionne'];

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
    <h2>Médicaments</h2>
    <div class="containerTitleTable">
        <div class="containerSearchTable">
            <div class="containerSearchButton">
                <form class="searchBar" method="POST">
                    <input class="inputSearchBar" id="CIS" type="search" name="CIS" placeholder="Rechercher par CIS" ">
                    <input type = "submit"  value = "Rechercher" class="buttonRechercher">
                </form>
                <div class="buttons">
                    <?php  if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {?>
                    <form action="index.php?page=historique" method="POST">
                    <button class="buttonHistorique" name="categorie" type="submit">Historique</button>
                        <input type="hidden" name="categorie" value="medicament">
                    </form>
                    <?php }?>
                    <form method="POST" action="index.php?page=ReservationMedicament" id="monFormulaire">
                       <button class="buttonCommander" type="submit" name="medicamentsSelectionne[]" >Réserver</button>

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
                    <th class='enTete'>CIS</th>
                    <th class='enTete'>Nom</th>
                    <th class='enTete'>Type</th>
                    <th class='enTete'>Quantité</th>
                </tr>";
                    foreach ($dataMedicaments as $item) {

                                echo "<tr>
                    <td><input type='checkbox' name='medicamentsSelectionne[]' value='" . $item['CIS'] . "'></td>
                    <td><a href='https://base-donnees-publique.medicaments.gouv.fr/extrait.php?specid=".$item['CIS'] . "'>" .$item['CIS'] . "</a></td>
                    <td>" . $item['nom']. "</td>
                    <td>" .$item['type'] . "</td>
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
