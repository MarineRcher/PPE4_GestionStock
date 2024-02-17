<?php

try {
    $pdo = new PDO('mysql:host=db;dbname=gsb;charset=utf8', 'root', 'root');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully\n";

    $sql = "SELECT id_utilisateur, email FROM utilisateurs";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(); // Exécute la requête préparée

    while ($user = $stmt->fetch(PDO::FETCH_ASSOC)) {
        var_dump($user); // Affiche chaque utilisateur
    }

} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

?>
