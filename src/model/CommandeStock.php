<?php

namespace model;

use PDO;
require_once '../Core/DataBase.php';
class CommandeStock extends \Database
{
    protected $pdo;

    public $idCommande;

    public $dateCommande;

    public $dateLivraison;

    public $statut;

    public $quantite;

    public $categorie;

    public $CIS;

    public $id_fournisseur;


    public function __construct ()
    {
        parent::__construct();
        $this->pdo = $this->connect();

    }

    public function premiereCommande($dateLivraison, $id_fournisseur)
    {
        $this->dateLivraison = $dateLivraison;
        $this->id_fournisseur=$id_fournisseur;
    }

    public function detailCommande($quantite)
    {

        $this-> quantite = $quantite;
    }

    public function selectSubtancesActives()
    {
        $sql= "select CIS, S.nom, type, masse, S.quantite_disponible from gsb.stock as S join gsb.subtance_active as A on A. id_stock = S.id_stock where categorie='Subtance Active' ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute();
        $subtanceActive = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($subtanceActive)){
            return $subtanceActive;
        }
    }
    public function selectMateriel()
    {
        $sql= "select id_stock, nom, quantite_disponible from gsb.stock where categorie='Materiel' ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute();
        $materiel = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($materiel)){
            return $materiel;
        }else{return 'ko';}
    }
    public function selectCategorie($id)
    {

        $sql= "select Categorie from gsb.fournisseurs where id_fournisseur=:id ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute([':id' => $id]);
        $categorie = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($categorie)){
            return $categorie;
        }else{
            return 'erreur lors de la recuperation de la categorie';
        }
    }

    public function commande()
    {
        $_SESSION['IDCommande'] =[];
        $sql = "INSERT INTO commandes (id_utilisateur, date_disponibilite, id_fournisseur) VALUES (:id_utilisateur, :date_disponibilite, :id_fournisseur)";
        $stmt = $this->pdo->prepare($sql);

        if ($stmt->execute([
            ':id_utilisateur' => $_SESSION['id_utilisateur'],
            ':date_disponibilite' => $this->dateLivraison,
            ':id_fournisseur' => $this->id_fournisseur,

        ])) {
            $_SESSION['IDCommande'] = $this->pdo->lastInsertId();
            $message = 'Commande envoye.';

        } else {
            $message = 'Erreur lors de l\'envoie';
        }
        return $message;
    }

    public function detailCommandeRequete($idStock)
    {
        $sql = "INSERT INTO details_commande (id_commande, id_stock, quantite) VALUES (:lastInsertId, :idStock, :quantite)";
        $stmt = $this->pdo->prepare($sql);

        if ($stmt->execute([
            ':lastInsertId' => $_SESSION['IDCommande'],
            ':idStock' => $idStock,
            ':quantite' => $this->quantite,

        ])) {
            $message = 'Commande envoye.';
        } else {
            $message = 'Erreur lors de l\'envoie';
        }
        return $message;
    }
}