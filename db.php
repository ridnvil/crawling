<?php

// require_once 'data.php';
// require_once 'compare.php';

class Database
{
	private $host = 'localhost'	;
	private $username = "root";
	private $password = "";
	private $database = '';

	public function createDB($db){

		$conn = new mysqli($this->host,$this->username,$this->password);

		if (!$conn) {
			die('Connection Filed..'.$conn->connect_error);
		}

		echo 'Connection Successfully';

		$sql = 'CREATE DATABASE IF NOT EXISTS '.$db;
		$query = $conn->query($sql);

		if (!$query) {
			die('Create Database ERROR : '.$conn->connect_error);
		}

		echo "Database ".$db." created Successfully";
		$conn->close();
	}

	public function createTable($url){
		$log = new CompareData();
		$this->database = 'coba';
		$urls = str_replace("-","_",$url);

		try{
			$conn = new mysqli($this->host,$this->username,$this->password,$this->database);

			if (!$conn) {
				$log->log('Connection Filed..'.$conn->connect_error);
			}
		}catch(Exception $e){
			echo "Error Code Connect Database : ".$e->getMessage();
			var_dump($e);
		}

		$dom=new DOMDocument;
		@$dom->loadHTMLFile("webpage/".$urls.".html");					
		$data = array();
		$rowtable = 0;
		foreach($dom->getElementsByTagName('tbody') as $table) {					
			$rowtable2 = 0;	
			foreach ($table->getElementsByTagName('tr') as $tr) {
				if (strlen($tr->nodeValue) > 1){
					$data[$rowtable2]=array();				
					$rowtable3= 0;
					foreach ($tr->getElementsByTagName('td') as $td) {														
						$data[$rowtable2]['data_'.$rowtable3] = preg_replace('/[^A-Za-z0-9\  ]/', '',$td->textContent);
					$rowtable3++;
					}	
				}			 
			$rowtable2++;
			}
		}

	    if ($data != null) {

	    	$tempTB = 0;
	    	
		    for ($i=0; $i < count($data); $i++) {
		    	if (count($data[$i]) > $tempTB) {
		    		$tempTB = count($data[$i]);
		    	}
		    }

		    foreach ($data as $key => $val) {

				if (count($data[$key]) != $tempTB) {
					$data[$key]=array_pad($val, $tempTB, null);
				}
			}

		    $createTB = "CREATE TABLE IF NOT EXISTS $urls (id INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY)";
		    $cek = $conn->query($createTB);
		    $log->log("Table Created");
	    	if ($cek === true) {

	    		$count = 0;
	    		$updateTB = "ALTER TABLE $urls ADD data_0 VARCHAR(200) NOT NULL AFTER id";
	    		while ($count < $tempTB) {
		    		$exec = $conn->query($updateTB);
		    		$updateTB = "ALTER TABLE $urls ADD data_".($count+1)." VARCHAR(250) NOT NULL AFTER data_".($count)."";
		    		$count++;
		    		// print_r($tempTB);
		    		$log->log($exec);
		    	}

		    	if ($exec) {
		    		try{
			    		for ($i=0; $i < $tempTB; $i++) { 
							$putfild = array_keys($data[$i]);
						}

						$fild = implode(',', $putfild);
						$value = array();

						foreach ($data as $rowvalue) {
							foreach ($rowvalue as $key => $row) {
								$rowvalue[$key] = $rowvalue[$key];

							}
							$value[] = "('" . implode("','", $rowvalue) . "')";

						}
						$query = "INSERT INTO $urls ($fild) VALUES " . implode(',', $value);
						$querys = $conn->query($query);
						$log->log("Data Record count ".count($data));
						// var_dump($querys);

						if ($querys) {
							$log->log("Inserted to Table ".$url);
						}else{
							$log->log("Filed Insert to Table ".$url);
						}

			    	}catch(Exception $e){
			    		echo "Error Code Insert To Table : ".$e->getMessage();
			    	}
		    	}else{
		    		$log->log("Continue to Compare Data..");
		    		$compareData = new CompareData();
					$compareData->compare($urls);
				}
	    	}else{
	    		$result = print_r("Query Error!!");
	    		$log->log("DB Class ".$result);
	    	}
	  	
	    }else{
	    	$result = print_r("Data Crawl Not Found.!!");
	    	$log->log("Data Crawl Not Found.!!");
	    }

	}
}

?>