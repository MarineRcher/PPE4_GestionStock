<?php

namespace controller;
include_once '../Core/controller.php';
use src\Core\Controller;

class CommandeStockController extends Controller
{

    public function selectCommandesFournisseurs()
    {
        $modelCommandes = $this->model('CommandeStock');
        $commandes= $modelCommandes->selectCommandesFournisseurs();
        return $commandes;
    }
    public function selectCategorieFournisseur()
    {

        if($_SERVER["REQUEST_METHOD"] == "POST" ){
        if(isset($_POST['fournisseurSelectionne']) && is_array($_POST['fournisseurSelectionne'])){
            $modelCategorie = $this->model('CommandeStock');
           foreach ($_POST['fournisseurSelectionne'] as $id) {
                $categorie = $modelCategorie->selectCategorie($id);
           }
            if(empty($categorie)){
                header('Location: selectionFournisseur.php');
            }else {
                return $categorie;

            }
        }
            header('Location: selectionFournisseur.php');
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
public function selectMedicaments(){
            $modelMedicament = $this->model('CommandeStock');

            $dataMedicaments = $modelMedicament->selectMedicaments();

            return $dataMedicaments;
    }

    public function commande()
    {

        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_stock'], $_POST['selectedDate'], $_SESSION['id_utilisateur'], $_POST['quantite_disponible'], $_POST['idFournisseur'], $_POST['prix']) ) {

            if(!empty($_POST['selectedDate'])) {
                $prix=$_POST['prix'];
                $idStock = $_POST['id_stock'];
                $quantite_choisi = $_POST['quantite_disponible'];
                $date_livraison= $_POST['selectedDate'];
                $idFournisseur = $_POST['idFournisseur'];

                $combinedArray= array_combine($quantite_choisi,$prix);
                foreach ($combinedArray as $quantite => $prixUnitaire){
                    $prixTotal = $quantite * $prixUnitaire;
                }

                $modelCommande = $this->model('CommandeStock');
                $modelCommande->premiereCommande($date_livraison, $idFournisseur, );
                $error = $modelCommande->commande();

                $combinedArray = array_combine($idStock, $quantite_choisi);
                foreach ($combinedArray as $stock => $quantite) {
                    $modelCommande->detailCommande($quantite, $prixTotal);
                    $errorDetail = $modelCommande->detailCommandeRequete($stock);
                }
                header("Location: ../Vue/HomePage.php");
                //return $error and $errorDetail;
            }else{
                return 'Renseignez une date de livraison souhaitee';
            }

        } else {
             return "Merci de remplir les champs vides";

        }

    }

    public function ChangerStatut()
    {

        if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['statut'], $_POST['id'])) {
            $idCommandes = $_POST['id'];
            $statuts = $_POST['statut'];

            $modelCommande = $this->model('CommandeStock');
            $modelMouvement = $this->model('Mouvements');

            foreach ($statuts as $state) {
                foreach ($idCommandes as $idCom) {

                    $idCom = intval($idCom);
                    $modelCommande->ChangerStatutParId($idCom, $state);
                    $modelCommande->ChangerStatut();

                    if ($state == 'recu') {

                        $stocks = $modelMouvement->selectIdStock($idCom);

                        foreach ($stocks as $stock) {

                            $idStock = $stock['id_stock'];
                            $modelMouvement->insertMouvement($idCom, $idStock);
                            $modelMouvement->entreeMouvement();
                            $modelMouvement->entreeStock();

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