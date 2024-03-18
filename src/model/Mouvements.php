<?php


namespace model;

use PDO;
require_once '../Core/DataBase.php';
class Mouvements extends \Database
{
 protected $pdo;

 public $idCommande;

 public $idStock;

 public int $quantite;



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
        //$id_stock = $this->idStock['id_stock'];


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

    public function sortieStock()
    {
        $sqlQuantite = 'SELECT quantite FROM details_commande WHERE id_commande = :id_commande AND id_stock = :id_stock';
        $stmtQuantite = $this->pdo->prepare($sqlQuantite);
        if ($stmtQuantite->execute([':id_commande' => $this->idCommande, ':id_stock' => $this->idStock])) {
            $details = $stmtQuantite->fetchAll(PDO::FETCH_ASSOC);
            $detail['quantite']=[];
            foreach ($details as $detail) {
                $quantite = $detail['quantite'];

                $sqlUpdate = 'UPDATE gsb.stock SET quantite_disponible = quantite_disponible  - :quantite WHERE id_stock = :id_stock';
                $stmtUpdate = $this->pdo->prepare($sqlUpdate);

                if ($stmtUpdate->execute([
                    ':quantite' => $quantite,
                    ':id_stock' => $this->idStock,
                ])) {

                    $message = 'Stock modifié.';
                } else {
                    $message = 'Erreur lors de la modification du stock.';
                }
            }

            return $message ?? 'Aucun détail de commande trouvé.';
        } else {
            return 'Erreur lors de la récupération des détails de commande.';
        }
    }


}