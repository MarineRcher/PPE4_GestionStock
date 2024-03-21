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

    public $prix;


    public function __construct ()
    {
        parent::__construct();
        $this->pdo = $this->connect();

    }
    public function ChangerStatutParId($idCommande, $statut)
    {
        $this->idCommande = $idCommande;
        $this->statut = $statut;
    }
    public function premiereCommande($dateLivraison, $id_fournisseur)
    {
        $this->dateLivraison = $dateLivraison;
        $this->id_fournisseur=$id_fournisseur;
    }

    public function detailCommande($quantite, $prix)
    {

        $this-> quantite = $quantite;
        $this->prix =$prix;
    }


    public function selectCommandesFournisseurs()
    {
        $sql="SELECT distinct C.id_commande,C.id_fournisseur,C.date_commande, C.statut,C.date_disponibilite,SUM(D.prixTotal) AS total_prix, S.categorie FROM gsb.commandes AS C JOIN gsb.details_commande AS D ON D.id_commande = C.id_commande JOIN gsb.stock AS S ON S.id_stock = D.id_stock WHERE C.id_fournisseur IS NOT NULL GROUP BY C.id_commande, S.id_stock";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        $commandes= $stmt->fetchAll(PDO::FETCH_ASSOC);
        if(!empty($commandes)){
            return $commandes;
        }

    }
    public function selectSubtancesActives()
    {
        $sql= "select CIS, S.nom, type, masse, S.quantite_disponible, S.prix from gsb.stock as S join gsb.subtance_active as A on A. id_stock = S.id_stock where categorie='Subtance Active' ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute();
        $subtanceActive = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($subtanceActive)){
            return $subtanceActive;
        }
    } public function selectMedicaments()
    {
        $sql= "select CIS, S.nom, type, S.quantite_disponible, S.prix from gsb.stock as S join gsb.medicaments as A on A. id_stock = S.id_stock where categorie='medicament' ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute();
        $medicament = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if (!empty($medicament)){
            return $medicament;
        }
    }
    public function selectMateriel()
    {
        $sql= "select id_stock, nom, quantite_disponible, prix from gsb.stock where categorie='Materiel' ";
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
        }
    }

    public function commande($id)
    {
        $_SESSION['IDCommande'] =[];
        $sql = "INSERT INTO commandes (id_utilisateur, date_disponibilite, id_fournisseur) VALUES (:id_utilisateur, :date_disponibilite, :id_fournisseur)";
        $stmt = $this->pdo->prepare($sql);

        if ($stmt->execute([
            ':id_utilisateur' => $id,
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
        $sql = "INSERT INTO details_commande (id_commande, id_stock, quantite, prixTotal) VALUES (:lastInsertId, :idStock, :quantite, :prix)";
        $stmt = $this->pdo->prepare($sql);

        if ($stmt->execute([
            ':lastInsertId' => $_SESSION['IDCommande'],
            ':idStock' => $idStock,
            ':quantite' => $this->quantite,
            ':prix' =>$this->prix,

        ])) {
            $message = 'Commande envoye.';
        } else {
            $message = 'Erreur lors de l\'envoie';
        }
        return $message;
    }

    public function ChangerStatut()
    {
        $sql = "update gsb.commandes set statut=:statut where id_commande=:id";
        var_dump($this->statut);
        $stmt = $this->pdo->prepare($sql);
        if ($stmt->execute([
            ':statut' => $this->statut,
            ':id' => $this->idCommande

        ])) {
            $message = 'statut modifie.';
        } else {
            $message = 'Erreur lors de la modification du statut';
        }
        return $message;
    }

    public function rechercherMateriel($nom)
    {
        $sql= "select id_stock, S.nom, S.quantite_disponible, S.prix from gsb.stock as S where nom like :nom and categorie='Materiel' ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute([':nom' =>  $nom . '%']);
        $materiel = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $materiel;
    }

    public function rechercherSubtanceActive($CIS)
    {
        $sql= "select CIS, S.nom, type, masse, S.quantite_disponible, S.prix from gsb.stock as S join gsb.subtance_active as A on A. id_stock = S.id_stock where CIS like :CIS and categorie='Subtance Active'";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute([':CIS' =>  $CIS . '%']);
        $subtanceActive = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $subtanceActive;
    }
    public function rechercherMedicaments($CIS)
    {
        $sql= "select CIS, S.nom, type, S.quantite_disponible, S.prix from gsb.stock as S join gsb.medicaments as M on M. id_stock = S.id_stock where CIS like :CIS and categorie='medicament' ";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute([':CIS' =>  $CIS . '%']);
        $medicaments = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $medicaments;
    }
}