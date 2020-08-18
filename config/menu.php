

<?php

  
  setlocale(LC_MONETARY,"pt_BR", "ptb");

  if (IsSet($_COOKIE["classe"])){
    $classe = $_COOKIE["classe"];
    $user = $_COOKIE["usuario"];
  }

  echo"
     <div class=\"top_bar\">
 
        <div class=\"top_bar_lefta\">
    
		     <nav>
		      <ul class=\"menu\">";


    // LÊ O ARQUIVO MENU.JSON
    $arquivo = "config/menu.json";
    $fp = fopen($arquivo, "r");
    $menu_json = fread($fp, filesize($arquivo));
    fclose($fp);

    $json_str = json_decode($menu_json, true);

		foreach ( $json_str['menu'] as $e ) {
      $main_name = $e['modulo'];
      $main_perm = $e['perm'];
      $main_link = $e['link'];
      if(in_array($classe, $main_perm)){
        echo"<li id=\"". $e['id'] ."\" ><a href='". $main_link ."'>". $main_name ."</a><ul>";

        foreach ($e['itens'] as $a ) {
          if(in_array($classe, $a['perm'])){
            echo"<li id=\"". $a['id'] ."\" ><a href='". $a['link']."'>". $a['nome'] ."</a></li>";
          }
        }
        echo("</ul></li>");
      }

		} 

    echo"
		    </nav>
		    </div>
          <div class=\"top_bar_rigth\"> 
           <button id=\"btn_GPXupload\" >UPLOAD GPX</button>  ".strtoupper($user);
     echo"  <img id=\"btn_reload\" src=\"img/small_reload.png\">
            <img id=\"btn_config\" src=\"img/small_gear.png\">
            <img id=\"btn_logout\" src=\"img/small_logout.png\">
          </div>
        </div>"; // fim do echo principal


?>