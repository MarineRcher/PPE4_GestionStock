<?php
session_start();

include_once '../controller/MouvementController.php';
include_once '../model/Mouvements.php';

$mouvement= new \controller\MouvementController();

$historique=$mouvement->selectMouvements();
?>


<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/GestionUtilisateurs.css">
</head>

<body>
<?php require '../Vue/Header.php'; ?>
<div class="containerTitleTable">
    <h2>Mouvements dans le stock</h2>

    <div class="containerSearchTable">

        <?php
        // Vérifie si $dataMedicaments est vide
        if (empty($historique)) {
            echo '<div>Aucun mouvement enregistré</div>';
        } else {

            echo "<table>
                <tr>
                  
                    <th class='enTete'>Date</th>
                    <th class='enTete'>Type de mouvement</th>
                    <th class='enTete'>Nom du produit</th>
                    <th class='enTete'>Categorie</th>
                    <th class='enTete'>Quantite</th>
                    <th class='enTete'>Nom de l'employe</th>
                </tr>";
            foreach ($historique as $item) {

                echo "<tr>
                  
                    <td >" .$item['date_mouvement'] . "</td>
                    <td >" . $item['type_mouvement']. "</td>
                    <td >" .$item['nom_produit'] . "</td>
                    <td>" .$item['categorie'] . "</td>
                    <td>" .$item['quantite'] . "</td>
                    <td>" .$item['nom'] . "</td>
                </tr>";
            }
            echo'</form>';
            echo "</table>";



        }
        ?>
    </div>
</div>
</body>