<?php

namespace model;

use PDO;
require_once '../Core/DataBase.php';
class CommandeStock extends \Database
{
    protected $pdo;

    public $idCommande;

    public $dateCommande;

    public $dateReservation;

    public $statut;

    public $quantite;

    public $CIS;
}