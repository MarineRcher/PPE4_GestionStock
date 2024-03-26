<?php
session_start();
include_once __DIR__ . '/../src/controller/JWT.php';

$page = $_GET['page'] ?? 'default';
$jwt = new \controller\JWT();
if(isset($_COOKIE['JWT'])) {
    $payload = $jwt->get_payload($_COOKIE['JWT']);
}
    if (!isset($payload['user_id']) && in_array($page, ['homepage', 'medicament', 'materiel', 'subtanceActive', 'ReservationMateriel', 'ReservationSubtances', 'ReservationMedicament', 'demande', 'Utilisateur', 'role', 'commande', 'status', 'fournisseurs', 'AjoutFournisseur', 'ModificationFournisseur', 'selectFournisseur', 'Commande', 'historique'])) {
        $page = 'login';
    }

switch ($page) {
    case 'login':
        include '../src/Vue/SignIn.php';
        break;
    case 'inscription':
        include '../src/Vue/SignUp.php';
        break;case 'ChangerMdp':
        include '../src/Vue/ChangerMdp.php';
        break;
    case 'homepage':
        include '../src/Vue/HomePage.php';
        break;
     case 'medicament':
        include '../src/Vue/MedicationStock.php';
        break;
    case 'materiel':
        include '../src/Vue/MaterielStock.php';
        break;
    case 'subtanceActive':
        include '../src/Vue/SubtanceActiveStock.php';
        break;
        case 'ReservationMedicament':
        include '../src/Vue/CommandeMedicament.php';
        break;
    case 'ReservationMateriel':
        include '../src/Vue/CommandeMateriel.php';
        break;
    case 'ReservationSubtances':
        include '../src/Vue/CommandeSubtanceActive.php';
        break;
    case 'demande':
        include '../src/Vue/Demandes.php';
        break;
    case 'Utilisateur':
        if($payload['user_role'] == 'Admin') {
            include '../src/Vue/GestionUtilisateurs.php';
        }else{
            include '../src/Vue/SignIn.php';
        }
        break;
    case 'role':
if($payload['user_role'] == 'Admin') {
        include '../src/Vue/ChangerRole.php';
}else{
    include '../src/Vue/SignIn.php';
}
        break;
    case 'commande':
if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {
        include '../src/Vue/AfficherCommandes.php';
}else{
    include '../src/Vue/SignIn.php';
}
        break;
    case 'status':

if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {
        include '../src/Vue/ChangerStatut.php';
}else{
    include '../src/Vue/SignIn.php';
}
        break;
 case 'fournisseurs':

     if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {
        include '../src/Vue/AfficheFournisseurs.php';

}else{
    include '../src/Vue/SignIn.php';
}
        break;

case 'AjoutFournisseur':

if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {
        include '../src/Vue/AjoutFournisseur.php';

}else{
    include '../src/Vue/SignIn.php';
}

        break;

        case 'ModificationFournisseur':

if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {
        include '../src/Vue/ModificationFournisseur.php';
}else{
    include '../src/Vue/SignIn.php';
}
        break;

case 'selectFournisseur':

if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {
        include '../src/Vue/selectionFournisseur.php';
}else{
    include '../src/Vue/SignIn.php';
}
        break;

        case 'CommandeFournisseur':

if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {
        include '../src/Vue/CommandeStock.php';
}else{
    include '../src/Vue/SignIn.php';
}
        break;

        case 'Commande':

if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {
        include '../src/Vue/CommandeStockDetail.php';
}else{
    include '../src/Vue/SignIn.php';
}
        break;

        case 'historique':

if($payload['user_role'] == 'Admin' or $payload['user_role'] == 'SuperUser') {
        include '../src/Vue/Historique.php';
}else{
    include '../src/Vue/SignIn.php';
}
        break;


    default:
        include '../src/Vue/Error.php';
        break;
}

?>

