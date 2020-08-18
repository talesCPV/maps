/************* DOM **************/
$(document).ready(function(){


/************ POP UP ************/

    $('.close').click(function(){ // BOTÃO FECHAR DO POPUP
        $(".overlay").css("visibility", "hidden").css("opacity", "0");
    }); 

/************ FUNÇÕES ***************/    

    function popup(HTML,title) {
        $(".content").html(HTML);
        $('#popTitle').html(title);
        $(".overlay").css("visibility", "visible").css("opacity", "1");         
    }

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

    function sendEmail(body,sub,dest){

        var resp = false;
        dados = 'body='+body+'&sub='+sub+'&dest='+dest;

        $.ajax({
            url: 'ajax/ajax_sendMail.php',
            type: 'POST',
            dataType: 'html',
            data: dados,
            async: false,
            success: function(data){
                resp = true;
            }
        });	
        return resp;

    }

    function mkDir(path) {
        var resp = false;
        $.ajax({
            url: 'ajax/ajax_mkdir.php',
            type: 'POST',
            dataType: 'html',
            data: 'path='+ path,
            async: false,		
            success: function(data){
                resp = true;
            }
        });   
        return resp;
    }

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

    function verifica_usuario(obj) {
        user = $.trim($(obj[0]).val())
        var dados = "query=SELECT * FROM tb_usuario WHERE user = '"+user+"';";
        resp = queryDB(dados);
        if (!resp){
            return true;
        }else{
            alert('Este usuário já esta em uso, por favor escolha outro.')
            $(obj[0]).focus();
            return false;
        }

    }

    function verifica_email(obj) {
        email = $.trim($(obj[0]).val()).toLowerCase()
        var dados = "query=SELECT * FROM tb_usuario WHERE email = '"+email+"';";
        resp = queryDB(dados);
        if (!resp){
            return true;
        }else{
            $(obj[0]).focus();
            return false;
        }

    }    

    function valida_username(id){
        var name = $.trim($('#'+id).val()).toLowerCase();
        var forbid = ['@','&','%','(',')','#','*','!','/','<','>','{','}','[',']','^',' ',',','=','+','\'','|',';',':','$','"','\\'];
        var resp = '';
        for(i=0;i<name.length;i++){
            if(!forbid.includes(name.substring(i+1,i))){
                resp += name.substring(i+1,i);
            }
        }
        $('#'+id).val(resp); 

    }


/************ BOTÕES ***************/    

    $('#btn_login').click(function(){ 
        var user = $.trim($('#edtUser').val()).toLowerCase();
        var pass = $.trim($('#edtPass').val()).toLowerCase();
        if(user.includes('@')){
            var dados = "query=SELECT * FROM tb_usuario WHERE email = '"+user+"' and pass = '"+pass+"' ;";
        }else{
            var dados = "query=SELECT * FROM tb_usuario WHERE user = '"+user+"' and pass = '"+pass+"' ;";
        }
        var resp = queryDB(dados);
        if(resp.length > 0){
            if(resp[0].status == 'DESATIVADO'){
                alert('Por favor, verifique seu email para liberar seu novo usuário.');
            }else{
                mkDir('../atleta/'+resp[0].user);

                var now = new Date();
                now.setTime(now.getTime() + 1 * 3600 * 1000);
                var dados = "query=UPDATE tb_usuario SET lastlg=DEFAULT WHERE id="+resp[0].id +";";
                queryDB(dados);
                document.cookie = "usuario="+resp[0].user+"; expires=" + now.toUTCString() + "; path=/";
                document.cookie = "user_id="+resp[0].id +"; expires=" + now.toUTCString() + "; path=/";
                document.cookie = "sexo="+resp[0].sexo +"; expires=" + now.toUTCString() + "; path=/";
                document.cookie = "nome="+resp[0].nome +"; expires=" + now.toUTCString() + "; path=/";
                document.cookie = "email="+resp[0].email +"; expires=" + now.toUTCString() + "; path=/";
                document.cookie = "classe="+resp[0].class +"; expires=" + now.toUTCString() + "; path=/";
                document.cookie = "file=; expires=" + now.toUTCString() + "; path=/"; 
                document.cookie = "file_id=0; expires=" + now.toUTCString() + "; path=/"; 
                document.cookie = "popup=1; expires=" + now.toUTCString() + "; path=/";                
                window.mobileCheck = function() {
                    let check = false;
                    (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
                    return check;
                };
            
                if (window.mobileCheck()){
                    document.cookie = "plataform=mob; expires=" + now.toUTCString() + "; path=/";
                    window.location.href = "mobile.php";
                    alert('NÃO REPARE NA BAGUNÇA, VERSÃO MOBILE AINDA EM DESENVOLVIMENTO.');
                }else{
                    document.cookie = "plataform=web; expires=" + now.toUTCString() + "; path=/";
                    window.location.href = "maps.php";
                }

            }
        }else{
            alert('Usuário ou senha incorreto.');
        }

    }); 

    $('#btn_novousuario').click(function(){ 
        var HTML = "<input type='text' id='edt_newuser' placeholder='usuario'/>"
        HTML +=  "  <input type='password' id='edt_pass1' placeholder='senha'/>"
        HTML +=  "  <input type='password' id='edt_pass2' placeholder='repita a senha'/>"
        HTML +=  "  <input type='text' id='edt_nome' placeholder='nome completo'/>"
        HTML +=  "  <input type='text' id='edt_email' placeholder='email'/>"
        HTML +=  "  <select id='sel_sexo' placeholder='sexo'> <option value='M'>Masculino</option><option value='F'>Feminino</option></select>"
        HTML +=  "  <button id='btn_cadastro'> Cadastrar </button> ";

        $(document).off('click', '#btn_cadastro').on('click', '#btn_cadastro', function() {

            if(validaCampo(['#edt_newuser','#edt_pass1','#edt_pass2','#edt_nome','#edt_email']) && valida_senha(['#edt_pass1','#edt_pass2']) && verifica_usuario(['#edt_newuser']) ){
                if(verifica_email(['#edt_email'])){
                    var user = $.trim($('#edt_newuser').val()).toLowerCase();
                    var pass = $.trim($('#edt_pass1').val()).toLowerCase();
                    var nome = $.trim($('#edt_nome').val());
                    var email = $.trim($('#edt_email').val().toLowerCase());
                    var sexo = $.trim($('#sel_sexo').val());
                    var dados = "query=INSERT INTO tb_usuario VALUES (NULL,'"+user+"','"+pass+"','1','"+nome+"','"+email+"','DESATIVADO','"+sexo+"',DEFAULT);";
                    queryDB(dados);
                    var body = 'Clique no link para validar seu cadastro -> '+ encodeURIComponent('http://thebikeinbox.com.br/maps/config/read_mail.php?act=1\&user='+user+'\&email='+email)+' <-';
//                    alert(body);
                    if(sendEmail(body,'Validacao de Cadastro theBikeinBox',email)){
                        alert('Favor verificar seu email para validação do cadastro.')
                        $('.close').click();
                    }
                }else{
                    alert('Este email já esta em uso, por favor escolha outro.')
                }
            }            

        });
        
        $(document).off('keyup', '#edt_newuser').on('keyup', '#edt_newuser', function() {
            valida_username('edt_newuser');          
        });

        popup(HTML,"Cadastro de Usuário")

    });   

    $('#btn_esq_senha').click(function(){ 

        var HTML = "<input type='text' id='edt_email' size=70 placeholder='Digite seu email' /> <button id='btn_ressend_pass'> Enviar </button> ";
        
        $(document).off('click', '#btn_ressend_pass').on('click', '#btn_ressend_pass', function() {
            if(!verifica_email(['#edt_email'])){
                var email = $.trim($('#edt_email').val().toLowerCase());
                var dados = "query=SELECT * FROM tb_usuario WHERE email='"+email+"';";
                var resp = queryDB(dados);
                var body = ' Usuario -> '+ resp[0].user +'\n'+' Senha -> '+ resp[0].pass +'\n Ative Novamente ->'+ encodeURIComponent('http://thebikeinbox.com.br/maps/config/read_mail.php?act=1\&user='+resp[0].user+'\&email='+resp[0].email);
                sendEmail(body,'Recuperacao de senha - theBikeinBox',email);  
                alert('Sua senha foi reenviada para seu email, favor verificar.')  
                $('.close').click();
            }else{
                alert('Este email não pertence a nenhum usuário cadastrado.')
            }
        });
        popup(HTML,"Recuperação de senha")

    });   
    $('#btn_disclamer').click(function(){ 

        var HTML  = "<p id='disclamer'> Olá amigos, bem vindos ao theBikeinBox, um sistema criado como alternativa gratuíta para ranqueamento digital de ciclistas <br>";
            HTML += " Chame seus amigos, traga seu GPX para cá e vamos criar uma rede com tempos, segmentos, rankings e outros <br>";
            HTML += " Ainda estamos numa versão beta, ainda sem muitos recursos disponíveis mas já estamos trabalhando para melhorar o sistema e com a ajuda de vocês iremos chegar lá <br>";
            HTML += " Qualquer bug detectado favor entrar em contato com tales@thebikeinbox.com.br<br>";
            HTML += " Bons Treinos.</p>";
        HTML +=    "<button class='center_buttons'  id='btn_ok'> OK </button> ";
        
        $(document).off('click', '#btn_ok').on('click', '#btn_ok', function() {
            $('.close').click();
        });
        popup(HTML,"Disclamer")

    });      
/************ EVENTOS ***************/    

 

});