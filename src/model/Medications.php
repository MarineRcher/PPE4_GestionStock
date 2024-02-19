<?php
namespace model;
use PDO;
require '../Core/DataBase.php';

class Medications extends \Database
{
    public $name;
    public $description;

    public $quantity;

    public $price;

    protected $pdo;
    public function __construct ()
    {
        parent::__construct(); // Call the parent constructor
        $this->pdo = $this->connect(); // Assign the PDO instance to $this->pdo


    }

    public function Medicament($name, $description, $quantity, $price)
    {
        $this-> name = $name;
        $this-> description = $description;
        $this-> quantity = $quantity;
        $this-> price = $price;
    }

    public function selectMedicaments()
    {
        $sql= "select * from stocks where type = :type";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute(['type' => 'medicament']);
        $medicaments = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!empty($medicaments)){
            return $medicaments;
        }
    }

}