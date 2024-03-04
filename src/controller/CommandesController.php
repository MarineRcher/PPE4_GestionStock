<?php
include_once '../Core/controller.php';
use src\Core\Controller;

$controller = new Controller();
class CommandesController extends Controller{


    public function commandeMedicament()
    {
        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['cip'], $_POST['selectedDate'], $_SESSION['id_utilisateur'], $_POST['quantite_disponible']) ) {


            $CIP = $_POST['cip'];
            $quantite_choisi = $_POST['quantite_disponible'];
            $date_resolution = $_POST['selectedDate'];

            $modelCommande = $this->model('Commandes');
            $modelCommande->premiereCommande($date_resolution);
            $error=$modelCommande->commande();

            $combinedArray = array_combine($CIP, $quantite_choisi);
            foreach($combinedArray as $cip => $quantite) {
                $modelCommande->detailCommande($cip, $quantite);
                $errorDetail = $modelCommande->detailCommandeRequete();
            }
            header("Location: ../Vue/MedicationStock.php");
            return $error and $errorDetail;

        } else {
            return "Merci de remplir les champs vides";

        }


    }
}