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
    public function verify_user(string $email)
    {
        $sql = "SELECT id_utilisateur, email, mot_de_passe FROM utilisateurs WHERE email = :email";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute(['email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!empty($user)) {
                return $user;
            }
        else {


        }

    }

    public function AddUser()
    {
        $sql = "INSERT INTO utilisateurs (nom, prenom, email, mot_de_passe) VALUES (:nom, :prenom, :email, :password)";
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

    public function VerifyEmail($email)
    {
        $sql = "SELECT id_utilisateur, email FROM utilisateurs WHERE email = :email";
        $stmt = $this->pdo->prepare($sql); // Utilise la propriété $pdo
        $stmt->execute(['email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!empty($user)) {
            return $user;

        }
        else {


        }
    }

}