<?php

	if (IsSet($_POST["path"])){
          $path = "../".$_POST["path"];
          $name = $_POST["name"];
		  
          $xml = simplexml_load_file($path);
		  $resp = array();
		  $xml->trk->name = $name;
          $xml->asXml($path);

	}

?>