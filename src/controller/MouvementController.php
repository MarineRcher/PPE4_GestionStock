<?php

namespace controller;
include_once __DIR__ . '/../Core/controller.php';

use src\Core\Controller;

$controller = new Controller();

class MouvementController extends Controller
{
    public function selectMouvements(){
        if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['categorie'])){
            $modelMouvement=$this->model('Mouvements');
            $mouvement=$modelMouvement->selectMouvementByCategorie($_POST['categorie']);
            return $mouvement;

        }
    }
}