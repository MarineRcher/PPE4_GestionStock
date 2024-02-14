<?php
require '../Core/DataBase.php';

$message = '';
global $pdo;
// Vérification de la soumission du formulaire
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email']) && isset($_POST['password'])) {
    if ($_POST['passwordConfirm'] == $_POST['password']) {
        $nom = $_POST['name'];
        $prenom = $_POST['lastName'];
        $email = $_POST['email'];
        $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Hashage du mot de passe

        // Vérification si l'email est déjà utilisé
        $sql = "SELECT id_utilisateur FROM utilisateurs WHERE email = :email";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            $message = 'Cet email est déjà utilisé.';
        } else {
            // Insertion du nouvel utilisateur
            $sql = "INSERT INTO utilisateurs (nom, prenom, email, mot_de_passe) VALUES (:nom, :prenom, :email, :password)";
            $stmt = $pdo->prepare($sql);

            if ($stmt->execute(['nom' => $nom, 'prenom' => $prenom, 'email' => $email, 'password' => $password])) {
                $message = 'Compte créé avec succès.';
            } else {
                $message = 'Erreur lors de la création du compte.';
            }
        }
    } else {
        $message = 'Les deux mot de passes doivent être les mêmes';
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
