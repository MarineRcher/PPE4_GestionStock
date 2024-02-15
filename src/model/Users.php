<?php

namespace model;
require '../Core/DataBase.php';

class Users extends \Database
{

    public $name;
    public $lastName;
    public $email;

    public $role;

    public function __construct()
    {

    }

    public function verify_user($email)
    {

        global $pdo;
        $sql = "SELECT id_utilisateur, email, mot_de_passe FROM utilisateurs WHERE email = :email";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($user)) {
                return $user;
            }
        else {


        }

    }

}