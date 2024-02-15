<?php
// Inclure le fichier contenant la classe LoginController
include '../Controller/LoginController.php';

// Créer une instance de LoginController
$loginController = new LoginController();

// Appeler la méthode login() pour gérer la connexion
$errorMessage = $loginController->login(); // Récupérer la valeur retournée par la méthode login()

// Maintenant, $errorMessage contient le message d'erreur, s'il y en a un

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
    <?php if ($errorMessage): ?>
        <p class="containterErrorMessage"><?= $errorMessage ?></p>
    <?php endif; ?>
    <form action="SignIn.php" method="POST" class="form">
    <h2 id="ed">Connexion</h2>

        Email<input type="text" name="email" id="email" class="input" required>
        Mot de passe<input type="text" name="password" id="password" class="input" required>
        <input type="submit" value="Connexion" class="button">
        <p>Vous n'avez pas de compte ? <a href="SignUp.php"><strong>Inscrivez-vous</strong><a/> </p>
    </form>

</div>

</body>
</html>



