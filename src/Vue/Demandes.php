<?php


require_once __DIR__ . '/../controller/CommandesController.php';
include_once __DIR__ . '/../model/Commandes.php';
include_once __DIR__ . '/../controller/JWT.php';
$jwt = new \controller\JWT();
$payload = $jwt->get_payload($_COOKIE['JWT']);

$commandesParUtilisateur = new CommandesController();

if($payload['user_role'] == 'SuperUser'or $payload['user_role']=='Admin'){
    $commandes = $commandesParUtilisateur->selectCommandeSuperUser();
}else {
    $commandes = $commandesParUtilisateur->selectCommandeParUtilisateur();
}

?>




<head>
    <meta charset="utf-8">
    <title>Laboratoire GSB</title>
    <link rel="stylesheet" href="../styles/Demandes.css">
</head>

<body>
<?php require __DIR__ . '/../Vue/Header.php'; ?>
<div class="containerTitleTable">
    <h2>Demandes de reservation</h2>

    <div class="containerSearchTable">

        <?php

        if($payload['user_role']=='SuperUser' or $payload['user_role']=='Admin'){

        echo'<form method="POST" action="index.php?page=status">
            <button type="submit">Changer le statut</button>';
        }
        // Vérifie si $dataMedicaments est vide
        if (empty($commandes) or !isset($commandes)) {
            echo '<div>Aucune commande enregistrée</div>';
        } else {

            echo "<table>
                <tr>
                     <th></th>
                    <th class='enTete'>Date de de la demande</th>
                    <th class='enTete'>Numéro de la demande</th>
                    <th class='enTete'>Statut de la demande</th>
                    <th class='enTete'>Date de disponibilité souhaitée</th>
                    <th class='enTete'>Catégorie</th>";
  if($payload['user_role'] == 'SuperUser' or $payload['user_role']=='Admin'){
      echo"<th class='enTete'>Nom du demandeur</th>";
            }
                    "</tr>";
        foreach ($commandes as $item) {

                echo "<tr>
                      <td ><input type='checkbox' name='commandeSelectionne[]' value='" . $item['id_commande'] . "'></td>
                    <td >" . $item['date_commande'] . "</td>
                    <td >" . $item['id_commande'] . "</td>
                    <td >" . $item['statut'] . "</td>
                    <td>" . $item['date_disponibilite'] . "</td>
                 <td>" . $item['categorie'] . "</td>
                 ";
            if($payload['user_role'] == 'SuperUser' or $payload['user_role']=='Admin'){
                echo"
                <td>".$item['nom']."</td>
          
                </form>";
            }

                "</tr>";

            }

            echo "</table>";



        }
        ?>
    </div>
</div>
</body>