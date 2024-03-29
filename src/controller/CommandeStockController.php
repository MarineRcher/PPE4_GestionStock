<?php

namespace controller;
include_once __DIR__ . '/../Core/controller.php';
use src\Core\Controller;
require_once __DIR__ . '/../controller/JWT.php';
use controller\JWT;
class CommandeStockController extends Controller
{

    public function rechercherMateriel(){
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['nom'])){

            $modelMateriel = $this->model('CommandeStock');
            $dataMateriel = $modelMateriel->rechercherMateriel($_POST['nom']);

            return $dataMateriel;
        }

    }
    public function rechercherMedicament(){
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['CIS'])){
            $modelMedicaments = $this->model('CommandeStock');
            $dataMedicaments = $modelMedicaments->rechercherMedicaments($_POST['CIS']);

            return $dataMedicaments;
        }

    }

    public function rechercherSubtanceActive(){
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['CIS'])){

            $modelSubtanceActive = $this->model('CommandeStock');
            $dataSubtanceActive = $modelSubtanceActive->rechercherSubtanceActive($_POST['CIS']);

            return $dataSubtanceActive;
        }

    }
    public function selectCommandesFournisseurs()
    {
        $modelCommandes = $this->model('CommandeStock');
        $commandes= $modelCommandes->selectCommandesFournisseurs();
        return $commandes;
    }
    public function selectCategorieFournisseur()
    {

        if($_SERVER["REQUEST_METHOD"] == "POST" ){
        if(isset($_POST['fournisseurSelectionne'])){
            if(is_array($_POST['fournisseurSelectionne'])){
            $modelCategorie = $this->model('CommandeStock');
           foreach ($_POST['fournisseurSelectionne'] as $id) {
                $categorie = $modelCategorie->selectCategorie($id);

           }}else{
                $modelCategorie = $this->model('CommandeStock');
                $categorie = $modelCategorie->selectCategorie($_POST['fournisseurSelectionne']);
            }
            if(empty($categorie)){
               header('Location: index.php?page=selectFournisseur');
            }else {
                return $categorie;

            }
        }
            header('Location: index.php?page=selectFournisseur');
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
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_stock'], $_POST['selectedDate'],$_POST['quantite_disponible'], $_POST['idFournisseur'], $_POST['prix']) ) {
            $jwt = new \controller\JWT();
            $payload = $jwt->get_payload($_COOKIE['JWT']);
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

                $error = $modelCommande->commande($payload['user_id']);

                $combinedArray = array_combine($idStock, $quantite_choisi);
                foreach ($combinedArray as $stock => $quantite) {
                    $modelCommande->detailCommande($quantite, $prixTotal);
                    $errorDetail = $modelCommande->detailCommandeRequete($stock);
                }
                header("Location: index.php?page=homepage");
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
            header("Location: index.php?page=homepage");
        }
    }

}