<?php

namespace controller;

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

    public function modificationFournisseur(){
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_fournisseur'],$_POST['nom'], $_POST['SIRET'],$_POST['email'], $_POST['telephone'],$_POST['adresse'], $_POST['cp'], $_POST['ville'],$_POST['categorie'])) {
            $fournisseur = $this->model('Fournisseur');

            $fournisseur->ValeursModificationFournisseur($_POST['id_fournisseur'],$_POST['nom'], $_POST['SIRET'],$_POST['email'], $_POST['telephone'],$_POST['adresse'], $_POST['cp'], $_POST['ville'],$_POST['categorie']);

            $fournisseur->modificationFournisseur();

            header("Location: ../Vue/AfficheFournisseur.php");

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

}