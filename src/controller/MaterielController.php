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

    public function panierMateriel() {
        $dataSubtanceActive = []; // Initialiser en dehors de la boucle
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['materielSelectionne'])) {
            $stock = $_POST['materielSelectionne'];

            foreach ($stock as $item) {
                $modelMateriel = $this->model('Materiel');
                $modelMateriel->panier($item);
                $materielInfo = $modelMateriel->panierMateriel();
                if (!empty($materielInfo)) { // Vérifier si les données ne sont pas vides
                    $dataMateriel[] = $materielInfo; // Ajouter au tableau
                }
            }
            return $dataMateriel;

        } else {
            echo "Sélectionnez du matériel";
        }
    }
}