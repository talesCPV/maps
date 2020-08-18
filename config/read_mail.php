<?php

    if(count($_GET)>0){
        $active = ($_GET["act"]);
        if($active == '1'){
            $user = ($_GET["user"]);
            $email = ($_GET["email"]);
            include "conecta_mysql.inc";
            if (!$conexao)
            	die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());

            $query = "UPDATE tb_usuario SET status = 'ATIVO' WHERE user='".$user."' AND email='".$email."';";
	    	$result = mysqli_query($conexao, $query);
            header('Location: login.php');  
//            echo("->".$query);

        }    

    }

?>