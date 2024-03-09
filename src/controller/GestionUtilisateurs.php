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
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['utilisateurSelectionne'])) {
            $id = $_POST['utilisateurSelectionne'];
            foreach ($id as $item) {
                $modelMedicaments = $this->model('Users');
                $utilisateurs = $modelMedicaments->selectUtilisateurs($item);
                if (!empty($utilisateurs)) { // Vérifier si les données ne sont pas vides
                    $utilisateursSelectionnes[] = $utilisateurs; // Ajouter au tableau
                }
            }
            return $utilisateursSelectionnes;


        } else {
            echo "Sélectionnez des utilisateurs";
        }
    }

    public function changementRole()
    {

        // Vérification de la soumission du formulaire
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset( $_POST['id'], $_POST['role']) ) {
                $id =  $_POST['id'];
                $role = $_POST['role'];

                $modelCommande = $this->model('Users');

                $combinedArray = array_combine($id, $role);
                foreach ($combinedArray as $id_utilisateur => $role_utilisateur) {
                    $modelCommande->updateRole($role_utilisateur);
                    $errorDetail = $modelCommande->MiseAJoutRole($id_utilisateur);
                }
                header("Location: ../Vue/GestionUtilisateurs.php");
        } else {
            return "Merci de remplir les champs vides";

        }


    }
}