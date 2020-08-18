// MENU E POPUP


function validaCampo(obj)
{

    for(var i = 0; i<obj.length; i++){

        if($.trim($(obj[i]).val())=="")
          {
              alert("Existem campos obrigatórios a serem preenchidos!");
              $(obj[i]).focus();
              return false;
          }
    }
    return true;
}

function valida_senha(obj)
{
    if($.trim($(obj[0]).val()) != $.trim($(obj[1]).val()))
      {
        alert("O campo \"Repita a senha\" não confere!");
        $(obj[1]).focus();
        return false;
      }else{
        return true;              
      }

}
    function popup(HTML,title) {
        $(".content").html(HTML);
        $('#popTitle').html(title);
        $(".overlay").css("visibility", "visible").css("opacity", "1");         
    }

    function delFile(file_id) {
        var resp = false;
        $.ajax({
            url: 'ajax/ajax_delfile.php',
            type: 'POST',
            dataType: 'html',
            data: 'file_id='+ file_id,
            async: false,		
            success: function(data){
//                alert(data);
                resp = true;
            }
        });   
        return resp;
    }

    function openFile(file_id) {
        var query = "query=SELECT * FROM tb_files WHERE id="+file_id;
        var resp = queryDB(query);
        var now = new Date();
        now.setTime(now.getTime() + 1 * 3600 * 1000);            
        document.cookie = "file_id="+resp[0].id+"; expires=" + now.toUTCString() + "; path=/";        
        document.cookie = "file="+resp[0].file_name+"; expires=" + now.toUTCString() + "; path=/";        
    }

    function downFile(file_id) {
        var query = "query=SELECT file_name FROM tb_files WHERE id="+file_id;
        var resp = queryDB(query);
        var path = "path="+resp[0].file_name;        
        window.location = 'config/download.php?'+path;   
        alert("Download de "+resp[0].file_name);   
    }


