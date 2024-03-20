<?php

namespace model;
use PDO;
require_once '../Core/DataBase.php';

class SubtanceActive extends \Database
{
    public $CIS;
    public $nom;
    public $type;
    public $masse;
    public $quantite;

    protected $pdo;
    public function __construct ()
    {
        parent::__construct();
        $this->pdo = $this->connect();


    }

    public function SubtanceActive($CIS, $nom, $type, $quantite, $masse)
    {
        $this-> CIS = $CIS;
        $this-> nom = $nom;
        $this-> type = $type;
        $this-> quantite = $quantite;
        $this-> masse = $masse;
    }

    public function rechercheCIS($CIS)
    {
        $this-> CIS = $CIS;
    }

    public function selectSubtanceActive()
    {
        $sql= "select CIS, S.nom, type, masse, S.quantite_disponible from gsb.stock as S join gsb.subtance_active as A on A. id_stock = S.id_stock where categorie='Subtance Active' ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute();
        $subtanceActive = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($subtanceActive)){
            return $subtanceActive;
        }
    }

    public function rechercherSubtanceActive()
    {
        $sql= "select CIS, S.nom, type, masse, S.quantite_disponible from gsb.stock as S join gsb.subtance_active as A on A. id_stock = S.id_stock where CIS like :CIS and categorie='Subtance Active'";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute([':CIS' =>  $this->CIS . '%']);
        $subtanceActive = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $subtanceActive;
    }
    public function panierSubtanceActive()
    {
        $sql = "select S.id_stock, CIS, S.nom, type, masse, S.quantite_disponible, S.prix from gsb.stock as S join gsb.subtance_active as M on M. id_stock = S.id_stock WHERE CIS = :CIS and categorie='Subtance Active'";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':CIS', $this->CIS, PDO::PARAM_STR); // Liez le paramètre CIS correctement.
        $stmt->execute(); // Exécutez la requête préparée.
        $subtanceActive = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($subtanceActive)){
            return $subtanceActive;
        }
    }
}