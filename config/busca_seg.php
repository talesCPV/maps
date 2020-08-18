<?php

//    include 'refresh_ranking.php';

	if (IsSet($_POST["path"])){
        $path = $_POST["path"];

        include "conecta_mysql.inc";
        if (!$conexao)
            die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());

        $query="SELECT seg.id, seg.nome, fil.id as id_file, usr.id as id_user  
        FROM tb_segmento AS seg 
        INNER JOIN tb_files AS fil
        INNER JOIN tb_usuario AS usr
        ON seg.lat_ini <= fil.lat_max AND seg.lat_ini >= fil.lat_min 
        AND seg.lon_ini <= fil.lon_max AND seg.lon_ini >= fil.lon_min 
        AND usr.user = fil.user
        AND fil.file_name = '{$path}';";  

        $result = mysqli_query($conexao, $query);
		$qtd_lin = $result->num_rows;
		if($qtd_lin > 0){
			
			$rows = array();
			while($r = mysqli_fetch_assoc($result)) {
                $tm = getTime($r['id_file'],$r['id'],$path);
                print ($tm."<br>");
                
                //$rows[] = $r;

			}
		}    

        $conexao->close();
    }
?>