<?php
session_start();

// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/GestionMedicaments.php';
include_once '../model/Medications.php';

// Créer une instance de GestionMedicaments
$medicaments = new GestionMedicaments();


if (isset($_POST['medicamentsSelectionne']) && !empty($_POST['medicamentsSelectionne'])) {
    $medicamentsSelectionne = $medicaments->panierMedicament();

} else {
    $error = 'Pas de médicament sélectionné.';
}

?>


<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/FormulaireCommande.css">
</head>

<body>
<?php require '../Vue/Header.php'; ?>
<div class="containerTitleTable">
    <h2>Médicaments</h2>
    <div class="formulaireCommande">
    <?php
    if (empty($error)) {
        echo '<form method=POST > ';
        echo "<table>
                    <tr> 
                        <th class='enTete'>CIP</th>
                        <th class='enTete'>Nom</th>
                        <th class='enTete'>Type</th>
                        <th class='enTete'>Quantité</th>
                        <th class='enTete'>Prix</th>
                    </tr>";
        foreach ($medicamentsSelectionne as $group) {
            foreach ($group as $item) {
                echo "<tr>";
                echo "<td name='" . $item['CIP'] . "'>" . ($item['CIP'] ?? 'Non spécifié') . "</td>";
                echo "<td name='" . $item['nom'] . "'>" . ($item['nom'] ?? 'Non spécifié') . "</td>";
                echo "<td name='" . $item['type'] . "'>" . ($item['type'] ?? 'Non spécifié') . "</td>";
                 echo "<td><input class='inputQuantity' type='text' name='quantite_disponible[" . $item['quantite_disponible'] . "]' value='" . ($item['quantite_disponible'] ?? '0') . "' /></td>";
                 echo "<td name='" . $item['prix'] . "'>" . ($item['prix'] ?? '0') . "</td>";
                echo "</tr>";
            }
        }

        echo "</table>";

      echo '<label class="LabelInputButton" for="start"><strong>Date de reservation</strong></label>';

        echo'<input class="LabelInputButton" type="date" id="start" name="selectedDate" min="2020-01-01" max="2030-12-31" />';


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
