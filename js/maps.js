/* SCRIPTS DE VALIDAÇÃO DE DADOS */      

    function queryDB(query) {        
        var resp = '';
        $.ajax({
            url: 'ajax/ajax.php',
            type: 'POST',
            dataType: 'html',
            data: query,
            async: false,
            success: function(data){
                resp = jQuery.parseJSON( data );
            }
        });   
        return resp;     
    }

    function sectostr(time){
        var h = 0;
        var m = Math.trunc(time / 60);
        if (m >= 60){
            h = Math.trunc(m / 60);
            m = m - (h * 60);
        }                                
        var s = time % 60 ;
        var tempo = ("0" + h).slice(-2)+":"+("0" + m).slice(-2)+":"+("0" + s).slice(-2); 
        return tempo;       
    }

    function readCookie(value) {
        var resp = "";
        var cookies = document.cookie.split(';');

        cookies.forEach(element => {
                item = element.split('=');
                if($.trim(item[0]) == value){
                    resp = item[1];
                }
            });
            
        return resp;
    }

    function createSeg(ini, fin, nome) {

        var lat_ini = Data[ini][5];
        var lon_ini = Data[ini][6];
        var lat_fin = Data[fin][5];
        var lon_fin = Data[fin][6];
        var file = readCookie('file');
        var user = readCookie('user_id');
        var dist = (Data[fin][0] - Data[ini][0]).toFixed(2);

        var query = 'name='+nome+'&file='+file+'&user='+user+'&lat_ini='+lat_ini+'&lon_ini='+lon_ini+'&lat_fin='+lat_fin+'&lon_fin='+lon_fin+'&dist='+dist;

        $.ajax({
            url: 'ajax/ajax_newseg.php',
            type: 'POST',
            dataType: 'html',
            data: query,
//            async: false,
            success: function(data){
//                alert(data);
                alert('Segmento criado com sucesso, aguarde alguns instantes para a atualização dos dados');
                $('.close').click();
            },
            error: function(result) {
                alert("Data not found");
            }
        });  
              
    }

    function loadSeg(){
        var file_id =  readCookie('file_id');
//        var file_name = readCookie('file');


        var query="query=SELECT seg.id, seg.nome, seg.dist, rnk.time, rnk.ini, rnk.fin FROM tb_segmento AS seg ";
        query +=  "INNER JOIN tb_files AS fil INNER JOIN tb_seg_ranking AS rnk ";
        query +=  "ON seg.lat_ini <= fil.lat_max AND seg.lat_ini >= fil.lat_min ";
        query +=  "AND seg.lon_ini <= fil.lon_max AND seg.lon_ini >= fil.lon_min ";
        query +=  "AND fil.id = '"+ file_id +"' ";
        query +=  "AND rnk.seg_id = seg.id AND rnk.file_id = fil.id;";

        var resp = queryDB(query);
        var HTML = '';
//alert(resp.length);

      if(resp.length > 0){
            HTML = "<table id='tb_segmentos' ><tr><th class='hide'>id</th><th>Nome</th><th>Tempo</th><th>Dist.</th><th>Vel. Media</th></td>";

            resp.forEach(element =>{
                if(element.time > 0){
                    var tempo = sectostr(element.time);
                    var vel =  (element.dist / element.time * 3600).toFixed(2);
                    HTML += "<tr><td class='hide'>"+ element.id +"</td><td>"+element.nome +"</td><td>"+ tempo +"</td><td>"+ element.dist +" Km</td><td>"+ vel +"km/h</td><td class='hide'>"+ element.ini +"</td><td class='hide'>"+ element.fin +"</td></tr>";
                }
            });
            HTML += "</table>";
        }
        
        $("#seg_div").html(HTML);
        $(".hide").css("visibility", "hidden").css("opacity", "0");

    }

//DOM
$(document).ready(function(){

// POPUP INICIAL

/* // Abre apenas após o login
    if(readCookie('popup') == '1'){
        alert('Bem Vindo!!!');
        var now = new Date();
        now.setTime(now.getTime() + 1 * 3600 * 1000);
        document.cookie = "popup=0; expires=" + now.toUTCString() + "; path=/";

    }
 */  

    if(readCookie('file').length > 15){
        loadSeg();
    }
    
    $('#tb_segmentos tr').click(function(){
        var sexo = readCookie('sexo');
        var seg_id = $(this).children('td').slice(0, 1).text();
        var query="query=SELECT MIN(rnk.time) as time, rnk.seg_id, usr.nome ";
        query +=  "FROM tb_seg_ranking as rnk INNER JOIN tb_usuario AS usr ";
        query +=  " WHERE rnk.seg_id="+ seg_id +" AND rnk.user_id = usr.id AND usr.sexo='"+sexo;
        query +=  "' GROUP BY(rnk.user_id) ORDER BY time ASC;";

        var resp = queryDB(query);
        var HTML = '';
        if(resp.length > 0){
            HTML = "<table class='tb_ranking'><tr><th>Pos</th><th>Nome</th><th>Tempo</th></td>";
            var pos = 0;
            resp.forEach(element =>{
                pos += 1;
                var tempo = sectostr(element.time);
                HTML += "<tr><td>"+ pos +"</td><td>"+element.nome +"</td><td>"+ tempo +"</td></tr>";
            });
            HTML += "</table>";
        }

        popup(HTML,$(this).children('td').slice(1, 2).text().toUpperCase());

    });


    $('#lbl_Nome').dblclick(function(){
        var HTML = "<div class='estilo'> <input type='text' id='edt_nome_treino' value='"+ $('#lbl_Nome').html() +"' size=60 placeholder='digite um nome para o seu treino'/>";
        HTML += "<button id='btn_save_nome'> Salvar </button> </div>";

        $(document).off('click', '#btn_save_nome').on('click', '#btn_save_nome', function() {
            var nome = ($('#edt_nome_treino').val());
            var query ="path="+readCookie('file')+"&name="+nome; 
            $.ajax({
                url: 'ajax/ajax_writeXML.php',
                type: 'POST',
                dataType: 'html',
                data: query,
                async: false,
                success: function(dados){
                    query = "query=UPDATE tb_files SET nome='"+nome+"' WHERE id="+readCookie('file_id')+";";
                    queryDB(query);
                    $('#lbl_Nome').html(nome);                    
                }
            });  
            $('.close').click();
        });

        popup(HTML,"Alterar Nome do Treino")
    });     

});
