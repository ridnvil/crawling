<?php

class Database {
	// public $host = '192.168.1.249';
	// public $username = "admin";
	// public $password = "a1b2c3d4";
	// public $database = 'ridwan';
	
	private $host = "localhost";
	private $username = "root";
	private $password = "";
	private $database = "coba";

	public $connection;

	public function getConnections(){
		$this->connection = null;

		try {
			$this->connection = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->database, $this->username, $this->password);
			$this->connection->exec("set names utf8");
		} catch (PDOException $exception) {
			echo "Connection error: ". $exception->getMessage();
		}

		return $this->connection;
	}
}