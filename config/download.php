<?php

  function download($arquivo){
    $names  = explode("/", $arquivo);
    $nome = $names[count($names)-1];
    $resp = "";
    for($i=0;$i<strlen($nome);$i++){ // tira os espaços
      if($nome[$i] != " "){
        $resp = $resp.$nome[$i];
      }
    }

    header("Content-Type: application/force-download");
    header("Content-Type: application/octet-stream;");
    header("Content-Length:".filesize($arquivo));
    header("Content-disposition: attachment; filename=". $resp);
    header("Pragma: no-cache");
    header("Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0");
    header("Expires: 0");
    readfile($arquivo);
    flush();

  }


  if (IsSet($_GET["path"])){
    $file = "../".$_GET["path"];

    if (file_exists($file)) {
      download($file);
    }else{
      echo" Este arquivo não existe mais no servidor.";
    }

  }
?>