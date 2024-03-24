<?php

namespace model;
use PDO;

require '../Core/DataBase.php';

class Users extends \Database
{

    public $nom;
    public $prenom;
    public $email;

    public $motDePasse;

    public $role;

    protected $pdo;

    public function __construct()
    {

        parent::__construct(); // Call the parent constructor
       $this->pdo = $this->connect(); // Assign the PDO instance to $this->pdo
    }

    public function registreUtilisateur($nom,$prenom, $email, $motDePasse):void
    {
        $this-> nom = $nom;
        $this-> prenom = $prenom;
        $this-> email = $email;
        $this-> motDePasse = $motDePasse;
    }
    public function updateRole($role):void
    {
        $this-> role = $role;
    }
  public function Mdp($email,$motDePasse, $nom ):void
    {
        $this-> email = $email;
        $this->motDePasse=$motDePasse;
        $this->nom=$nom;
    }

    public function verify_user(string $email)
    {
        $sql = "SELECT id_utilisateur, email, mot_de_passe, role, tentative FROM utilisateurs WHERE email = :email";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute([':email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!empty($user)) {
                return $user;
            }


    }

    public function AddUser()
    {
        $sql = "INSERT INTO utilisateurs (nom, prenom, email, mot_de_passe, role) VALUES (:nom, :prenom, :email, :password, 'User')";
        $stmt = $this->pdo->prepare($sql);

        if ($stmt->execute([
            ':nom' => $this->nom,
            ':prenom' => $this->prenom,
            ':email' => $this->email,
            ':password' => $this->motDePasse
        ])) {
            $message = 'Compte créé avec succès.';
        } else {
            $message = 'Erreur lors de la création du compte.';
        }
        return $message;
    }

    public function GestionUtilisateurs()
    {
        $sql = "SELECT id_utilisateur, nom, prenom, email, role, tentative FROM utilisateurs";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute();
        $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $users;
    }

    public function selectUtilisateurs($id)
    {
        $sql = "SELECT id_utilisateur, nom, prenom, email, role, tentative FROM utilisateurs where id_utilisateur=:id";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute( [':id' => $id]);
        $users = $stmt->fetch(PDO::FETCH_ASSOC);

        return $users;
    }
    public function MiseAJoutRole($id_utilisateur, $tentative)
    {
        $sql = "update gsb.utilisateurs set role=:role,tentative=:tentative where id_utilisateur=:id";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        if($stmt->execute( [':id' => $id_utilisateur, ':role' => $this->role, ':tentative'=> $tentative])){
            return "Role modifie avec succes";
        }else {
            return 'Erreur lors de la modification de role';
        }

    }  public function miseAJourTentative($id)
    {
        $sql = "update gsb.utilisateurs set tentative=0 where id_utilisateur=:id";
        $stmt = $this->pdo->prepare($sql);
      $stmt->execute( [':id' => $id]);

    }public function ajoutTentative($id)
    {

        $sql = "update gsb.utilisateurs set tentative = tentative + 1 where id_utilisateur=:id";
        $stmt = $this->pdo->prepare($sql);
      $stmt->execute( [':id' => $id]);

    }
    public function MiseAJourMdp()
    {
        $sql = "update gsb.utilisateurs set mot_de_passe=:mot_de_passe where email=:email and nom=:nom";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo

        if($stmt->execute( [':mot_de_passe' => $this->motDePasse,
            ':email' => $this->email,
            ':nom' => $this->nom
        ])){
            return "Mot de passe modifie avec succes";
        }else {
            return 'Erreur lors de la modification de mot de passe';
        }

    }



}