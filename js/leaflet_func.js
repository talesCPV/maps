//VARIÁVEIS GLOBAIS
    var file_path = '../'+readCookie('file');
    var gpx = openGPX(file_path);
    var Data = getData();
    seg_tot = [0,Data.length-1];
    seg_parc = [0,Data.length-1];


//    alert(readCookie('file'));

//FUNÇÕES

function openGPX(path){

    path = "path=" + path;
    var resp = "";
    $.ajax({
        url: 'ajax/ajax_readXML.php',
        type: 'POST',
        dataType: 'html',
        data: path,
        async: false,		
        success: function(data){
            resp = jQuery.parseJSON( data );
        }

    }); 

    return resp;
}

function getData(){

    var segData = [];
    var dist = 0;
    var altAcum = 0;
    var lastEle = gpx[1].ele;
    var stopTime = 0;
    var lastDist = 0;
    var salto = 10;

    for(i=1;i<gpx.length-1;i++){
        var A = [gpx[i]["@attributes"].lat,gpx[i]["@attributes"].lon];
        var B = [gpx[i+1]["@attributes"].lat,gpx[i+1]["@attributes"].lon];
        var newEle = parseFloat(gpx[i].ele);
        s1 = parseInt(gpx[i].time.substring(17,19));      
        s2 = parseInt(gpx[i+1].time.substring(17,19)); 

        var inter = s2-s1;

        if(inter < 0){
            inter += 60;
        }
        lastDist = dist;
        dist += parseFloat(haversine(A,B).toFixed(3));
/*

        if (i > salto){
            salto += 10;
//            stopTime += inter;
            alert[i];

        }
     */
//        alert(newEle+" - "+lastEle);
        if(newEle > (lastEle + 0.3)){
            altAcum += (newEle - lastEle);
        }
        lastEle = newEle; 
        lt = parseFloat(gpx[i]["@attributes"].lat);
        ln = parseFloat(gpx[i]["@attributes"].lon);                
        segData.push( [dist, altAcum, parseInt(gpx[i].ele), gpx[i].time.substring(11,19), stopTime, lt, ln ]);
    }
// segData = [distancia, alt acumulada, elevação, hora, hora parada, lat, lon]
//    alert(segData);  

//    alert(stopTime);


    return segData;


}

function markerPoint(map,coords,text="", drag=false, mark='mark_flag.png'){

    var Icon = L.icon({
        iconUrl: 'img/'+mark,
        iconSize:     [40, 40], // size of the icon
        iconAnchor:   [22, 40], // point of the icon which will correspond to marker's location
        popupAnchor:  [0, -40] // point from which the popup should open relative to the iconAnchor
    });

    marker = L.marker(coords,{draggable:drag, icon:Icon}).addTo(map)
    if(text != ""){
        marker.bindPopup(text).openPopup();
    }
    return marker;
}

function traceLine(map,color='#00F',strend=[0,Data.length]){
//    alert(strend);
//    alert(Data[strend[0]][6])
    var polylinePoints = [];
    var lat_min = 100;
    var lon_min = 100;
    var lat_max = -100;
    var lon_max = -100;
    for(i=strend[0];i<strend[1];i++){
        ponto = [Data[i][5], Data[i][6]];
        polylinePoints.push(ponto);

        if(Data[i][5] < lat_min){
            lat_min = Data[i][5];
        }
        if(Data[i][5] > lat_max){
            lat_max = Data[i][5];
        }
        if(Data[i][6] < lon_min){
            lon_min = Data[i][6];
        }
        if(Data[i][6] > lon_max){
            lon_max = Data[i][6];
        }        
    }
//    alert([lat_min,lon_min,lat_max,lon_max]);

    if ($('#cbx_zoom').is(":checked")){
        map.fitBounds([[lat_min,lon_min],[lat_max,lon_max]]);
    }

    polyline = L.polyline(polylinePoints).addTo(map); 
    polyline.setStyle({
        color: color
    }); 

    return polyline;
}
function toRad(Value) {
    /** Converts numeric degrees to radians */
    return Value * Math.PI / 180;
}

