<?php
session_start();
var_dump($_SESSION['medicamentsSelectionne']);
if (isset($_SESSION['medicamentsSelectionne'])) {
    $medicamentsSelectionne = $_SESSION['medicamentsSelectionne'];

    foreach ($medicamentsSelectionne as $medicament) {
        if (is_array($medicament)) {
            echo "CIP: " . htmlspecialchars($medicament['CIP'] ?? '') . ", Nom: " . htmlspecialchars($medicament['nom'] ?? 'Inconnu') . ", Type: " . htmlspecialchars($medicament['type'] ?? 'Non spécifié') . ", Quantité disponible: " . htmlspecialchars($medicament['quantite_disponible'] ?? '0') . ", Prix: " . htmlspecialchars($medicament['prix'] ?? '0') . "<br>";
        } else {
            echo "Erreur : médicament attendu comme tableau, obtenu comme chaîne.";
        }
    }
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
    <?php

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
    <td><input type='checkbox' name='medicamentsSelectionne[]' value='" . $item['CIP']."'></td>          
    <td>".$item['CIP']."</td>
    <td>".$item['nom']."</td>
    <td>".$item['type']."</td>
    <td>".$item['quantite_disponible']."</td>
    <td>".$item['prix']."</td>
</tr>";
        }
        echo "</table>";

    ?>
    <div class="containerForm">
            <form class="" method="POST">
                <label></label>

    </form>
</div>

</body>
