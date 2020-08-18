<?php

function haversine($A,$B) { 
    $lat1 = $A[0]; 
    $lon1 = $A[1]; 
    $lat2 = $B[0]; 
    $lon2 = $B[1];

    $R = 6371; // km 
    $dLat = ($lat2-$lat1) * pi() / 180 ;  
    $dLon = ($lon2-$lon1) * pi() / 180 ; 
    $a = sin($dLat/2) * sin($dLat/2) +  cos($lat1 * pi() / 180) * cos($lat2 * pi() / 180) *  sin($dLon/2) * sin($dLon/2);  
    $c = 2 * atan2(sqrt($a), sqrt(1-$a)); 
    $d = $R * $c; 

    return $d;
}

// Recebe um arquivo, um segmento e um usuario e atualiza o ranking
function recTime($file_id, $seg_id, $path,$user_id){

    include "conecta_mysql.inc";
    if (!$conexao)
        die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());
    $query = "SELECT lat,lon FROM tb_seg_points WHERE seg_id={$seg_id} ORDER BY id;";
    $result = mysqli_query($conexao, $query);

    while($row[] = $result->fetch_row());

    $inicio = '';
    $fim = '';
    $qtd_points = $result->num_rows;
    $find_points = 0;
    $find_id = 0;
    $presc = 0.05; // precisão de 20 metros

    $count = 0;
    $pt_ini = 0;
    $pt_fin = 0;

    $xml = simplexml_load_file("../".$path);
    foreach($xml->trk->trkseg->trkpt as $trkpoint){
        $dist = haversine([floatval($trkpoint['lat']),floatval($trkpoint['lon'])],[floatval($row[$find_points][0]),floatval($row[$find_points][1])]);
        $first_dist = haversine([floatval($trkpoint['lat']),floatval($trkpoint['lon'])],[floatval($row[0][0]),floatval($row[0][1])]);

        if($find_points <= 5 AND  $first_dist <= $presc){ // corrige inicio
            $inicio = $trkpoint->time;                 
            $pt_ini = $count;
        }

        if($dist <= $presc) {
            if($find_points == 0){ // START
                $inicio = $trkpoint->time;                 
                $pt_ini = $count;
            }
            $find_points = $find_points +1;

            if($find_points == $qtd_points){ // END
                $find_points = 0;
                $pt_fin = $count;
                $find_id = $find_id + 1;
                $fim = $trkpoint->time;
                $tmp = strtotime($fim) - strtotime($inicio);
                
                $query = "INSERT INTO tb_seg_ranking 
                VALUES ({$find_id},{$seg_id},{$user_id},{$file_id},{$tmp},{$pt_ini},{$pt_fin})
                ON DUPLICATE KEY UPDATE time={$tmp}, ini={$pt_ini}, fin={$pt_fin};";
                mysqli_query($conexao, $query);            
            } // completou segmento
        } // achou ponto
        $count = $count + 1;

    } // foreach


    $conexao->close();
}

?>