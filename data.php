<?php

class Data {

	public function CrawlData($newURL){

		//$this->render();
		$dom=new DOMDocument;
		@$dom->loadHTMLFile("webpage/".$newURL.".html");					
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

	    if (strlen($data > 1)) {
	    	
		    $json = json_encode(print_r($data, true));
		    $file = fopen('data/'.$newURL.'.json', 'w');
	    	fwrite($file, print_r(json_decode($json), true));
	    	fclose($file);
	    }
	    return($data);
	}
}

?>