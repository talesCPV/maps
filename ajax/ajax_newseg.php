<?php

/*  INSERE UM SEGMENTO E CRIA SEUS PONTOS DE 10 EM 10  */

	if (IsSet($_POST["name"])){
        $name = $_POST["name"];
        $arq = '../'.$_POST["file"];
        $user = $_POST["user"];
        $lat_ini = $_POST["lat_ini"];
        $lon_ini = $_POST["lon_ini"];
        $lat_fin = $_POST["lat_fin"];
        $lon_fin = $_POST["lon_fin"];
        $dist = $_POST["dist"];
        $last_time = 0;
        $last_lat = 0;
        $last_lon = 0;


        include "../config/conecta_mysql.inc";
        include "../config/map_functions.php";
        if (!$conexao)
            die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());
        $query = "INSERT INTO tb_segmento VALUES  (DEFAULT,'{$name}','".date("Y-m-d")."',{$user},{$lat_ini},{$lon_ini},{$lat_fin},{$lon_fin},{$dist});";
        mysqli_query($conexao, $query);

        $query = "SELECT * FROM tb_segmento WHERE  nome='{$name}' AND id_user={$user} AND lat_ini={$lat_ini} AND lon_ini={$lon_ini} AND lat_fin={$lat_fin} AND lon_fin={$lon_fin};";
        $result = mysqli_query($conexao, $query);

        if($result->num_rows == 1){ // Rec seg_points
        $fetch = mysqli_fetch_row($result);
            $id = $fetch[0];
            $xml = simplexml_load_file($arq);
            $cont = 0;
            $rec = false;
            $query = 'INSERT INTO `tb_seg_points` VALUES ';
            $auto_inc = 1;
            foreach($xml->trk->trkseg->trkpt as $trkpoint){
                $cont = $cont-1;        
                if($trkpoint['lat'] == $lat_ini && $trkpoint['lon'] == $lon_ini ){
                    $rec = true; // começou a gravar o segmento
                    $last_time = $trkpoint->time;
                }              
                if($trkpoint['lat'] == $lat_fin && $trkpoint['lon'] == $lon_fin) {
                    $rec = false; // terminou de gravar o segumento
                    break;
                }

                if($rec && $cont <= 0){
                    $inst_dist = haversine([$last_lat,$last_lon],[floatval($trkpoint['lat']),floatval($trkpoint['lon'])]); // em Km
                    $inst_time = strtotime($trkpoint->time); // em Seg                    
                    $vel_inst = intval(($inst_dist /(($inst_time - $last_time)/3600))); // em Km/h
//                    print $vel_inst."\n";

                if(($vel_inst > 1 && $vel_inst < 80) || $auto_inc == 1){
//                        print "gravou.. \n";
                           
                        $last_lat = floatval($trkpoint['lat']);
                        $last_lon = floatval($trkpoint['lon']);
                        $last_time = $inst_time;
    

                        switch (true) {
                            case ($vel_inst < 5):
                                $interv = 2;
                                break;
                            case ($vel_inst < 10):
                                $interv = 5;
                                break;
                            case ($vel_inst < 20):
                                $interv = 10;
                                break;
                            case ($vel_inst < 30):
                                $interv = 13;
                                break;                                
                            default:
                                $interv = 15;
                            }

                        $cont = $interv;
                        $query = $query . "({$auto_inc},{$id},{$trkpoint['lat']},{$trkpoint['lon']}),";
                        $auto_inc = $auto_inc +1;    
                    }
                }
            }
            $query = $query . "({$auto_inc},{$id},{$lat_fin},{$lon_fin});";
            mysqli_query($conexao, $query);
            // Refresh Ranking
            $query =  "SELECT fil.id, fil.file_name, fil.lat_max, fil.lon_max, fil.lat_min, fil.lon_min, usr.id AS id_usr
            FROM tb_files AS fil
            INNER JOIN tb_usuario AS usr
            ON lat_max >= {$lat_ini} AND lon_max >= {$lon_ini}
            AND lat_min <= {$lat_ini} AND lon_min <= {$lon_ini}
            AND lat_max >= {$lat_fin} AND lon_max >= {$lon_fin}
            AND lat_min <= {$lat_fin} AND lon_min <= {$lon_fin}
            AND fil.user = usr.user;";

//            print $query;
            $result = mysqli_query($conexao, $query);

            if($result->num_rows > 0){
                while($row = mysqli_fetch_assoc($result)) {

                    recTime($row['id'],$id,$row['file_name'],$row['id_usr']);
                    
                }
    
            }

          }

		$conexao->close();

	}

?>