// DOM
$(document).ready(function(){


//    var arr = window.location.href.split("/");
//    var pag = arr[arr.length-1].substr(0,4) // maps(para PC) ou mobi(para mobile)
   
    /************ POP UP ************/

    $('.close').click(function(){ // BOTÃO FECHAR DO POPUP
        $(".overlay").css("visibility", "hidden").css("opacity", "0");

    }); 

    /************ BOTÕES ************/

    $('#btn_GPXupload').click(function(){
        $('#menu_GPXupload').click();
    }); 

    $('#btn_logout').click(function(){ 
        document.cookie = "usuario=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
        document.cookie = "classe=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
        document.cookie = "file=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
        window.location.href = "login.php"
    });  

    $('#btn_config').click(function(){ 
        var HTML = "<div class='estilo'> <input type='text' id='edt_newuser' placeholder='usuario' value='"+readCookie('usuario')+"' READONLY/>";
        HTML +=  "  <input type='password' id='edt_pass1' placeholder='senha'/>";
        HTML +=  "  <input type='password' id='edt_pass2' placeholder='repita a senha'/>";
        HTML +=  "  <input type='text' id='edt_nome' placeholder='nome completo' value='"+readCookie('nome')+"'/>";
        HTML +=  "  <input type='text' id='edt_email' placeholder='email' value='"+readCookie('email')+"' READONLY/>";
        if (readCookie('sexo') == 'M'){
            HTML +=  "  <select id='sel_sexo' placeholder='sexo'> <option value='M' selected>Masculino</option><option value='F'>Feminino</option></select>";
        }else{
            HTML +=  "  <select id='sel_sexo' placeholder='sexo'> <option value='M'>Masculino</option><option value='F' selected>Feminino</option></select>";
        }
        HTML +=  "  <button class='center_buttons' id='btn_cad'> Cadastrar </button> </div> ";


        $(document).off('click', '#btn_cad').on('click', '#btn_cad', function() {
            if(validaCampo(['#edt_pass1','#edt_pass2','#edt_nome']) && valida_senha(['#edt_pass1','#edt_pass2']) ){
                var query = "query=UPDATE tb_usuario SET pass='"+ $('#edt_pass1').val() +"', nome='"+ $('#edt_nome').val() +"', sexo='"+ $('#sel_sexo').val() +"' WHERE user='"+ $('#edt_newuser').val() +"';" ;
                var now = new Date();
                now.setTime(now.getTime() + 1 * 3600 * 1000);
                queryDB(query);
                document.cookie = "sexo="+ $('#sel_sexo').val() +"; expires=" + now.toUTCString() + "; path=/";
                document.cookie = "nome="+ $('#edt_nome').val() +"; expires=" + now.toUTCString() + "; path=/";
                $('.close').click();
            }

        });

        popup(HTML,"Perfil de Usuário");
    });  

    $('#btn_reload').click(function(){ 
        window.location.href = "config/refresh_ranking.php?path="+readCookie('file');
    });  

    /************ MENU **************/


    $('#menu_GPXupload').click(function(){ 
        var HTML =  "<form class='estilo' action='#' method='post' enctype='multipart/form-data'>";
            HTML += "<input type='file' name='arquivo' id='arquivo' accept='.gpx'><br>";
            HTML += "<button class='center_buttons' type='submit' > UPLOAD </button> </form>";

        popup(HTML,"Selecione seu arquivo GPX")
    }); 

    $('#menu_atleta_conf').click(function(){ 
        $('#btn_config').click();
    }); 

    $('#menu_novo_seg').click(function(){ 
        if (confirm('Trecho selecionado de '+dist_parc.toFixed(2)+' Km?')) {
            var HTML = "<div class='estilo'> <input type='text' id='edt_nome_seg' size=60 placeholder='digite um nome para o segmento'/>";
            HTML += "<button class='center_buttons'id='btn_criaseg'> Criar </button> </div>";

            $(document).off('click', '#btn_criaseg').on('click', '#btn_criaseg', function() {
                if (confirm('Confirma a criação deste segmento?')) {
                    var ini = parseInt(seg_parc[0]);
                    var fin = parseInt(seg_parc[1]);
                    var nome = $.trim($('#edt_nome_seg').val());
                    createSeg(ini,fin,nome);
                }

            });

            popup(HTML,"Novo Segmento");
        }
    }); 

    $('#menu_meus_seg').click(function(){ 
        var HTML = "<form class='estilo' action='#' method='post' enctype='multipart/form-data'> <select id='lbx_meus_seg' size='5'>";
        var query = "query=SELECT * FROM tb_segmento WHERE id_user = "+readCookie('user_id')+";";
        var resp = queryDB(query);
        if(resp.length > 0){
            for(i=0;i<resp.length;i++){
                HTML += " <option value='"+resp[i].id +"'>"+ resp[i].nome +"</option>";
            }            

        }
        HTML += "</select><br><br> <button class='center_buttons' id='btn_del_seg'>Deletar</button> </form>";

        $(document).off('click', '#btn_del_seg').on('click', '#btn_del_seg', function() {
            if (confirm('Deseja deletar este segmento?')) {
                var query =  "query=DELETE tb_seg_ranking, tb_seg_points, tb_segmento ";
                    query += "FROM tb_segmento INNER JOIN tb_seg_ranking INNER JOIN tb_seg_points ";
                    query += "WHERE tb_seg_ranking.seg_id= tb_segmento.id  AND tb_seg_points.seg_id = tb_segmento.id AND tb_segmento.id = "+$('#lbx_meus_seg').val()+";";
                    queryDB(query);
            }

        });

        popup(HTML,"Seus Segmentos")

    }); 

    $('#menu_meusroles').click(function(){         
        var HTML = "<form class='estilo' action='#' method='post' enctype='multipart/form-data'> <select id='lbxOpenRole' name='lbxOpenRole' size='5'>";
        var query = "user="+readCookie('usuario');
        
        var resp = '';
        $.ajax({
            url: 'ajax/ajax_listfiles.php',
            type: 'POST',
            dataType: 'html',
            data: query,
            async: false,
            success: function(data){
                resp = jQuery.parseJSON( data );
            }
        });   
   
        if(resp.length > 0){
            for(i=0;i<resp.length;i++){
                var data = resp[i].data
                var dia  = data.split("-")[2];
                var mes  = data.split("-")[1];
                var ano  = data.split("-")[0];
                HTML += " <option value='"+resp[i].id +"'>"+ dia+"/"+mes+"/"+ano+" - "+ resp[i].nome +"</option>";
            }            

        }

        HTML += "</select><br><br> <div class='center_buttons'> <button id='btnOpenGPX'>Abrir</button> <button id='btnDelGPX'>Deletar</button> <button id='btnDownGPX'>Download</button> </div> </form>";

        $(document).off('click', '#btnOpenGPX').on('click', '#btnOpenGPX', function() {
            openFile($('#lbxOpenRole').val());
        });
        
        $(document).off('click', '#btnDelGPX').on('click', '#btnDelGPX', function() {
            if (confirm('Deseja deletar este treino do sistema?')) {
                delFile($('#lbxOpenRole').val());
            }
        });

        $(document).off('click', '#btnDownGPX').on('click', '#btnDownGPX', function() {
            downFile($('#lbxOpenRole').val());
        });

        $(document).off('dblclick', '#lbxOpenRole').on('dblclick', '#lbxOpenRole', function() {
            $('#btnOpenGPX').click();
        });

        popup(HTML,"Selecione um treino para analisar");
        
    }); 

    
});