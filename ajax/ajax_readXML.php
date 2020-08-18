<?php

	if (IsSet($_POST["path"])){
		  $path = $_POST["path"];
		  
          $xml = simplexml_load_file($path);
		  $resp = array();
		  $resp[] = $xml->trk->name;
          foreach($xml->trk->trkseg->trkpt as $trkpoint)
          {
            $resp[] =  $trkpoint  ;
          }
		  print json_encode($resp);

	}

?>