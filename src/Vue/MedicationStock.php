<?php
// Inclure le fichier contenant la classe LoginController
require_once '../controller/GestionMedicaments.php';
include_once '../model/Medications.php';
// Créer une instance de LoginController
$medicaments = new GestionMedicaments();

// Appeler la méthode login() pour gérer la connexion
$dataMedicaments = $medicaments->selectMedicament();



?>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Titre de la page</title>
    <link rel="stylesheet" href="../styles/MedicationStock.css">

</head>
<body>
<?php require '../Vue/Header.php'; ?>
<table>
<tr>
    <td>Nom</td>
    <td>Description</td>
    <td>Quantite</td>
</tr>
<?php


echo("
<tr>
    <td>".$dataMedicaments['nom']."</td>
    <td>".$dataMedicaments['description']."</td>
    <td>".$dataMedicaments['quantite_disponible']."</td>
</tr>
");

?>
</table>
</body>
</html>