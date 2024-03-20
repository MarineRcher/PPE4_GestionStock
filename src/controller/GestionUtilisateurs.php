<?php

namespace controller;

include_once '../Core/controller.php';
use src\Core\Controller;



class GestionUtilisateurs extends Controller
{
    public function selectUtilisateurs()
    {
        $modelUtiilisateurs = $this->model('Users');
        $utilisateurs = $modelUtiilisateurs->GestionUtilisateurs();
        return $utilisateurs;

    }

    public function utilisateursSelectionnes() {
        $utilisateursSelectionnes = []; // Initialiser en dehors de la boucle
        if($_SERVER["REQUEST_METHOD"] == "POST" ) {
            if (isset($_POST['utilisateurSelectionne'])) {
                $id = $_POST['utilisateurSelectionne'];
                foreach ($id as $item) {
                    $modelMedicaments = $this->model('Users');
                    $utilisateurs = $modelMedicaments->selectUtilisateurs($item);
                    if (!empty($utilisateurs)) { // Vérifier si les données ne sont pas vides
                        $utilisateursSelectionnes[] = $utilisateurs; // Ajouter au tableau
                    }
                }
                if (empty($utilisateursSelectionnes)) {
                    header("Location: GestionUtilisateurs.php");
                } else {
                    return $utilisateursSelectionnes;
                }


            }
            if (empty($_POST['utilisateurSelectionne'])) {
                header("Location: GestionUtilisateurs.php");
            }
        }
    }

    public function changementRole()
    {

        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset( $_POST['id'], $_POST['role'], $_POST['tentative']) ) {
                $id =  $_POST['id'];
                $role = $_POST['role'];
                $tentatives = $_POST['tentative'];
                $modelCommande = $this->model('Users');

                $combinedArray = array_combine($id, $role);
                foreach ($combinedArray as $id_utilisateur => $role_utilisateur) {
                    $modelCommande->updateRole($role_utilisateur);
                    $errorDetail = $modelCommande->MiseAJoutRole($id_utilisateur, $tentatives);
                }
                header("Location: ../Vue/GestionUtilisateurs.php");
        } else {
            return "Merci de remplir les champs vides";

        }


    }
    public function changerMdp()
    {


        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'], $_POST['nom'], $_POST['passwordConfirm1'], $_POST['passwordConfirm2'])) {
            if ($_POST['passwordConfirm1'] == $_POST['passwordConfirm2']) {
                $nouveauMdp = password_hash($_POST['passwordConfirm1'], PASSWORD_DEFAULT);
                $email = $_POST['email'];
                $nom = $_POST['nom'];

                $modelCommande = $this->model('Users');

                $modelCommande->Mdp($email, $nouveauMdp, $nom);
               $modelCommande->MiseAJourMdp();
                header("Location: ../Vue/SignIn.php");
            } else {
                return "Merci de renseigner deux mêmes mots de passes";
            }
        } else {
            return "Merci de remplir les champs vides";

        }

    }
}