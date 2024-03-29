<?php
require_once __DIR__ . '/../controller/GestionUtilisateurs.php';
include_once __DIR__ . '/../model/Users.php';

$utilisateurs = new controller\GestionUtilisateurs();
$dataUtilisateurs = $utilisateurs->selectUtilisateurs();
?>



<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/GestionUtilisateurs.css">
</head>

<body>
<?php require __DIR__ . '/../Vue/Header.php'; ?>
<div class="containerTitleTable">
    <h2>Utilisateurs</h2>

    <div class="containerSearchTable">
        <div class="containerSearchButton">

            <div class="buttons">
                <form method="POST" action="index.php?page=role" id="monFormulaire">
                    <button class="buttonRole" type="submit" name="utilisateurSelectionne[]" >Changer role ou debloquer un compte</button>

            </div>
        </div>
        <?php
        // Vérifie si $dataMedicaments est vide
        if (empty($dataUtilisateurs)) {
            echo '<div>Aucun utilisateur enregistré</div>';
        } else {

            echo "<table>
                <tr>
                    <th class='enTete'></th>
                    <th class='enTete'>Nom</th>
                    <th class='enTete'>Prenom</th>
                    <th class='enTete'>Email</th>
                    <th class='enTete'>Role</th>
                    <th class='enTete'>Tentatives de connexion</th>
                </tr>";
            foreach ($dataUtilisateurs as $item) {

                echo "<tr>
                    <td ><input type='checkbox' name='utilisateurSelectionne[]' value='" . $item['id_utilisateur'] . "'></td>
                    <td >" .$item['nom'] . "</td>
                    <td >" . $item['prenom']. "</td>
                    <td >" .$item['email'] . "</td>
                    <td>" .$item['role'] . "</td>
                      <td>" .$item['tentative'] . "</td>
                </tr>";
            }
            echo'</form>';
            echo "</table>";



        }
        ?>
    </div>
</div>
</body>