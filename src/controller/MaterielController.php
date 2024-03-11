<?php

namespace controller;
include_once '../Core/controller.php';
use src\Core\Controller;

$controller = new Controller();
class MaterielController extends Controller
{
    public function selectMateriel()
    {
        $modelMateriel = $this->model('Materiel');
        $dataMateriel = $modelMateriel->selectMateriel();
        return $dataMateriel;

    }

    public function rechercherMateriel(){
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['CIS'])){
            $CIS = $_POST['CIS'];
            $modelMedicaments = $this->model('Medications');
            $modelMedicaments->rechercheCIS($CIS);
            $dataMedicaments = $modelMedicaments->rechercherMedicaments();

            return $dataMedicaments;
        }

    }
}