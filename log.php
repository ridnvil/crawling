<?php

class LogMessage
{
	public function log($msg_log,$url){
		$log = date('d-M-Y H:i:s') . " -> Result : ".$msg_log.PHP_EOL;
	    $file = fopen('log/'.$url.'.log', 'a');
    	fwrite($file, print_r($log, true));
    	fclose($file);
	}	
}

?>