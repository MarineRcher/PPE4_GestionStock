<?php
require '../Core/DataBase.php';

$message = '';


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
<?php if(!empty($message)){ ?>
    <div class='containterErrorMessage'>

        <?= $message ?>
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
        <p>Vous avez un compte ? <a href="SignIn.php"><strong>Connectez-vous</strong><a/> </p>
    </form>
</div>
</div>
</body>
</html>
