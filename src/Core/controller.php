<?php
class Controller {
    // Charger le modèle
    public function model(string $model) {
        $modelClass = 'model\\' . $model; // Add the namespace to the class name
        require_once '../model/' . $model . '.php';
        return new $modelClass(); // Instantiate the class with the namespace
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