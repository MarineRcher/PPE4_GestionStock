<?php
// Inclure le fichier contenant la classe LoginController
require_once __DIR__ . '/../controller/RegisterController.php';
include_once __DIR__ . '/../model/Users.php';
// Créer une instance de LoginController
$registerUser = new RegisterController();

// Appeler la méthode login() pour gérer la connexion
$errorMessage = $registerUser->addUser();



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
        <h2 id="ed">Inscription</h2>
        Prénom<input type="text" name="name" id="name" class="input">
        Nom de famille<input type="text" name="lastName" id="lastName" class="input">
        Email<input type="text" name="email" id="email" class="input">
        Mot de passe<input type="text" name="password" id="password" class="input">
        Confirmation du mot de passe<input type="text" name="passwordConfirm" id="passwordConfirm" class="input">
        <input type="submit" value="Inscription" class="button">
        <p>Vous avez un compte ? <a href="index.php?page=login"><strong>Connectez-vous</strong><a/> </p>
    </form>
</div>
</div>
</body>
</html>
