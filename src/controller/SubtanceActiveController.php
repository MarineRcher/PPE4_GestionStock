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
    public function panierSubtanceActive() {
        $dataSubtanceActive = []; // Initialiser en dehors de la boucle
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['subtanceActiveSelectionne'])) {
            $CIS = $_POST['subtanceActiveSelectionne'];

            foreach ($CIS as $item) {
                $modelSubtanceActive = $this->model('SubtanceActive');
                $modelSubtanceActive->rechercheCIS($item);
                $subtanceActiveInfo = $modelSubtanceActive->panierSubtanceActive();
                if (!empty($subtanceActiveInfo)) { // Vérifier si les données ne sont pas vides
                    $dataSubtanceActive[] = $subtanceActiveInfo; // Ajouter au tableau
                }
            }
            if(empty($dataSubtanceActive)){
                header("Location: SubtanceActiveStock.php");
            }else {
                return $dataSubtanceActive;
            }

        } else {
            echo "Sélectionnez des subtances actives";
        }
    }
}