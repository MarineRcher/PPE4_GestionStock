<?php


namespace model;

use PDO;
require_once '../Core/DataBase.php';
class Mouvements extends \Database
{
 protected $pdo;

 public $idCommande;

 public $idStock;



    public function __construct ()
    {
        parent::__construct();
        $this->pdo = $this->connect();

    }

    public function insertMouvement($idCommande, $idStock)
    {
        $this->idCommande=$idCommande;
        $this->idStock=$idStock;
    }

    public function mouvementSortie(){

        $sql = "insert into gsb.mouvements (id_stock, type_mouvement, id_commande) values (:id_stock, 'sortie', :id_commande)";
        $stmt = $this->pdo->prepare($sql);

        if ($stmt->execute([
            ':id_commande' =>$this->idCommande,
            ':id_stock' => $this->idStock,

        ])) {
            $message = 'mouvement ajoute.';
        } else {
            $message = 'Erreur lors du mvt';
        }
        return $message;
    }

    public function selectIdStock($idCommande){

        $sql = "select distinct S.id_stock from gsb.commandes as C join gsb.details_commande as D on D.id_commande = C.id_commande join gsb.stock as S on S.id_stock = D.id_stock  where C.id_commande=:id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([':id'=>$idCommande]);
        $commandes = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $commandes;
    }

    public function sortieStock(){
        $sql = "update gsb.stock set quantite_disponible= quantite_disponible - (select quantite from details_commande where id_commande=:idCommande) where id_stock=:id";
        $stmt = $this->pdo->prepare($sql);

        if ($stmt->execute([
            ':id_commande' =>$this->idCommande,
            ':id_stock' => $this->idStock,

        ])) {
            $message = 'stock modifie.';
        } else {
            $message = 'Erreur lors de la modification de stock';
        }
        return $message;

    }
}