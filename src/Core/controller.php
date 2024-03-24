<?php
namespace src\Core;
class Controller {

    public function model(string $model) {
        $modelClass = 'model\\' . $model; // Add the namespace to the class name
        require_once __DIR__ . '/../model/' . $model . '.php';
        return new $modelClass(); // Instantiate the class with the namespace
    }


}
?>