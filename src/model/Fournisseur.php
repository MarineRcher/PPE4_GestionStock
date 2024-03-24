<?php

namespace model;
use PDO;
require_once __DIR__ . '/../Core/DataBase.php';


class Fournisseur extends \Database
{

    protected $pdo;
    public $nom;
    public $siret;
    public $email;
    public $telephone;

    public $adresse;
    public $cp;


    public $ville;
    public $categorie;

    public $id_fournisseur;

    public function __construct ()
    {
        parent::__construct();
        $this->pdo = $this->connect();
    }

    public function getIdFournisseur($id_fournisseur)
    {
        $this->id_fournisseur=$id_fournisseur;
    }

    public function ValeursAjoutFournisseur($nom, $siret, $email, $telephone, $adresse, $cp, $ville, $categorie)
    {
        $this->nom= $nom;
        $this->siret=$siret;
        $this->email=$email;
        $this->telephone=$telephone;
        $this->adresse=$adresse;
        $this->cp=$cp;
        $this->ville=$ville;
        $this->categorie=$categorie;
    }
    public function ValeursModificationFournisseur($id_fournisseur, $nom, $siret, $email, $telephone, $adresse, $ville, $cp, $categorie)
    {
        $this->id_fournisseur=$id_fournisseur;
        $this->nom= $nom;
        $this->siret=$siret;
        $this->email=$email;
        $this->telephone=$telephone;
        $this->adresse=$adresse;
        $this->ville=$ville;
        $this->cp=$cp;
        $this->categorie=$categorie;
    }

    public function AjoutFournisseur()
    {
        $sql = "INSERT INTO gsb.fournisseurs (nom, SIRET, email, telephone, adresse, CP, ville, categorie) VALUES (:nom, :SIRET, :email, :telephone, :adresse, :CP, :ville, :categorie)";
        $stmt = $this->pdo->prepare($sql);

        if ($stmt->execute([
            ':nom' => $this->nom,
            ':SIRET' => $this->siret,
            ':email' => $this->email,
            ':telephone' => $this->telephone,
            ':adresse' => $this->adresse,
            ':CP' => $this->cp,
            ':ville' => $this->ville,
            ':categorie' => $this->categorie
        ])) {
            $message = 'Fournisseur ajouté.';
        } else {
            $message = 'Erreur lors l\'ajout d\'un fournisseur.';
        }
        return $message;
    }

    public function AffichageFournisseurs()
    {
        $sql = "SELECT id_fournisseur, nom, SIRET, email, telephone, ville, categorie FROM gsb.fournisseurs";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute();
        $fournisseurs = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $fournisseurs;
    }
    public function AffichageFournisseurParId()
    {
        $sql = "SELECT id_fournisseur, nom, SIRET, email, telephone,adresse, cp,ville, categorie FROM gsb.fournisseurs where id_fournisseur=:id";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute([':id' => $this->id_fournisseur]);
        $fournisseurs = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $fournisseurs;
    }

    public function modificationFournisseur()
    {
        $sql = "UPDATE gsb.fournisseurs SET nom=:nom, SIRET=:SIRET, email=:email, telephone=:telephone, adresse=:adresse, CP=:CP, ville=:ville, Categorie=:categorie WHERE id_fournisseur=:id_fournisseur";
        $stmt = $this->pdo->prepare($sql);
        if ($stmt->execute([
            ':nom' => $this->nom,
            ':SIRET' => $this->siret,
            ':email' => $this->email,
            ':telephone' => $this->telephone,
            ':adresse' => $this->adresse,
            ':CP' => $this->cp,
            ':ville' => $this->ville,
            ':categorie' => $this->categorie,
            ':id_fournisseur' => $this->id_fournisseur
        ])) {
            $message = 'Fournisseur modifié.';
        } else {
            $message = 'Erreur lors la modification d\'un fournisseur.';
        }
        return $message;
    }

    public function suprressionFournisseur()
    {
        $sql = "delete FROM gsb.fournisseurs where id_fournisseur=:id";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
      if($stmt->execute([':id' => $this->id_fournisseur])){
          return "Fournisseur supprimé";
      }else {
          return "Erreur lors de la suppression du fournisseur";
      }



    }




}