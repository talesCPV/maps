<!doctype html>
<html>
  <head>
    <title>Last Login</title>

  </head>
  <body>
    <?php

        include "config/conecta_mysql.inc";
        if (!$conexao)
            die ("Erro de conexão com localhost, o seguinte erro ocorreu -> ".mysql_error());

        $query = "SELECT nome, email, status, lastlg FROM tb_usuario order by lastlg desc;";
        $result = mysqli_query($conexao, $query);
        if($result->num_rows > 0){
            echo "{$result->num_rows} usuários cadastrados.<br>";
            echo "<table><tr><th>Nome</th><th>Email</th><th>Ult. Login</th><th>Status</th></tr>";
            while($r = mysqli_fetch_assoc($result)) {
                echo "<tr><td>{$r['nome']}</td><td>{$r['email']}</td><td>{$r['lastlg']}</td><td>{$r['status']}</td></tr>";
            }
            echo "</table>";
        }

        $conexao->close();

    ?>
  </body>
</html>
