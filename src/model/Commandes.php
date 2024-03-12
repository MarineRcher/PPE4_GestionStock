<?php

namespace model;

use PDO;
require_once '../Core/DataBase.php';

class Commandes extends \Database
{
    protected $pdo;

    public $idCommande;

    public $dateCommande;

    public $dateReservation;

    public $statut;

    public $quantite;

    public $CIS;



    public function __construct ()
    {
        parent::__construct();
        $this->pdo = $this->connect();

    }

    public function premiereCommande($dateReservation)
    {
        $this-> dateReservation = $dateReservation;
    }

    public function detailCommande($quantite)
    {

        $this-> quantite = $quantite;
    }
    public function commande()
    {
        $_SESSION['IDCommande'] =[];
        $sql = "INSERT INTO commandes (id_utilisateur, date_disponibilite) VALUES (:id_utilisateur, :date_disponibilite)";
        $stmt = $this->pdo->prepare($sql);

        if ($stmt->execute([
            ':id_utilisateur' => $_SESSION['id_utilisateur'],
            ':date_disponibilite' => $this->dateReservation,

        ])) {
            $_SESSION['IDCommande'] = $this->pdo->lastInsertId();
            $message = 'Commande envoye.';

        } else {
            $message = 'Erreur lors de l\'envoie';
        }
        return $message;
    }
    public function detailCommandeRequeteMedicament()
    {
        $sql = "INSERT INTO details_commande (id_commande, id_stock, quantite) VALUES (:lastInsertId, (select S.id_stock from gsb.stock as S join gsb.medicaments as M on M. id_stock = S.id_stock where CIS=:CIS limit 1), :quantite)";
        $stmt = $this->pdo->prepare($sql);

        if ($stmt->execute([
            ':lastInsertId' => $_SESSION['IDCommande'],
            ':CIS' => $this->CIS,
            ':quantite' => $this->quantite,

        ])) {
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
 public function selectCommandesParUtilisateur()
    {
        $sql = "select distinct C.id_commande, C.date_commande, C.statut, C.date_disponibilite, categorie from gsb.commandes as C join gsb.details_commande as D on D.id_commande = C.id_commande join gsb.stock as S on S.id_stock = D.id_stock where id_utilisateur = :id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([':id' => $_SESSION['id_utilisateur']]);
            $commandes = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $commandes;
    }


}