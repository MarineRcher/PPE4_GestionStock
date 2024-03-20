<?php

namespace model;
use PDO;
require_once '../Core/DataBase.php';

class Materiel extends \Database
{
    public $nom;
    public $idMateriel;

    public $quantite;

    public $pdo;

    public function __construct ()
    {
        parent::__construct();
        $this->pdo = $this->connect();
    }

    public function Materiel($nom, $idMateriel, $quantite)
    {
        $this-> nom = $nom;
        $this-> idMateriel = $idMateriel;
        $this-> quantite = $quantite;
    }
  public function panier($idMateriel)
    {
        $this-> idMateriel = $idMateriel;

    }

    public function selectMateriel()
    {
        $sql= "select id_stock, nom, quantite_disponible from gsb.stock where categorie='Materiel'";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute();
        $materiel = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($materiel)){
            return $materiel;
        }
    }

    public function panierMateriel()
    {
        $sql = "select id_stock, nom, quantite_disponible, prix from gsb.stock  WHERE id_stock = :id_stock and categorie='Materiel'";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':id_stock', $this->idMateriel, PDO::PARAM_STR);
        $stmt->execute(); // Exécutez la requête préparée.
        $materiel = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($materiel)){
            return $materiel;
        }
    }

}