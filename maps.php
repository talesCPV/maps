<?php
	if (!IsSet($_COOKIE["usuario"])){
		header('Location: login.php');
	}else{
    include "config/upload.php";
  }
?>
<!DOCTYPE HTML>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
      <title>theBikeinBox</title>
      <link rel="icon" type="image/png" href="img/small_logo.png" />

      <!-- <link rel="stylesheet" type="text/css"  href="css/maps.css" /> -->
      <link rel="stylesheet" type="text/css"  href="css/popup.css" />
      <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="js/maps.js"></script>
      <script src="js/menu.js"></script>
      <script src="js/login.js"></script>

      <link rel="stylesheet" href="css/leaflet.css" /> 
      <script src="js/leaflet.js"></script>
      <script src="js/leaflet_func.js"></script>

      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>   
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      <script src="js/charts.js"></script>

      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> 
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


  </head>
  <body>

  <div class=" cabecalho">
    <?php
        include "config/bootmenu.php";
    ?>       
  </div>
  <div class="container mt-5 pt-5">
    
    <div class="row bg-secondary rounded" id="area_util">
      <div class="col-sm" id="screen_control">
        <p class="text-center" id="lbl_Nome">Telemetria</p>
        <table  class="table table-dark table-hover table-responsive{-sm|-md|-lg|-xl}" id="tbTelemetria">
        <tr><th></th><th >Geral</th><th>Segmento</th></tr>
        <tr><td>Distância</td><td id="edt_distger">0,0 Km</td>
            <td id="edt_distseg">0,0 Km</td>
        </tr>
        <tr><td>Vel. Média</td><td id="edt_vmger">0,0 Km/h</td>
            <td id="edt_vmseg">0,0 Km/h</td>
        </tr>
        <tr><td>Tempo</td><td id="edt_tempger">00:00:00</td>
            <td id="edt_tempseg">00:00:00</td>
        </tr>
        <tr><td>Elevação</td><td id="edt_eleger">0,0 m</td>
            <td id="edt_eleseg">0,0 m</td>
        </tr>
        <tr><td></td><td></td>
            <td></td>
        </tr>
        </table>
        <div id="chart_div" ></div>
        <div id="seg_div" ></div>
      </div>

      <div class="col-sm" id="maparea">
        <div id="controlmap">
          <div id="slider-range"></div>
          <div class="custom-control custom-checkbox" id="ckbZoom">
            <input type='checkbox' id='cbx_zoom' name='rbx_zoom' checked>
            <label for='rbx_zoom'>Auto Zoom</label>
            <input type='checkbox' id='cbx_sat' name='rbx_sat'>
            <label for='rbx_sat'>Satélite</label>
          </div>
        </div>
        <div id="map"></div>
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

  </body>
</html>