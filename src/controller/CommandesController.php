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
    public function selectCommandeStatut()
    {
        if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['commandeSelectionne'])) {
            foreach ($_POST['commandeSelectionne'] as $id) {
                $modelCommande = $this->model('Commandes');
                $commandesParUtilisateur = $modelCommande->selectCommandeStatut($id);

                if (!empty($commandesParUtilisateur)) {
                    $commandes[] = $commandesParUtilisateur;
                }
            }
            return $commandes;
        }
    }

    public function ChangerStatut()
    {
        if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['statut'], $_POST['id']))
            $idCommande=$_POST['id'];
            $statut = $_POST['statut'];

        $combinedArray = array_combine($idCommande, $statut);
        foreach ($combinedArray as $idCom => $state) {
            $modelCommande = $this->model('Commandes');
            $modelCommande->ChangerStatutParId($idCom, $state);
            $modelCommande->ChangerStatut();
        }
        $modelMouvement=$this->model('Mouvements');

        foreach ($idCommande as $item) {
            $stock = $modelMouvement->selectIdStock($item);
            $id_stock = $stock;
        }

        var_dump($id_stock);
        var_dump($idCommande);
        $combinedArray = array_combine($idCommande, $id_stock);

        foreach ($statut as $item){
            if($item == 'Valide'){
                foreach ($combinedArray as $idCom => $idStock){

                    $modelMouvement->insertMouvement($idCom, $idStock);
                    $modelMouvement->mouvementSortie();
                    $modelMouvement->sortieStock();

        }}}


        header("Location: ../Vue/HomePage.php");


    }


}