<?php
session_start();
// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/FournisseurController.php';
include_once '../model/Fournisseur.php';

$fournisseur = new controller\FournisseurController();
$fournisseurs=$fournisseur->selectFournisseurParId();
$fournisseur->modificationFournisseur();

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
    <?php foreach ($fournisseurs as $group){
        foreach ($group as $item) { ?>

            <label>Nom</label>
            <input name="nom" value="<?php echo $item['nom']; ?>">
            <label>SIRET</label>
            <input name="SIRET" value="<?php echo $item['SIRET']; ?>">
            <label>Email</label>
            <input name="email" value="<?php echo $item['email']; ?>">
            <label>Téléphone</label>
            <input name="telephone" value="<?php echo $item['telephone']; ?>">
            <label>Adresse</label>
            <input name="adresse" value="<?php echo $item['adresse']; ?>">
            <label>Code postal</label>
            <input name="cp" value="<?php echo $item['cp']; ?>">
            <label>Ville</label>
            <input name="ville" value="<?php echo $item['ville']; ?>">
            <label>Catégorie</label>
            <select name="categorie">
                <option value="Substances actives" <?php echo ($item['categorie'] == 'Subtances actives') ? 'selected' : ''; ?>>Substances actives</option>
                <option value="Materiel" <?php echo ($item['categorie'] == 'Materiel') ? 'selected' : ''; ?>>Matériel</option>
                <option value="Medicament" <?php echo ($item['categorie'] == 'Medicament') ? 'selected' : ''; ?>>Medicament</option>
            </select>
            <input type="hidden" name="id" value="<?php echo $item['id_fournisseur']; ?>">

        <?php }} ?>
            <div class="containerBouton">

                <button type="submit">Enregistrer</button>
        </form>
            </div>





    </div>
</div>
</body>
