<?php
class Controller {
    // Charger le modèle
    public function model(string $model) {
        require_once '../model/' . $model . '.php';
        return new $model();
    }

    // Charger la vue
    public function view(string $view, $data = []) {
        $viewPath = '../Vue/' . $view . '.php';
        if(file_exists($viewPath)) {
            require_once $viewPath;
        } else {
            // Gérer l'erreur si la vue n'existe pas
            die("La page n'existe pas");
        }
    }
}
?>