function haversine(A,B) { 
    var lat1 = A[0]; 
    var lon1 = A[1]; 
    var lat2 = B[0]; 
    var lon2 = B[1];

    var R = 6371; // km 
    var dLat = toRad(lat2-lat1);  
    var dLon = toRad(lon2-lon1);  
    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +  Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *  Math.sin(dLon/2) * Math.sin(dLon/2);  
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
    var d = R * c; 

    return(d) ;
}

 function slider(map,seg,mark,line) {
    $("#ckbZoom").css("visibility", "visible").css("opacity", "1");
    $( "#slider-range" ).slider({
      range: true,
      min: seg[0],
      max: seg[1],
      values: [ seg[0], seg[1] ],
      slide: function( event, ui ) {
        map.removeLayer(mark[0]);
        map.removeLayer(mark[1]);
        map.removeLayer(line);
        var lat1 = Data[ui.values[0]][5];
        var lon1 = Data[ui.values[0]][6];
        var lat2 = Data[ui.values[1]][5];
        var lon2 = Data[ui.values[1]][6];
        mark[0]=markerPoint(map,[lat1, lon1],'',false,'mark_green.png' );
        mark[1]=markerPoint(map,[lat2, lon2],'',false,'mark_red.png' );
        line = traceLine(map,"#F00",ui.values);
//        map.panTo(new L.LatLng(lat1,lon1));

      },
      stop: function(event, ui) {
        seg_parc = ui.values;
        var lat1 = Data[ui.values[0]][5];
        var lon1 = Data[ui.values[0]][6];
        var lat2 = Data[ui.values[1]][5];
        var lon2 = Data[ui.values[1]][6];
//        map.fitBounds([[lat1,lon1],[lat2,lon2]]);
        refreshData();
        plotAlt();  
      }
    });

  } ;

  function calctempo(tm1,tm2){

      var resp = 0;
      h1 = parseInt(tm1.substring(0,2));
      m1 = parseInt(tm1.substring(3,5));
      s1 = parseInt(tm1.substring(6,8));      
      h2 = parseInt(tm2.substring(0,2));
      m2 = parseInt(tm2.substring(3,5));
      s2 = parseInt(tm2.substring(6,8));    

      st = s2-s1;
      if(st < 0){
          st += 60;
          m2 -= 1;
      }
      mt = m2-m1;
      if(mt < 0){
          mt += 60;
          h2 -= 1;
      }
      ht = h2-h1;
      if(ht < 0){
          ht += 24;          
      }

      return(("0" + ht).slice(-2)+":"+("0" + mt).slice(-2)+":"+("0" + st).slice(-2));
      
  }

  function calcvm(dt,hr){
    var temp = (parseInt(hr.substring(0,2)) * 3600) + (parseInt(hr.substring(3,5)) * 60) + parseInt(hr.substring(6,8)); 
    return((dt / temp * 3600).toFixed(2)+"km/h" );
  }


  function refreshData(){
    $('#lbl_Nome').html(gpx[0][0]);

    dist_tot = Data[seg_tot[1]][0].toFixed(2) ;
    temp_tot = calctempo(Data[0][3],Data[seg_tot[1]][3]);
    vm_tot = calcvm(dist_tot,temp_tot)
    ele_tot = Data[seg_tot[1]][1].toFixed(2);

    $('#edt_distger').val(dist_tot+"km" );
    $('#edt_tempger').val( temp_tot );
    $('#edt_vmger').val(vm_tot);
    $('#edt_eleger').val( ele_tot+"m");

    dist_parc = Data[seg_parc[1]][0] - Data[seg_parc[0]][0] ;
    temp_parc = calctempo(Data[seg_parc[0]][3],Data[seg_parc[1]][3]);
    vm_parc = calcvm(dist_parc,temp_parc)
    ele_parc = Data[seg_parc[1]][1]- Data[seg_parc[0]][1];

    $('#edt_distseg').val(dist_parc.toFixed(2)+"km" );
    $('#edt_tempseg').val( temp_parc );
    $('#edt_vmseg').val(vm_parc);
    $('#edt_eleseg').val( ele_parc.toFixed(2)+"m");
  }




  function movePins(map,mark,A,B,line){
    var lat1 = Data[A][5];
    var lon1 = Data[A][6];
    var lat2 = Data[B][5];
    var lon2 = Data[B][6];
    map.removeLayer(mark[0]);
    map.removeLayer(mark[1]);
    mark[0]=markerPoint(map,[lat1, lon1],'',false,'mark_green.png' );
    mark[1]=markerPoint(map,[lat2, lon2],'',false,'mark_red.png' );
  }



