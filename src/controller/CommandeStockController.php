<?php

namespace controller;
include_once '../Core/controller.php';
use src\Core\Controller;

class CommandeStockController extends Controller
{

    public function selectSubtancesActives(){
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['categorie'], $_POST['id_subtance_active'])){

            $modelSubtancesActives = $this->model('Medications');
            $modelSubtancesActives->rechercheSubtancesActives( $_POST['id_subtance_active'], $_POST['categorie']);
            $dataSubtancesActives = $modelSubtancesActives->selectSubtanceActive();

            return $dataSubtancesActives;
        }

    }
}