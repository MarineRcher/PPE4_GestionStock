<?php
session_start();

// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/GestionUtilisateurs.php';
include_once '../model/Users.php';

$role = new \controller\GestionUtilisateurs();
if(isset($_POST['id'])){
$errorMessage = $role->changementRole();
}


if (isset($_POST['utilisateurSelectionne']) && !empty($_POST['utilisateurSelectionne'])) {
    $utilisateurSelectionne = $role->utilisateursSelectionnes();
}

?>


<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/ChangerRole.css">
</head>

<body>
<?php require '../Vue/Header.php';
if(!empty($errorMessage)){ ?>
    <div class='containterErrorMessage'>

        <?= $errorMessage ?>
    </div>
    <?php
}?>
<div class="containerTitleTable">
    <h2>Changement des roles</h2>
    <div class="formulaireRole">
        <?php
        if (empty($error)) {
            echo '<form method=POST action=""> ';
            echo "<table>
                    <tr> 
                        <th class='enTete'>Nom</th>
                        <th class='enTete'>Prénom</th>
                        <th class='enTete'>Email</th>
                        <th class='enTete'>Role</th>
                    </tr>";
            foreach ($utilisateurSelectionne as $item) {
                echo "<tr>";
                echo "<td>" . ($item['nom'] ?? 'Non spécifié') . "</td>";
                echo "<td>" . ($item['prenom'] ?? 'Non spécifié') . "</td>";
                echo "<td>" . ($item['email'] ?? 'Non spécifié') . "</td>";
                echo "<td><select name='role[]'>
           <option value='Admin' " . ($item['role'] == 'Admin' ? 'selected' : '') . ">Admin</option>
           <option value='SuperUser' " . ($item['role'] == 'SuperUser' ? 'selected' : '') . ">SuperUser</option>
           <option value='User' " . ($item['role'] == 'User' ? 'selected' : '') . ">User</option>
    </select></td>";

                // Ajout des champs cachés pour chaque utilisateur
                echo "<input name='id[]' type='hidden' value='" . ($item['id_utilisateur'] ?? '') . "' >";
                echo "<input name='nom[]' type='hidden' value='" . ($item['nom'] ?? '') . "' >";
                echo "<input name='prenom[]' type='hidden' value='" . ($item['prenom'] ?? '') . "' >";
                echo "<input name='email[]' type='hidden' value='" . ($item['email'] ?? '') . "' >";

                echo "</tr>";
            }



            echo "</table>";
            echo"<div class='boutton'>";
            echo "<button type='submit'>Modifier</button>";
            echo "</div>";
            echo '</form>';
        }else{
            echo  "<div class='error'>" . $error . "</div>";
        }
        ?>
    </div>
</div>

</div>
</body>
