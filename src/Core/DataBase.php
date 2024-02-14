<?php
$host = 'db';
$dbname = 'GSB';
$username = 'user';
$password = 'password';

try {

    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);

    // Définir le mode d'erreur de PDO à exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Impossible de se connecter à la base de données : " . $e->getMessage());
}
?>
