<?php

// Inclure le fichier contenant la classe LoginController
require_once __DIR__ . '/../controller/GestionUtilisateurs.php';
include_once __DIR__ . '/../model/Users.php';
// Créer une instance de LoginController
$registerUser = new \controller\GestionUtilisateurs();

// Appeler la méthode login() pour gérer la connexion
$errorMessage = $registerUser->changerMdp();



?>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Connexion</title>
    <link rel="stylesheet" href="../styles/SignInAndUp.css">

</head>
<body>
<div class="containerFormError">
    <?php if(!empty($errorMessage)){ ?>
        <div class='containterErrorMessage'>

            <?= $errorMessage ?>
        </div>
        <?php
    }?>
    <div class="containerForm">
        <form action="" method="POST" id="" class="form">
            <h2 id="ed">Changer de mot de passe</h2>
            Email<input type="text" name="email" id="email" class="input">
            Nom de famille<input type="text" name="nom" id="nom" class="input">
            Confirmation mot de passe<input type="text" name="passwordConfirm1" id="passwordConfirm" class="input">
            Confirmation du nouveau mot de passe<input type="text" name="passwordConfirm2" id="passwordConfirm" class="input">
            <input type="submit" value="Modifier" class="button">
            <p>Vous n'avez pas de compte ? <a href="index?page=inscription"><strong>Inscrivez-vous</strong><a/> </p>
            <p>Vous avez un compte ? <a href="index?page=login"><strong>Connectez-vous</strong><a/> </p>
        </form>
    </div>
</div>
</body>
</html>
