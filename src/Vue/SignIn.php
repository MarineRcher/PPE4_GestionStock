<?php

global $pdo;
session_start();
require '../Core/DataBase.php';
if (isset($_SESSION['id_utilisateur'])) {
    header("Location: ../../public/index.php");
    exit;
}
$printError = false;
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'], $_POST['password'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sql = "SELECT id_utilisateur, email, mot_de_passe FROM utilisateurs WHERE email = :email";

        $stmt = $pdo->prepare($sql);
        $stmt->execute(['email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($user)) {
            if ($user && password_verify($password, $user['mot_de_passe'])) {
                $_SESSION['id_utilisateur'] = $user['id_utilisateur'];
                $_SESSION['email_utilisateur'] = $user['email'];
                 header("Location: ../../public/index.php");
                exit;
            } }else {
                $errorMessage = 'Email ou mot de passe incorrect.';
                $printError = True;
            }
}

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
<?php if ($printError == True){
?>
    <div class='containterErrorMessage'>

        <?= $errorMessage ?>
    </div>
<?php
}
?>

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



