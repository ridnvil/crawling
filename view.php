<?php
	session_start();
	require_once 'log.php';
	require_once 'db.php';

	class Render extends Thread
	{
		// public $host = '192.168.1.249';
		// public $username = "admin";
		// public $password = "a1b2c3d4";
		// public $database = 'ridwan';

		public $url;
		public $id;
		public $tempcheck = true;

		public function __construct($arrurl,$arrid)
		{
			$this->url = $arrurl;
			$this->id = $arrid;
		}

		public function run(){

			$this->Crawling($this->id);
			// $this->render();
			// echo $this->url;
			// echo $this->id;
		}

		public function render(){
			$log = new LogMessage();
			echo "Proses Render Data From Website : ".$this->url." ID is ".$this->id."\n";
			$log->log("Render Processing from ".$this->url." where id ".$this->id,$this->id);
			$result = exec('phantomjs render.js '.$this->url.' '.$this->id);
			$log->log("Render Done..",$this->id);
			
		}

		
		public function Crawling($url){
			$globaltemp = array();
			$arrayresult = array();
			$log = new LogMessage();

			$database = new Database();
			$conn = $database->getConnections();

			if (!$conn) {
				//$log->log('Connection Filed..'.$e->getMessage(),$this->id);
			}else{

				while (true) {
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

					    var_dump($createTB);
					    $cek = $conn->query($createTB);

					    // $log->log("Table ".$urls." Successfully create in database ".$this->database);
				    	if ($cek) {

				    		$count = 0;
				    		$updateTB1 = "ALTER TABLE $urls ADD data_0 VARCHAR(500) AFTER id";
				    		$conn->query($updateTB1);
				    		var_dump($updateTB);

				    		while ($count < $tempTB) {

					    		$updateTB2 = "ALTER TABLE $urls ADD data_".($count+1)." VARCHAR(500) AFTER data_".($count)."";
					    		$conn->query($updateTB2);
					    		$count++;

					    		var_dump($updateTB);
					    	}

					    	if ($exec === true) {
					    		for ($i=0; $i <= $tempTB; $i++) { 
									$putfild[] = array_keys($data[$i]);
									// var_dump($putfild);
									// $fild = implode(',', $putfild);
								}

								$fild = implode(',', $putfild);
								$value = array();

								// var_dump($fild);

								foreach ($data as $rowvalue) {
									foreach ($rowvalue as $key => $row) {
										$rowvalue[$key] = $rowvalue[$key];

									}
									$value[] = "('" . implode("','", $rowvalue) . "')";

								}

								$query = "INSERT INTO $urls ($fild) VALUES " . implode(',', $value);
								$querys = mysqli_query($conn,$query);
								// var_dump($query);
								// var_dump($querys);
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
				    	
				    				$arrayintersect[] = $this->array_intersect_fixed($globaltemp,$comparearray);
				    				$arraydiff[] = $this->arrayRecursiveDiff($globaltemp,$comparearray);
				    				// print_r($arrayintersect);

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
				    	$log->log("Data Crawl Not Found.!!",$this->id."\n");
				    }


					sleep(5);
				}	

			}	

		}

		function array_intersect_fixed($array1, $array2) { 
		    $result = array();
		    foreach ($array1 as $val) { 
		      if (($key = array_search($val, $array2, TRUE))!==false) { 
		         $result[] = $val; 
		         unset($array2[$key]); 
		      } 
		    } 
		    return $result; 
		}

		public function arrayRecursiveDiff($aArray1, $aArray2) { 
		    $aReturn = array(); 
		   
		    foreach ($aArray1 as $mKey => $mValue) { 
		        if (array_key_exists($mKey, $aArray2)) { 
		            if (is_array($mValue)) { 
		                $aRecursiveDiff = $this->arrayRecursiveDiff($mValue, $aArray2[$mKey]); 
		                if (count($aRecursiveDiff)) { $aReturn[$mKey] = $aRecursiveDiff; } 
		            } else { 
		                if ($mValue != $aArray2[$mKey]) { 
		                    $aReturn[$mKey] = $mValue; 
		                } 
		            } 
		        } else { 
		            $aReturn[$mKey] = $mValue; 
		        } 
		    } 
		   
		    return $aReturn;
		}

		public function update($arraydiff, $arrayintersect){

			foreach (array_keys($arraydiff) as  $key) {
				var_dump($key);
			}

		}
	}

	$temp_url = array('https://www.enterkomputer.com/processor.php');
	$temp_id = array('left-0');

	for ($i=0; $i < count($temp_url); $i++) {
		$mulai[$i] = new Render($temp_url[$i],$temp_id[$i]);
		$mulai[$i]->start();
	}
?>