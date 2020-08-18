<?php

if (IsSet($_POST["user"])){
    $user = $_POST["user"];
    include "../config/conecta_mysql.inc";
    if (!$conexao)
        die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());

    $query = "SELECT * FROM tb_files WHERE user = '{$user}' ORDER BY data DESC;";

    $result = mysqli_query($conexao, $query);

    $qtd_lin = $result->num_rows;

    if($qtd_lin > 0){
        $rows = array();
        while($r = mysqli_fetch_assoc($result)) {
            $rows[] = $r;
        }
        print json_encode($rows);

  }

  $conexao->close();

}

?>