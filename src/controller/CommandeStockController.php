<?php

namespace controller;
include_once '../Core/controller.php';
use src\Core\Controller;

class CommandeStockController extends Controller
{

    public function selectCategorieFournisseur()
    {
        if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['fournisseurSelectionne'])){
            $modelCategorie = $this->model('CommandeStock');
            foreach ($_POST['fournisseurSelectionne'] as $id)
            $categorie = $modelCategorie->selectCategorie($id);
            return $categorie;

        }
    }
    public function selectSubtancesActives(){
            $modelSubtancesActives = $this->model('CommandeStock');

            $dataSubtancesActives = $modelSubtancesActives->selectSubtancesActives();

            return $dataSubtancesActives;
    }
 public function selectMateriel(){
            $modelMateriel = $this->model('CommandeStock');

            $dataMateriel = $modelMateriel->selectMateriel();

            return $dataMateriel;
    }

    public function commande()
    {

        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_stock'], $_POST['selectedDate'], $_SESSION['id_utilisateur'], $_POST['quantite_disponible'], $_POST['idFournisseur']) ) {

            if(!empty($_POST['selectedDate'])) {

                $idStock = $_POST['id_stock'];
                $quantite_choisi = $_POST['quantite_disponible'];
                $date_livraison= $_POST['selectedDate'];
                $idFournisseur = $_POST['idFournisseur'];

                $modelCommande = $this->model('CommandeStock');
                $modelCommande->premiereCommande($date_livraison, $idFournisseur);
                $error = $modelCommande->commande();

                $combinedArray = array_combine($idStock, $quantite_choisi);
                foreach ($combinedArray as $stock => $quantite) {
                    $modelCommande->detailCommande( $quantite);
                    $errorDetail = $modelCommande->detailCommandeRequete($stock);
                }
                header("Location: ../Vue/HomePage.php");
                //return $error and $errorDetail;
            }else{
                return 'Renseignez une date de livraison souhaitee';
            }

        } else {
            // return "Merci de remplir les champs vides";

        }



    }

}