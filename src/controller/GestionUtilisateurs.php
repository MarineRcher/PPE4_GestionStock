<?php

namespace controller;

include_once __DIR__ . '/../Core/controller.php';
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
                    header("Location: index.php?page=Utilisateur");
                } else {
                    return $utilisateursSelectionnes;
                }


            }
            if (empty($_POST['utilisateurSelectionne'])) {
                header("Location: index.php?page=Utilisateur");
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

            $combinedArray = [];
            foreach ($id as $key => $value) {
                $combinedArray[] = [
                    'id' => $id[$key],
                    'role' => $role[$key],
                    'tentative' => $tentatives[$key]
                ];
            }

            foreach ($combinedArray as $userData) {
                $id_utilisateur = $userData['id'];
                $role_utilisateur = $userData['role'];
                $tentative_utilisateur = $userData['tentative'];

                $modelCommande->updateRole($role_utilisateur);
                $errorDetail = $modelCommande->MiseAJoutRole($id_utilisateur, $tentative_utilisateur);
            }

            header("Location: index.php?page=Utilisateur");
        } else {
            return "Merci de remplir les champs vides";

        }


    }
    public function changerMdp()
    {


        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'], $_POST['nom'], $_POST['passwordConfirm1'], $_POST['passwordConfirm2'])) {
            if ($_POST['passwordConfirm1'] == $_POST['passwordConfirm2']) {
                if (preg_match("/^(?=.*[A-Z])(?=.*\d)(?=.*\W).{12,}$/", $_POST['password'])) {
                    $nouveauMdp = password_hash($_POST['passwordConfirm1'], PASSWORD_DEFAULT);
                    $email = $_POST['email'];
                    $nom = $_POST['nom'];

                    $modelCommande = $this->model('Users');

                    $modelCommande->Mdp($email, $nouveauMdp, $nom);
                    $modelCommande->MiseAJourMdp();
                    header("Location: index.php?page=login");
                }else{
                    return 'Le mot de passe doit contenir au moins 12 caractères, 1 majuscule, 1 chiffre et 1 caractère spécial.';

                }
            } else {
                return "Merci de renseigner deux mêmes mots de passes";
            }
        } else {
            return "Merci de remplir les champs vides";

        }

    }
}