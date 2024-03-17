<?php
session_start();
// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/FournisseurController.php';
include_once '../model/Fournisseur.php';

$fournisseur = new controller\FournisseurController();
$fournisseur->AjoutFournisseur();
?>



<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/FormulaireAjout.css">
</head>

<body>
<?php require '../Vue/Header.php'; ?>
<div class="containerTitleForm">
    <h2>Fournisseurs</h2>

    <div class="containerForm">

        <form method="POST">
            <label>Nom</label>
            <input name="nom">
            <label>SIRET</label>
            <input name="SIRET">
            <label>Email</label>
            <input name="email">
            <label>Téléphone</label>
            <input name="telephone">
            <label>Adresse</label>
            <input name="adresse">
            <label>Code postal</label>
            <input name="cp">
            <label>Ville</label>
            <input name="ville">
            <label>Catégorie</label>
            <select name="categorie">
                <option>Subtances actives</option>
                <option>Matériel</option>
            </select>

        <div class="containerBouton">
            <button type="submit">Enregistrer</button>
        </div>
        </form>




    </div>
</div>
</body>
