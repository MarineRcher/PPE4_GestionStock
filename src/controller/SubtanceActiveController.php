<?php

namespace controller;
include_once '../Core/controller.php';
use src\Core\Controller;

$controller = new Controller();

class SubtanceActiveController extends Controller
{
    public function selectSubtanceActive()
    {
        $modelSubtanceActive = $this->model('SubtanceActive');
        $dataSubtanceActive = $modelSubtanceActive->selectSubtanceActive();
        return $dataSubtanceActive;

    }

    public function rechercherSubtanceActive(){
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['CIS'])){
            $CIS = $_POST['CIS'];
            $modelSubtanceActive = $this->model('SubtanceActive');
            $modelSubtanceActive->rechercheCIS($CIS);
            $dataSubtanceActive = $modelSubtanceActive->rechercherSubtanceActive();

            return $dataSubtanceActive;
        }

    }
}