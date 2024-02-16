<?php

namespace model;
use PDO;

require '../Core/DataBase.php';

class Users extends \Database
{

    public $name;
    public $lastName;
    public $email;

    public $role;

    public function __construct()
    {
        parent::__construct(); // Call the parent constructor
        $this->pdo = $this->connect(); // Assign the PDO instance to $this->pdo
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
        // Insertion du nouvel utilisateur
        $sql = "INSERT INTO utilisateurs (nom, prenom, email, mot_de_passe) VALUES (:nom, :prenom, :email, :password)";
        $stmt = $pdo->prepare($sql);

        if ($stmt->execute(['nom' => $nom, 'prenom' => $prenom, 'email' => $email, 'password' => $password])) {
            $message = 'Compte créé avec succès.';
        } else {
            $message = 'Erreur lors de la création du compte.';
        }

    }

}