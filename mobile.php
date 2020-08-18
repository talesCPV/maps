<?php
	if (!IsSet($_COOKIE["usuario"])){
		header('Location: login.php');
	}else{
    include "config/upload.php";
  }
?>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css"  href="css/popup.css" />
    <link rel="stylesheet" type="text/css"  href="css/mobile.css" />
    <script src="js/mobile.js"></script>
    <script src="js/charts.js"></script>
    <script src="js/maps.js"></script>
    <script src="js/menu.js"></script>

    <link rel="stylesheet" href="css/leaflet.css" /> 
    <script src="js/leaflet.js"></script>
    <script src="js/leaflet_func.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>   
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="js/charts.js"></script>
</head>
<body>

<!-- Simulate a smartphone / tablet -->
<div class="mobile-container">

    <!-- Top Navigation Menu -->
    <div class="topnav">
        <a href="#home" class="active"><img src="img/small_logo.png" style="width:25px;heigth:auto;margin:0 15px"/>theBikeinBox
            <div id="user"></div>
        </a>
        <div class="menu">

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

        foreach ( $json_str['menu'] as $e ) {
            $main_name = $e['modulo'];
            $main_perm = $e['perm'];
            $main_link = $e['link'];
            if(in_array($classe, $main_perm)){
                echo"<ul><li id=\"". $e['id'] ."\" >". $main_name ."</li><ul>";
                foreach ($e['itens'] as $a ) {
                    if(in_array($classe, $a['perm'])){
                        echo"<li id=\"". $a['id'] ."\" >". $a['nome'] ."</li>";
                    }
                }
                echo("</ul></ul>");
            }

        } 
        echo"<ul><li id=\"btn_logout\"> LOGOUT  </li></ul></ul>";
    }

?>

        </div>
        <a id="btn_menu" class="icon" >
            <i class="fa fa-bars"></i>
        </a>
    </div>

    <div id="screen_control">
        <label class="title" id="lbl_Nome">Telemetria </label>

        <table id="tbTelemetria">
            <tr><th></th><th >Geral</th><th>Segmento</th></tr>
            <tr><td>Distância</td><td><input id="edt_distger" type="text" size=20 readonly  value="0,0 Km"></td>
                <td><input id="edt_distseg" type="text" size=20 readonly  value="0,0 Km"></td>
            </tr>
            <tr><td>Vel. Média</td><td><input id="edt_vmger" type="text" size=20 readonly  value="0,0 Km/h"></td>
                <td><input id="edt_vmseg" type="text" size=20 readonly  value="0,0 Km/h"></td>
            </tr>
            <tr><td>Tempo</td><td><input id="edt_tempger" type="text" size=20 readonly  value="00:00:00"></td>
                <td><input id="edt_tempseg" type="text" size=20 readonly  value="00:00:00"></td>
            </tr>
            <tr><td>Elevação</td><td><input id="edt_eleger" type="text" size=20 readonly  value="0,0 m"></td>
                <td><input id="edt_eleseg" type="text" size=20 readonly  value="0,0 m"></td>
            </tr>
            <tr><td></td><td></td>
                <td></td>
            </tr>
        </table>
        <div id="chart_div" ></div>
        <div id="seg_div" ></div>
    </div>

    <div id="range">
        <input type="range"  id="rng_ini" style="width:100" name="rng_ini" min="0" max="100" value="0">   
        <input type="range"  id="rng_fin" style="width:100" name="rng_fin" min="0" max="100" value="100">
    </div>

    <div id="maparea">
      <div id="map">mapa</div>
      <div id="controlmap">
        <div id="slider-range"></div>
        <div id="ckbZoom">
          <input type='checkbox' id='cbx_zoom' name='rbx_zoom' checked>
          <label for='rbx_zoom'>Auto Zoom</label>
          <input type='checkbox' id='cbx_sat' name='rbx_sat'>
          <label for='rbx_sat'>Satélite</label>
        </div>
      </div>
    </div>

    <div class="overlay"> 
      <div class="popup">
        <h2 id="popTitle"></h2>
        <div class="close" >&times</div>
        <div class="content"></div>
      </div>
    </div>
<!-- End smartphone / tablet look -->
</div>

</body>
</html>
