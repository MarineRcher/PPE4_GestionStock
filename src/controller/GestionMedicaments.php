<?php
include_once '../Core/controller.php';
use src\Core\Controller;

$controller = new Controller();
    class GestionMedicaments extends Controller{


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





    }
?>