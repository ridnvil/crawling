<?php

$con = mysqli_connect('127.0.0.1','root','a2zsolusindo','coba');

if (!$con) {
	echo "Connecting error";
}else{
	echo "Connected";
}

?>