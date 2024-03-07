<?php
namespace model;
use PDO;
require_once '../Core/DataBase.php';

class Medications extends \Database
{
    public $CIS;
    public $nom;
    public $type;

    public $quantite;

    protected $pdo;
    public function __construct ()
    {
        parent::__construct();
        $this->pdo = $this->connect();


    }

    public function Medicament($CIS, $nom, $type, $quantite, $prix)
    {
        $this-> CIS = $CIS;
        $this-> nom = $nom;
        $this-> type = $type;
        $this-> quantite = $quantite;

    }
    public function rechercheNom( $nom)
    {
        $this-> nom = $nom;
    }
    public function rechercheCIS($CIS)
    {
        $this-> CIS = $CIS;
    }

    public function selectMedicaments()
    {
        $sql= "select distinct nom, CIS, type, quantite_disponible from medicaments limit 200";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute();
        $medicaments = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($medicaments)){
            return $medicaments;
        }
    }

    public function rechercherMedicaments()
    {
        $sql= "select distinct nom, CIS, type, quantite_disponible from medicaments where CIS like :CIS ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute([':CIS' =>  $this->CIS . '%']);
        $medicaments = $stmt->fetchAll(PDO::FETCH_ASSOC);

       return $medicaments;
    }

    public function panierMedicaments()
    {
        $sql = "SELECT DISTINCT CIS, nom, type, quantite_disponible FROM medicaments WHERE CIS = :CIS";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':CIS', $this->CIS, PDO::PARAM_STR); // Liez le paramètre CIS correctement.
        $stmt->execute(); // Exécutez la requête préparée.
        $medicaments = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($medicaments)){
            return $medicaments;
        }
    }


}