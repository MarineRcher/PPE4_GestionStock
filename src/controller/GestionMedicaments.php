<?php
    include '../Core/controller.php';

    class GestionMedicaments extends \Controller{

        public function selectMedicament()
        {
           $modelMedicaments = $this->model('Medications');
           $dataMedicaments = $modelMedicaments->selectMedicaments();
               return $dataMedicaments;

        }

        public function rechercherMedicament(){
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['nom'])){
                $nom = $_POST['nom'];
                $modelMedicaments = $this->model('Medications');
                $modelMedicaments->rechercheNom($nom);
                $dataMedicaments = $modelMedicaments->rechercherMedicaments();

                return $dataMedicaments;
            }

        }
        public function panierMedicament() {
            $dataMedicaments = []; // Initialiser en dehors de la boucle
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['medicamentsSelectionne'])) {
                $CIPs = $_POST['medicamentsSelectionne'];
                foreach ($CIPs as $item) {
                    $modelMedicaments = $this->model('Medications');
                    $modelMedicaments->rechercheCIP($item);
                    $medicamentInfo = $modelMedicaments->panierMedicaments();
                    if (!empty($medicamentInfo)) { // Vérifier si les données ne sont pas vides
                        $dataMedicaments[] = $medicamentInfo; // Ajouter au tableau
                    }
                }
                return $dataMedicaments;

            } else {
                echo "Sélectionnez des médicaments";
            }
        }

        public function commandeMedicament()
        {
            // Vérification de la soumission du formulaire
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['CIP'], $_POST['nom'], $_POST['type'], $_POST['quantite_disponible']) && $_POST['prix'] !== "") {


                    $CIP = $_POST['CIP'];
                    $nom = $_POST['nom'];
                    $type = $_POST['type'];
                    $quantite_disponible = $_POST['quantite_disponible'];
                   $prix = $_POST['prix'];

                    $modelMedicaments = $this->model('Medications');
                    $modelMedicaments->Medicament($CIP, $nom, $type, $quantite_disponible,$prix);
                     $modelMedicaments->commande();
                        header("Location: ../Vue/MedicationStock.php");


            } else {
                $message="Merci de remplir les champs vides";

            }
            return $message;
        }



    }
?>