<?php

class Database {

    private string $host = 'db';
    private string $dbname = 'gsb';
    private string $username = 'GSBuser';
    private string $password = '4mC+9u}7!Q9asJ';

    private $dbHandler; // destine a contenir la connexion a la base de donnees (une instance de pdo)
    private $statement;
    private $error;
    protected $pdo;




    public function connect()
    {
        try
        {
            $pdo = new PDO('mysql:host=db;dbname=gsb;charset=utf8mb4', 'GSBuser', '4mC+9u}7!Q9asJ',array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8") );
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            return $pdo;
        } catch(PDOException $e) {
            error_log("Connection failed: " . $e->getMessage());
            die("Connection failed: " . $e->getMessage());
}
    }

    public function __construct()
    {

        $dsn = 'mysql:host=' . $this->host . ';dbname=' . $this->dbname . ';charset=utf8mb4';

        $options = array(
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"
        );

        // Create a new PDO instance
        try {
            $this->dbHandler = new PDO($dsn, $this->username, $this->password, $options);
        } catch (PDOException $e) {
            $this->error = $e->getMessage();
            return $this->error;
        }
    }








    }

    ?>