<?php
	session_start();
	require_once 'log.php';

	class Render extends Thread
	{
		private $host = '127.0.0.1';
		private $username = "root";
		private $password = "a2zsolusindo";
		private $database = 'coba';

		public $url;
		public $id;
		public $tempcheck = true;

		public function __construct($arrurl,$arrid)
		{
			$this->url = $arrurl;
			$this->id = $arrid;
		}

		public function run(){
			echo "Proses Render Data.."."\n";
			$this->Crawling($this->id);
			// $this->render();
			// echo $this->url;
			// echo $this->id;
		}

		public function render(){
			$log = new LogMessage();
			echo "\n";
			echo "Website : ".$this->url." ID : ".$this->id." "."\n";
			$log->log("Render Processing from ".$this->url." where id ".$this->id,$this->id);
			$result = exec('/var/www/html/bckend/phantomjs /var/www/html/bckend/render.js '.$this->url.' '.$this->id);
			$log->log("Render Done..",$this->id);
			
		}

		
		public function Crawling($url){
			$globaltemp = array();
			$arrayresult = array();
			$log = new LogMessage();

			$conn = new mysqli($this->host,$this->username,$this->password,$this->database);
			if (!$conn) {
				$log->log('Connection Filed..'.$e->getMessage(),$this->id);
			}else{

				while (true) {
					$countarr = 0;

					$this->render();
					$urls = str_replace("-", "_", $url);
					$dom=new DOMDocument();
					$log->log("Load data from directory webpage where File : ".$url.".html",$this->id);
					@$dom->loadHTMLFile("webpage/".$url.".html");					
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

					$log->log("Successfully Crawling data from ".$this->url,$this->id);
					$log->log("Record data is ".count($data),$this->id);

					if (strlen($data > 1)) {
					    $json = json_encode(print_r($data, true));
					    $file = fopen('data/'.$url.'.json', 'w');
				    	fwrite($file, print_r(json_decode($json), true));
				    	fclose($file);
				    	$log->log("Created Json File -> ".$url.".json",$this->id);
				    }


				    if ($data != null) {
				    	$tempcount = 0;
				    	$tempTB = 0;
				    	
					    for ($i=0; $i < count($data); $i++) {
					    	if (count(@$data[$i]) > $tempTB[$i]) {
					    		$tempTB = count($data[$i]);
					    	}
					    }

					    foreach ($data as $key => $val) {

							if (count($data[$key]) != $tempTB) {
								$data[$key]=array_pad($val, $tempTB, null);
							}
						}

					    $createTB = "CREATE TABLE IF NOT EXISTS $urls (id INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY)";
					    $cek = mysqli_query($conn,$createTB);
					    // $log->log("Table ".$urls." Successfully create in database ".$this->database);
				    	if ($cek === true) {

				    		$count = 0;
				    		$updateTB = "ALTER TABLE $urls ADD data_0 VARCHAR(500) AFTER id";
				    		while ($count < $tempTB) {
					    		$exec = mysqli_query($conn,$updateTB);

					    		$updateTB = "ALTER TABLE $urls ADD data_".($count+1)." VARCHAR(500) AFTER data_".($count)."";
					    		$count++;
					    	}

					    	if ($exec === true) {
								
								$fild = $this->array_keys($data);

								$value = array();

								foreach ($data as $rowvalue) {
									foreach ($rowvalue as $key => $row) {
										$rowvalue[$key] = $rowvalue[$key];

									}
									$value[] = "('" . implode("','", $rowvalue) . "')";

								}

								$query = "INSERT INTO $urls ($fild) VALUES " . implode(',', $value);
								$querys = mysqli_query($conn,$query);
								
								var_dump($query);
								if ($querys) {
									$log->log("Inserted to Table ".$url." where data ".count($data),$this->id);

								}else{
									$log->log("Filed Insert to Table ".$url." Error in query Insert",$this->id);
								}
					    	}else{
					    		
					    		$comparearray = array();
					    		$arrayload = array();

					    		$log->log("Compare Data",$this->id);

					    		if ($this->tempcheck) {
					    			$globaltemp = $data;
					    			// $log->log("Accommodate Data : ".$this->tempcheck,$this->id);
					    			// echo count($globaltemp);
					    			echo "Not Compare".PHP_EOL;
					    			
					    		}else{
					    			echo "Begin Compare".PHP_EOL;
					    			$comparearray = $data;
					    		}
					    		$this->tempcheck = false;

				    			$temparray = array();
				    			$arrayintersect = array();
				    			$arraydiff = array();
				    			if (count($comparearray) > 0) {
				    	
				    				for ($i=0; $i < count($comparearray); $i++) {
				    					try{
				    						$arrayintersect[] = array_intersect_assoc($globaltemp[$i], $comparearray[$i]);
				    						// print_r($arrayintersect);
				    					}catch(Exception $e){
				    						return $e;
				    					}

				    				}

				    				for ($i=0; $i < count($comparearray); $i++) { 
				    					try{
				    						$arraydiff[] = array_diff($globaltemp[$i], $comparearray[$i]);
				    						// print_r($arraydiff);
				    					}catch(Exception $e){
				    						return $e;
				    					}

				    				}

				    				if (count($arraydiff) > 0) {
			    						if ($arraydiff == 0) {

			    							$log->log("Not Data to Changed ",$this->id);

			    						}else{

			    							$this->update($arraydiff,$arrayintersect);
			    						}
			    					}
				    			}

				    			$log->log("Update data Successfully ",$this->id);
					    	}
				    	}else{

		
				    		$result = print_r("Query Error!!");
				    		$log->log("Query not execute",$this->id);
				    	}
			
				    }else{

				    	$result = print_r("Data Crawl Not Found.!!");
				    	$log->log("Data Crawl Not Found.!!",$this->id);
				    	$count = count($data);
				    	//$log-log("The Data is : ".$count,$this->id);
				    }


					sleep(5);

					$log->log(system('free'),$this->id);
				}	

			}	

		}

		public function array_keys($data){
			$putfild = '';
			$fild = '';

			for ($i=0; $i < count($data); $i++) { 
				$putfild = ' '.array_keys($data[$i]).','; 
			}

			$fild = $putfild;
		}

		public function update($arraydiff,$arrayintersect){
			$log = new LogMessage();

			$urls = str_replace('-', '_', $this->id);

			$conn = new mysqli($this->host,$this->username,$this->password,$this->database);
			if (!$conn) {
				$log->log('Problems for Update data : Connection Filed..'.$conn->connect_error,$this->id);
			}else{

				try{

					$countdiff = 0;
					$fielddiff = '';
					$diff = array();
					foreach ($arraydiff as $tempvaluediff) {
						$diff[$countdiff] = "";
						foreach ($tempvaluediff as $key => $value) {
							$fielddiff[$countdiff] .= $key ." = '". $value."', ";
						}
						$countdiff++;
					}


					$countintersect = 0;
					$fielintersect = '';
					$intersect = array();
					foreach ($arrayintersect as $tempvalueintersect) {
						$intersect[$countintersect] = "";
						foreach ($tempvalueintersect as $keys => $values) {
							$fielintersect[$countintersect] .= $keys ." = '". $values ."' && ";
						}
						$countintersect++;
					}

					for ($i=0; $i < count($arraydiff); $i++) { 
						$diffarr = substr($diff[$i], 0, -2);
						$intersectarr = substr($intersect[$i], 0, -4);

						$query = "UPDATE $urls SET $diffarr WHERE $intersectarr";
						$querys = mysqli_query($conn, $query);

						//var_dump($query);

						if ($querys) {
							$log->log($diff[$i]." : Changed",$this->id);
						}
						
					}

				}catch(Exception $e){

					return $e->getMessage();
					
				}

			}
		}
		

	}

	$temp_url = array('http://live.7msport.com/');
	$temp_id = array('live_Table');

	for ($i=0; $i < count($temp_url); $i++) {
		$mulai[$i] = new Render($temp_url[$i],$temp_id[$i]);
		$mulai[$i]->start();
	}
?>