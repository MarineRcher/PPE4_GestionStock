<?php
include_once __DIR__ . '/../controller/JWT.php';
$jwt = new \controller\JWT();
$payload = $jwt->get_payload($_COOKIE['JWT']);
?>

<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/Header.css">
</head>
<body>
<div class="containerLogoMenu">
<img src="../Assets/GSB.png"  alt=" " class="imgLogo"/>
    <div class="containterLogOutMenu">

        <div class="containerlogOut">
            <a href="../controller/logout.php" class="containerlogOut">
            <img src="../Assets/logout.png" alt=" " class="iconLogOut" />
            </a>
        </div>
    <nav>
        <ul>
            <li><a href="index.php?page=homepage">Accueil</a></li>
            <li class="deroulant" ><a href="#">Gestion de stock &ensp;</a>
                <ul class="sous">
                    <li><a href="index.php?page=medicament">Médicaments</a></li>
                    <li><a href="index.php?page=subtanceActive">Subtances Actives</a></li>
                    <li><a href="index.php?page=materiel">Matériels</a></li>
                </ul>
            </li>
            <li><a href="index.php?page=demande">Demandes</a></li>
<?php
            if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {?>
            <li><a href="index.php?page=fournisseurs">Gestion fournisseurs</a></li>
            <li><a href="index.php?page=commande">Commandes</a></li>
            <?php }if($payload['user_role'] == 'Admin'){ ?>
            <li><a href="index.php?page=Utilisateur">Utilisateurs</a></li>
<?php } ?>
        </ul>
    </nav>

    </div>
</div>