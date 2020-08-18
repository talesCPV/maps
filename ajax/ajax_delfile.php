<?php

	if (IsSet($_POST["file_id"])){

        $file_id =$_POST["file_id"]; 
        include "../config/conecta_mysql.inc";
        if (!$conexao)
            die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());

        $query="SELECT * FROM tb_files WHERE id={$file_id}";
        $result = mysqli_query($conexao, $query);	
        if($result->num_rows > 0){
            $row = mysqli_fetch_row($result);
            $file = $row[4];
            unlink('../'.$file);

            $query="DELETE tb_seg_ranking, tb_files FROM tb_files 
            INNER JOIN tb_seg_ranking 
            WHERE tb_seg_ranking.file_id = tb_files.id  
            AND tb_files.id = ". $file_id .";"; 

            mysqli_query($conexao, $query);
            
            if(mysqli_affected_rows($conexao) < 1){
                $query="DELETE FROM tb_files WHERE id={$file_id};";
                mysqli_query($conexao, $query);
            } 

        }	  

	}

?>