<?php
namespace model;
use PDO;
require '../Core/DataBase.php';

class Medications extends \Database
{
    public $CIP;
    public $nom;
    public $type;

    public $quantite;

    public $prix;

    protected $pdo;
    public function __construct ()
    {
        parent::__construct(); // Call the parent constructor
        $this->pdo = $this->connect(); // Assign the PDO instance to $this->pdo


    }

    public function Medicament($CIP, $nom, $type, $quantite, $prix)
    {
        $this-> CIP = $CIP;
        $this-> nom = $nom;
        $this-> type = $type;
        $this-> quantite = $quantite;
        $this-> prix = $prix;
    }
    public function rechercheNom( $nom)
    {
        $this-> nom = $nom;
    }

    public function selectMedicaments()
    {
        $sql= "select distinct nom, CIP, type, quantite_disponible, prix from medicaments ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute();
        $medicaments = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($medicaments)){
            return $medicaments;
        }
    }

    public function rechercherMedicaments()
    {
        $sql= "select distinct nom, CIP, type, quantite_disponible, prix from medicaments where nom like :nom ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute([':nom' =>  $this->nom . '%']);
        $medicaments = $stmt->fetchAll(PDO::FETCH_ASSOC);

       return $medicaments;
    }

}