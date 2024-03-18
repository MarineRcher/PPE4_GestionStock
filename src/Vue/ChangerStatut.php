<?php
session_start();
// Inclure le fichier contenant la classe GestionMedicaments
require_once '../controller/CommandesController.php';
include_once '../model/Commandes.php';


$commandesParUtilisateur = new CommandesController();

$commandesSelectionne = $commandesParUtilisateur->selectCommandeStatut();

if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['statut'], $_POST['id'])) {
 $commandesParUtilisateur->ChangerStatut();
}



?>



<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/ChangerRole.css">
</head>

<body>
<?php require '../Vue/Header.php';
?>
<div class="containerTitleTable">
    <h2>Changement de statut</h2>
    <div class="formulaireRole">
        <?php
        if (empty($error)) {
            echo '<form method=POST action=""> ';
            echo "<table>
                    <tr> 
          
                        <th class='enTete'>Numero de commande</th>
                        <th class='enTete'>Date</th>
                        <th class='enTete'>Statut</th>
                        <th class='enTete'>Date de disponibilite</th>
                        <th class='enTete'>Categorie</th>
                        <th class='enTete'>Changer le statut</th>
                    </tr>";
            foreach ($commandesSelectionne as $group) {
                foreach ($group as $item){
                echo "<tr>";
                echo "<td>" . ($item['id_commande'] ?? 'Non spécifié') . "</td>";
                echo "<td>" . ($item['date_commande'] ?? 'Non spécifié') . "</td>";
                echo "<td>" . ($item['statut'] ?? 'Non spécifié') . "</td>";
                echo "<td>" . ($item['date_disponibilite'] ?? 'Non spécifié') . "</td>";
                echo "<td>" . ($item['categorie'] ?? 'Non spécifié') . "</td>";
               echo "<td><select name='statut[]'>
        <option value='en_attente' " . ($item['statut'] == 'en_attente' ? 'selected' : '') . ">En attente</option>
        <option value='validee' " . ($item['statut'] == 'validee' ? 'selected' : '') . ">Validee</option>
        <option value='invalide' " . ($item['statut'] == 'invalidée' ? 'selected' : '') . ">Invalide</option>
    </select></td>";

                // Ajout des champs cachés pour chaque utilisateur
                echo "<input name='id[]' type='hidden' value='" . ($item['id_commande'] ?? '') . "' >";

                echo "</tr>";
            }}



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