//DOM
$(document).ready(function(){

// ************** MOBILE FUNCTIONS ******************

    $('#rng_ini').attr('min', 0);
    $('#rng_fin').attr('max', Data.length);



  $('#rng_ini').change(function(){ 
    $('#rng_fin').attr('min', $(this).val());

    seg_parc[0] = $('#rng_ini').val();
    map.removeLayer(line_seg);
    line_seg = traceLine(map,"#F00",seg_parc);

    refreshData();

  }); 

  $('#rng_fin').change(function(){ 
    $('#rng_ini').attr('max', $(this).val());

    seg_parc[1] = $('#rng_fin').val();
    map.removeLayer(line_seg);
    line_seg = traceLine(map,"#F00",seg_parc);

    refreshData();
  }); 


  $('input[type=range]').on('input', function () { // WHEN RANGE IS CHANGING

    movePins(map,mark_inifin,$('#rng_ini').val(),$('#rng_fin').val());
    
  });

// ****************************************************

    var coords = [[gpx[1]["@attributes"].lat, gpx[1]["@attributes"].lon],[gpx[1]["@attributes"].lat, gpx[1]["@attributes"].lon]]; 
    
    mbAttr = 'present by theBikeinBox 2020';
    mapUrl = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';    
    satUrl = 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}';

    maplayer = L.tileLayer(mapUrl, {
        id: 'mapbox.streets',
        attribution: mbAttr
    });

    satlayer = L.tileLayer(satUrl, {
        id: 'mapbox.streets',
        attribution: mbAttr
    });

    map = L.map('map', {
        center: [30, 0],
        zoom: 2,
        layers: [maplayer]
    });


    $('#cbx_sat').click(function(){        
        if ($('#cbx_sat').is(":checked")){
            map.removeLayer(maplayer);
            map.addLayer(satlayer);
        }else{
            map.removeLayer(satlayer);
            map.addLayer(maplayer);
        }
    });

    markerPoint(map,coords[0],'');
    mark_inifin = [markerPoint(map,[gpx[1]["@attributes"].lat, gpx[1]["@attributes"].lon],'',false,'mark_green.png'),markerPoint(map,[gpx[gpx.length-1]["@attributes"].lat, gpx[gpx.length-1]["@attributes"].lon],'',false,'mark_red.png')];
 
    line_tot = traceLine(map);
    line_seg = traceLine(map,"#F00",seg_tot);


    $('#tb_segmentos tr').mouseover(function(){
        var ini = parseInt($(this).children('td').slice(5, 6).text());
        var fin = parseInt($(this).children('td').slice(6, 7).text());
        seg_parc = [ini,fin];
//        $( "#slider-range" ).slider( "values", ini, fin );
        map.removeLayer(mark_inifin[0]);
        map.removeLayer(mark_inifin[1]);
        map.removeLayer(line_seg);
        var lat1 = Data[ini][5];
        var lon1 = Data[ini][6];
        var lat2 = Data[fin][5];
        var lon2 = Data[fin][6];
        mark_inifin[0]=markerPoint(map,[lat1, lon1],'',false,'mark_green.png' );
        mark_inifin[1]=markerPoint(map,[lat2, lon2],'',false,'mark_red.png' );
        line_seg = traceLine(map,"#000",[ini,fin]);     
//        map.fitBounds([[lat1,lon1],[lat2,lon2]]);           
        refreshData();        
    });
    $('#tb_segmentos tr').mouseout(function(){
        map.removeLayer(mark_inifin[0]);
        map.removeLayer(mark_inifin[1]);
        map.removeLayer(line_seg);
    });

    slider(map,seg_parc,mark_inifin,line_seg);
  
    refreshData();
    plotAlt();

});