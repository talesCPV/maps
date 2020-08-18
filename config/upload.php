<?php

  function metadata($path,$file_name){
      $xml = simplexml_load_file(getcwd()."/". $path.$file_name);
      $data = date('Y-m-d', strtotime($xml->metadata->time));
      $nome = $xml->trk->name;
      $arquivo = $path.$file_name;
      setcookie('file', $path.$file_name); 

      $lat_max = -100;
      $lon_max = -100;
      $lat_min = 100;
      $lon_min = 100;

      foreach($xml->trk->trkseg->trkpt as $trkpoint) {
        if($lat_max < floatval($trkpoint['lat'])){
          $lat_max = floatval ($trkpoint['lat']); 
        }
        if($lon_max < floatval($trkpoint['lon'])){
          $lon_max = floatval ($trkpoint['lon']); 
        } 
        if($lat_min > floatval($trkpoint['lat'])){
          $lat_min = floatval ($trkpoint['lat']); 
        } 
        if($lon_min > floatval($trkpoint['lon'])){
          $lon_min = floatval ($trkpoint['lon']); 
        } 
      
      }

//    GRAVA no Banco

      $user = $_COOKIE["usuario"];
      $query = "INSERT INTO tb_files VALUES (DEFAULT,'$user','$nome','$data','$arquivo',$lat_max,$lon_max,$lat_min,$lon_min);";
      include "config/conecta_mysql.inc";
      if (!$conexao)
        die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());
      mysqli_query($conexao, $query);
    
      $conexao->close();
  }



  if (IsSet($_COOKIE["usuario"]) && IsSet($_FILES["arquivo"])){

    $path = "atleta/".$_COOKIE["usuario"]."/GPX/";
    $arquivo = $_FILES["arquivo"]["name"];

    if ( substr($path.$arquivo,strlen($path.$arquivo)-1,1) != '/'){
        if(!is_dir($path)){
            //Directory does not exist, so lets create it.
            mkdir($path, 0777, true);
        }   

        $dia = date('d-m-Y');
        $file_name = $dia." - ".$arquivo;
        $original_name = $path.$file_name;
          
        copy($_FILES["arquivo"]["tmp_name"],$original_name);


        metadata($path,$file_name);

        setcookie("file", $path.$original_name, time()+3600);

        header('Location: config/refresh_ranking.php?path='.$original_name); 
    }

  }
?>