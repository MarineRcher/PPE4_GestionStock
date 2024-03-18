<?php

include_once '../Core/controller.php';
use src\Core\Controller;

$controller = new Controller();
class CommandesController extends Controller{

     public function commande()
    {

        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_stock'], $_POST['selectedDate'], $_SESSION['id_utilisateur'], $_POST['quantite_disponible']) ) {
            if(!empty($_POST['selectedDate'])) {

                $idStock = $_POST['id_stock'];
                $quantite_choisi = $_POST['quantite_disponible'];
                $date_resolution = $_POST['selectedDate'];

                $modelCommande = $this->model('Commandes');
                $modelCommande->premiereCommande($date_resolution);
                $error = $modelCommande->commande();

                $combinedArray = array_combine($idStock, $quantite_choisi);
                foreach ($combinedArray as $stock => $quantite) {
                    $modelCommande->detailCommande( $quantite);
                    $errorDetail = $modelCommande->detailCommandeRequete($stock);
                }
                header("Location: ../Vue/HomePage.php");
                //return $error and $errorDetail;
            }else{
                return 'Renseignez une date de réservation';
            }

        } else {
          // return "Merci de remplir les champs vides";

        }


    }

    public function selectCommandeParUtilisateur()
    {

        $modelCommande = $this->model('Commandes');
        $commandesParUtilisateur = $modelCommande->selectCommandesParUtilisateur();
        return $commandesParUtilisateur;

    }
 public function selectCommandeSuperUser()
    {

        $modelCommande = $this->model('Commandes');
        $commandesParUtilisateur = $modelCommande->selectCommandesSuperUser();
        return $commandesParUtilisateur;

    }

    public function ChangerStatut()
    {


    }


}