<?php

include_once '../Core/controller.php';
use src\Core\Controller;
require_once '../controller/JWT.php';
use controller\JWT;
$controller = new Controller();
class CommandesController extends Controller{

     public function commande()
    {

        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_stock'], $_POST['selectedDate'],  $_POST['quantite_disponible']) ) {
            $jwt = new JWT();
            $payload = $jwt->get_payload($_COOKIE['JWT']);

            if(!empty($_POST['selectedDate'])) {

                $idStock = $_POST['id_stock'];
                $quantite_choisi = $_POST['quantite_disponible'];
                $date_resolution = $_POST['selectedDate'];

                $modelCommande = $this->model('Commandes');
                $modelCommande->premiereCommande($date_resolution);

                $error = $modelCommande->commande($payload['user_id']);

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
        $jwt = new JWT();
        $payload = $jwt->get_payload($_COOKIE['JWT']);
        $modelCommande = $this->model('Commandes');
        $commandesParUtilisateur = $modelCommande->selectCommandesParUtilisateur($payload['user_id']);
        return $commandesParUtilisateur;

    }
 public function selectCommandeSuperUser()
    {
        $modelCommande = $this->model('Commandes');
        $commandesParUtilisateur = $modelCommande->selectCommandesSuperUser();
        return $commandesParUtilisateur;

    }
    public function selectCommandeStatut()
    {

            if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['commandeSelectionne'])) {

                foreach ($_POST['commandeSelectionne'] as $id) {
                    $modelCommande = $this->model('Commandes');
                    $commandesParUtilisateur = $modelCommande->selectCommandeStatut($id);

                    if (!empty($commandesParUtilisateur)) {
                        $commandes[] = $commandesParUtilisateur;
                    }
                }
                if(isset($commandes)) {
                    return $commandes;
                }else{
                    header('Location: HomePage.php');

                }
            }else{
                header('Location: HomePage.php');

            }


    }

    public function ChangerStatut()
    {

        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['statut'], $_POST['id'])) {
            $idCommandes = $_POST['id'];
            $statuts = $_POST['statut'];

            $modelCommande = $this->model('Commandes');
            $modelMouvement = $this->model('Mouvements');

            foreach ($statuts as $state) {
                foreach ($idCommandes as $idCom) {

                    $idCom = intval($idCom);
                    $modelCommande->ChangerStatutParId($idCom, $state);
                    $modelCommande->ChangerStatut();

                    if ($state == 'validee') {

                        $stocks = $modelMouvement->selectIdStock($idCom);

                        foreach ($stocks as $stock) {

                            $idStock = $stock['id_stock'];
                            $modelMouvement->insertMouvement($idCom, $idStock);
                            $modelMouvement->mouvementSortie();
                            $modelMouvement->sortieStock();

                        }

                    } else {
                        return 'pas valide';
                    }
                }


            }
             header("Location: ../Vue/HomePage.php");
        }
    }



}