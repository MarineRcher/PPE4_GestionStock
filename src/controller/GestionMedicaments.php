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


    }
?>