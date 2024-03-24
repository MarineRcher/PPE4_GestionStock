<?php

namespace controller;
include_once __DIR__ . '/../Core/controller.php';

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
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['nom'])){

            $modelMateriel = $this->model('Materiel');
            $modelMateriel->nom($_POST['nom']);
            $dataMateriel = $modelMateriel->rechercherMateriel();

            return $dataMateriel;
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
            if(empty($dataMateriel)){
                \header("Location: index.php?page=materiel");
            }else{
            return $dataMateriel;}

        } else {
            echo "Sélectionnez du matériel";
        }
    }
}