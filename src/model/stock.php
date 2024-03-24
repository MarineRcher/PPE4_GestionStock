<?php

namespace model;
use PDO;

require_once __DIR__ . '/../Core/DataBase.php';

class stock extends \Database
{
    public function __construct()
    {
        parent::__construct(); // Call the parent constructor
        $this->pdo = $this->connect(); // Assign the PDO instance to $this->pdo
    }

    public function selectStockInferieur5()
    {
        $sql = "select nom, quantite_disponible from gsb.stock where quantite_disponible < 5";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        $stock=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $stock;

    }



}