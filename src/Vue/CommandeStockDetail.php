<?php
session_start();

// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/SubtanceActiveController.php';
include_once '../model/SubtanceActive.php';

require_once '../controller/MaterielController.php';
include_once '../model/Materiel.php';

require_once '../controller/CommandeStockController.php';
include_once '../model/CommandeStock.php';

$subtanceActive = new controller\SubtanceActiveController();
$materiel = new controller\MaterielController();

    $commande = new \controller\CommandeStockController();
    $errorMessage = $commande->commande();

if (isset($_POST['subtanceActiveSelectionne']) && !empty($_POST['subtanceActiveSelectionne'])) {
    $SubtanceActiveSelectionne = $subtanceActive->panierSubtanceActive();
}
if (isset($_POST['materielSelectionne'])) {
    $materielSelectionne = $materiel->panierMateriel();
}
    if (isset($_POST['quantite_disponible'])){$_POST['quantite_disponible'] = [];}

?>


<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/FormulaireCommande.css">
</head>

<body>
<?php require '../Vue/Header.php';

if(!empty($errorMessage) or empty($_POST['SubtanceActiveSelectionne'])){ ?>
<div class='containterErrorMessage'>

    <?= $errorMessage ?>
</div>
<?php
}?>
<div class="containerTitleTable">
    <h2>Commande</h2>
    <div class="formulaireCommande">
        <?php
        if (empty($error)) {
            echo '<form method=POST action=""> ';
            if(isset($SubtanceActiveSelectionne)) {
                echo "<input type='hidden' name='idFournisseur' value='" . $_POST['idFournisseur'] . "' >";

                echo "<table>
                    <tr> 
                        <th class='enTete'>CIS</th>
                        <th class='enTete'>Nom</th>
                        <th class='enTete'>Type</th>
                        <th class='enTete'>Masse</th>
                        <th class='enTete'>Quantité</th>
                    </tr>";
                foreach ($SubtanceActiveSelectionne as $group) {
                    foreach ($group as $item) {
                        echo "<tr>";
                        echo "<td>" . ($item['CIS'] ?? 'Non spécifié') . "</td>";
                        echo "<td>" . ($item['nom'] ?? 'Non spécifié') . "</td>";
                        echo "<td>" . ($item['type'] ?? 'Non spécifié') . "</td>";
                        echo "<td>" . ($item['masse'] ?? 'Non spécifié') . "</td>";
                        echo "<td><input class='inputQuantity' type='text' name='quantite_disponible[" . $item['CIS'] . "]' value='" . ($item['quantite_disponible'] ?? '0') . "' /></td>";

                        // Ajout des champs cachés pour chaque médicament
                        echo "<input name='id_stock[]' type='hidden' value='" . ($item['id_stock'] ?? '') . "' >";
                        echo "<input name='CIS[]' type='hidden' value='" . ($item['CIS'] ?? '') . "' >";
                        echo "<input name='nom[]' type='hidden' value='" . ($item['nom'] ?? '') . "' >";
                        echo "<input name='type[]' type='hidden' value='" . ($item['type'] ?? '') . "' >";
                        echo "</tr>";
                    }
                }


                echo "</table>";
            }elseif (isset($materielSelectionne)){
                echo "<input type='hidden' name='idFournisseur' value='" . $_POST['idFournisseur'] . "' >";

                echo "<table>
                    <tr> 
                        <th class='enTete'>Nom</th>
                        <th class='enTete'>Quantité</th>
                    </tr>";
                foreach ($materielSelectionne as $group) {
                    foreach ($group as $item) {
                        echo "<tr>";
                        echo "<td>" . ($item['nom'] ?? 'Non spécifié') . "</td>";
                        echo "<td><input class='inputQuantity' type='text' name='quantite_disponible[" . $item['id_stock'] . "]' value='" . ($item['quantite_disponible'] ?? '0') . "' /></td>";

                        // Ajout des champs cachés pour chaque médicament
                        echo "<input name='id_stock[]' type='hidden' value='" . ($item['id_stock'] ?? '') . "' >";
                        echo "</tr>";
                    }
                }


                echo "</table>";
            }

            echo '<label class="LabelInputButton" for="start"><strong>Date de livraison souhaitee</strong></label>';

            echo'<input class="LabelInputButton" placeholder="dd/mm/yyyy" type="date" id="start" name="selectedDate" min="2020-01-01" max="2030-12-31" />';


            echo "<button class='LabelInputButton' type='submit'>Commander</button>";

            echo '</form>';
        }else{
            echo  "<div class='error'>" . $error . "</div>";
        }
        ?>
    </div>
</div>

</div>
</body>
