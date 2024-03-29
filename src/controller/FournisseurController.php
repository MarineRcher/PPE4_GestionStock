<?php

namespace controller;
include_once __DIR__ . '/../Core/controller.php';
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


            header("Location: index.php?page=homepage");

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

           header("Location: index.php?page=homepage");

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
            header("Location: index.php?page=fournisseurs");

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
        ob_start();
        if($_SERVER["REQUEST_METHOD"] == "POST") {
            if (isset($_POST['fournisseurSelectionne'])) {
                $id = $_POST['fournisseurSelectionne'];
                foreach ($id as $item) {
                    $fournisseur = $this->model('Fournisseur');
                    $fournisseur->getIdFournisseur($item);
                    $fournisseurSelect = $fournisseur->AffichageFournisseurParId();
                    $fournisseurs[] = $fournisseurSelect;
                }
                if (empty($fournisseurs)) {
                    header("Location: index.php?page=fournisseurs");
                } else {
                    return $fournisseurs;
                }

            }
            if(empty($_POST['fournisseurSelectionne'])) {
            header("Location: index.php?page=fournisseurs");
        }
        }


    }

}