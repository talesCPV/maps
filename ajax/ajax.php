<?php

	if (IsSet($_POST["query"])){
		  $query = $_POST["query"];
		include "../config/conecta_mysql.inc";
        if (!$conexao)
        	die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());

		$result = mysqli_query($conexao, $query);

		$qtd_lin = $result->num_rows;

		if($qtd_lin > 0){
			
			$rows = [];
			while($r = mysqli_fetch_assoc($result)) {
				$rows[] = $r;
			}
//			print $rows;
			$resp = json_encode($rows);
			print $resp;

		}


		$conexao->close();

	}

?>