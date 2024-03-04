<?php
namespace model;
use PDO;
require_once '../Core/DataBase.php';

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
        parent::__construct();
        $this->pdo = $this->connect();


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
    public function rechercheCIP($CIP)
    {
        $this-> CIP = $CIP;
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

    public function panierMedicaments()
    {
        $sql = "SELECT DISTINCT CIP, nom, type, quantite_disponible, prix FROM medicaments WHERE CIP = :CIP";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':CIP', $this->CIP, PDO::PARAM_STR); // Liez le paramètre CIP correctement.
        $stmt->execute(); // Exécutez la requête préparée.
        $medicaments = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($medicaments)){
            return $medicaments;
        }
    }


}