
<?php
  if (IsSet($_COOKIE["classe"])){
    $classe = $_COOKIE["classe"];
    $user = $_COOKIE["usuario"];

    // LÊ O ARQUIVO MENU.JSON
    $arquivo = "config/menu.json";
    $fp = fopen($arquivo, "r");
    $menu_json = fread($fp, filesize($arquivo));
    fclose($fp);
    $json_str = json_decode($menu_json, true);

  }
?>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="#">theBikeinBox</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
    
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <?php

                foreach ( $json_str['menu'] as $e ) {
                    $main_name = $e['modulo'];
                    $main_perm = $e['perm'];
                    $main_link = $e['link'];
                    if(in_array($classe, $main_perm)){

//                        echo"<li id=\"". $e['id'] ."\" ><a href='". $main_link ."'>". $main_name ."</a><ul>";

                        echo "
                        <li class='nav-item dropdown'>

                            <a class='nav-link dropdown-toggle' href='{$main_link}' id='navbarDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
                            {$main_name}
                            </a>
                            <div class='dropdown-menu' aria-labelledby='navbarDropdown'>";
    
                        foreach ($e['itens'] as $a ) {
                            if(in_array($classe, $a['perm'])){

    //                            echo"<li id=\"". $a['id'] ."\" ><a href='". $a['link']."'>". $a['nome'] ."</a></li>";

                                echo"<a class='dropdown-item' id='{$a['id']}' href='{$a['link']}'>{$a['nome']}</a>";

                            }
                        }
                        echo("</div> </li>");



                    }

                } 

            ?>
        </ul>
        
            <?php
                echo" <a class='nav-link disabled' href='#' tabindex='-1' aria-disabled='true'>".strtoupper($user)."</a>
                      <button class='btn btn-outline-success my-2 my-sm-0' id='btn_GPXupload' >UPLOAD GPX</button>
                      <button class='btn btn-outline-success my-2 my-sm-0 border-0' id='btn_reload' ><img src=\"img/small_reload.png\"></button>                      
                      <button class='btn btn-outline-success my-2 my-sm-0 border-0' id='btn_config' ><img src=\"img/small_gear.png\"></button>                      
                      <button class='btn btn-outline-success my-2 my-sm-0 border-0' id='btn_logout' ><img src=\"img/small_logout.png\"></button>";
            ?>
        
        </div>
    </nav>

