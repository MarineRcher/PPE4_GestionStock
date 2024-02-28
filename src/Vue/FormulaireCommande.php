<?php
session_start();

if (isset($_SESSION['medicamentsSelectionne'])) {
    $medicamentsSelectionne = $_SESSION['medicamentsSelectionne'];

} else {
    $error= 'pas de medicament selectionne';
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
    if (empty($error)) {

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
        foreach ($medicamentsSelectionne as $medicament) {
            echo "<tr>
          
    <td>" . $medicament['CIP'] . "</td>
    <td>" . $medicament['nom'] . "</td>
    <td>" . $medicament['type'] . "</td>
    <td>" . $medicament['quantite_disponible'] . "</td>
    <td>" . $medicament['prix'] . "</td>
</tr>";
        }
        echo "</table>";
    }else{
        echo  "<div class='error'>" . $error . "</div>";
    }
    ?>

</div>

</body>
