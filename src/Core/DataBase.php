<?php

class Database {

    private string $host = 'db';
    private string $dbname = 'gsb';
    private string $username = 'root';
    private string $password = 'root';

    private $dbHandler; // destine a contenir la connexion a la base de donnees (une instance de pdo)
    private $statement;
    private $error;
    protected $pdo;




    public function connect()
    {
        try
        {
            $pdo = new PDO('mysql:host=db;dbname=gsb;charset=utf8', 'root', 'root');
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            return $pdo;
        } catch(PDOException $e) {
            error_log("Connection failed: " . $e->getMessage());
            die("Connection failed: " . $e->getMessage());
}
    }

    public function __construct()
    {

        $dsn = 'mysql:host=db;dbname=gsb';
        $options = array(
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        );

        // Create a new PDO instance
        try {
            $this->dbHandler = new PDO($dsn, $this->username, $this->password, $options);
        } catch (PDOException $e) {
            $this->error = $e->getMessage();
            return $this->error;
        }
    }

        public function  query($sql){
            $this->statement = $this->dbHandler->prepare($sql);
        }

        public function bind($parameter, $value, $type = null){
            switch (is_null($type)){
                case is_int($value):
                    $type = PDO::PARAM_INT;
                    break;
                case is_bool($value):
                    $type = PDO::PARAM_BOOL;
                    break;
                case is_null($value):
                    $type = PDO::PARAM_NULL;
                    break;
                default:
                    $type = PDO::PARAM_STR;
            }
            $this->statement->bindValue($parameter, $value, $type);
        }

        public function execute(){
            return $this->statement->execute();
        }

        public function resultSet(){
            $this->execute();
            return $this->statement->fetchAll(PDO::FETCH_OBJ);
        }

        public function single(){
            $this->execute();
            return $this->statement->fetch(PDO::FETCH_OBJ);
        }

        public function rowCount(){
            return $this->statement->rowCount();
        }
    }

    ?>