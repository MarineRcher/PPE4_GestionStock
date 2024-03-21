<?php

namespace controller;
include_once '../Core/controller.php';
use src\Core\Controller;

$controller = new Controller();

class stockOutController extends Controller
{

    public function finStock()
    {
        $modelStock = $this->model('stock');
        $stock = $modelStock->selectStockInferieur5();
        return $stock;

    }
}