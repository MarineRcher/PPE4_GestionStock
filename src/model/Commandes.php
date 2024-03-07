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

    public function detailCommande($CIS, $quantite)
    {
        $this-> CIS = $CIS;
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
    public function detailCommandeRequete()
    {
        $sql = "INSERT INTO details_commande (id_commande, id_med, quantite) VALUES (:lastInsertId, (select id_med from medicaments where CIS=:CIS limit 1), :quantite)";
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


}