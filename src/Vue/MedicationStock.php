<?php
// Inclure le fichier contenant la classe LoginController
require_once '../controller/GestionMedicaments.php';
include_once '../model/Medications.php';
// Créer une instance de LoginController
$medicaments = new GestionMedicaments();

// Appeler la méthode login() pour gérer la connexion
$dataMedicaments = $medicaments->selectMedicament();



?>


    <link rel="stylesheet" href="../styles/MedicationStock.css">


<?php require '../Vue/Header.php'; ?>

<h2>Médicament</h2>
<div class="containerSearchTable">
<form method="GET">
    <input type="search" name="a" placeholder="Recherche..." />
    <input type="submit" value="Valider" />
</form>
    <?php
    // Vérifie si $dataMedicaments est vide
    if (empty($dataMedicaments)) {
        echo '<tr><td colspan="3">Aucun médicament en stock</td></tr>';
    } else {
        // Si $dataMedicaments n'est pas vide, afficher les données
        echo("
<table>
    <tr>
        <td class='enTete'>Nom</td>
        <td class='enTete'>Description</td>
        <td class='enTete'>Quantité</td>
    </tr>
    <tr>
        <td>".$dataMedicaments['nom']."</td>
        <td>".$dataMedicaments['description']."</td>
        <td>".$dataMedicaments['quantite_disponible']."</td>
    </tr>
    ");
    }
    ?>

</table>
</div>
</body>
</html>