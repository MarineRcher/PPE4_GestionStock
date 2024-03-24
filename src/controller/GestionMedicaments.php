<?php
include_once __DIR__ . '/../Core/controller.php';
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
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['CIS'])){
                $CIS = $_POST['CIS'];
                $modelMedicaments = $this->model('Medications');
                $modelMedicaments->rechercheCIS($CIS);
                $dataMedicaments = $modelMedicaments->rechercherMedicaments();

                return $dataMedicaments;
            }

        }
        public function panierMedicament() {
            $dataMedicaments = []; // Initialiser en dehors de la boucle
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['medicamentsSelectionne'])) {
                $CIS = $_POST['medicamentsSelectionne'];
                foreach ($CIS as $item) {
                    $modelMedicaments = $this->model('Medications');
                    $modelMedicaments->rechercheCIS($item);
                    $medicamentInfo = $modelMedicaments->panierMedicaments();
                    if (!empty($medicamentInfo)) { // Vérifier si les données ne sont pas vides
                        $dataMedicaments[] = $medicamentInfo; // Ajouter au tableau
                    }
                }
                if(empty($dataMedicaments)){
                    header("Location: index.php?page=medicament");
                }else {
                    return $dataMedicaments;
                }

            } else {
                echo "Sélectionnez des médicaments";
            }
        }





    }
?>