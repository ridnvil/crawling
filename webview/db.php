<?php

    class DB{
        private $host = "localhost";
        private $username = "root";
        private $password = "a2zsolusindo";
        private $database = "coba";

        public $connection;

        public function getConnection(){
            $this->connection = null;

            try {
                $this->connection = new PDO("mysql:host=".$this->host.";dbname:=".$thi->database, $this->username, $this->password);
                $this->connection->exec("set names utf8");
            } catch (PDOException $e) {
                echo "Error : " . $e->getMessage();
            }

            return $this->connection;
        }
    }