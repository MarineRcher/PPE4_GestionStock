<?php

namespace controller;
include_once '../Core/controller.php';
use src\Core\Controller;

class FournisseurController extends Controller
{
    public function ajoutFournisseur()
    {
        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['nom'], $_POST['SIRET'],$_POST['email'], $_POST['telephone'],$_POST['adresse'], $_POST['cp'], $_POST['ville'],$_POST['categorie'])) {
             $fournisseur = $this->model('Fournisseur');

            $fournisseur->ValeursAjoutFournisseur($_POST['nom'], $_POST['SIRET'],$_POST['email'], $_POST['telephone'],$_POST['adresse'], $_POST['cp'], $_POST['ville'],$_POST['categorie']);

            $fournisseur->AjoutFournisseur();


            header("Location: ../Vue/HomePage.php");

        } else {
            $message="Merci de remplir les coordonnées du fournisseur";

        }
        return $message;
    }
    public function supprimerFournisseur()
    {
        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['fournisseurSelectionne'])) {
            $id=$_POST['fournisseurSelectionne'];
             $fournisseur = $this->model('Fournisseur');

             foreach ($id as $item) {
                 $fournisseur->getIdFournisseur($item);

                 $fournisseur->suprressionFournisseur();
             }

           header("Location: ../Vue/HomePage.php");

        } else {
            $message="Erreu lors de la suppression";

        }
        return $message;
    }

    public function modificationFournisseur(){
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id'],$_POST['nom'], $_POST['SIRET'],$_POST['email'], $_POST['telephone'],$_POST['adresse'], $_POST['cp'], $_POST['ville'],$_POST['categorie'])) {

            $id_fournisseur=$_POST['id'];
            $email=$_POST['email'];
            $fournisseur = $this->model('Fournisseur');


                $fournisseur->ValeursModificationFournisseur($id_fournisseur, $_POST['nom'], $_POST['SIRET'], $email, $_POST['telephone'], $_POST['adresse'], $_POST['ville'], $_POST['cp'], $_POST['categorie']);

                $fournisseur->modificationFournisseur();
            header("Location: ../Vue/AfficheFournisseurs.php");

        } else {
            $message="Merci de remplir les coordonnées du fournisseur";
        }
        return $message;
    }
    public function selectFournisseurs()
    {
        $fournisseur = $this->model('Fournisseur');
        $fournisseurs = $fournisseur->AffichageFournisseurs();
        return $fournisseurs;
    }
    public function selectFournisseurParId()
    {
        if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['fournisseurSelectionne'])) {
            $id=$_POST['fournisseurSelectionne'];
            foreach ($id as $item) {
                $fournisseur = $this->model('Fournisseur');
                $fournisseur->getIdFournisseur($item);
                $fournisseurSelect = $fournisseur->AffichageFournisseurParId();
                $fournisseurs[] = $fournisseurSelect;
            }
            return $fournisseurs;
        }
    }

}