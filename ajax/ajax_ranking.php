<?php

	function fillRanking($seg_id,$lat_ini,$lon_ini,$lat_fin,$lon_fin)

		  include "conecta_mysql.inc";
		  if (!$conexao)
			  die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());
  
		  $query="SELECT * FROM tb_segmento WHERE id={$seg_id}";  		    
		  $result = mysqli_query($conexao, $query);		  
		  $row = mysqli_fetch_row($result);
		  $lat_ini

		  

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