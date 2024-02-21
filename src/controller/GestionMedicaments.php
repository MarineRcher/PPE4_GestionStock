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

        }


    }
?>