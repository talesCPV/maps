<!DOCTYPE HTML>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css"  href="css/login.css" />
    <link rel="stylesheet" type="text/css"  href="css/popup.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="js/login.js"></script>
    <link rel="icon" type="image/png" href="img/small_logo.png" />
</head>
<body>
  <div class="login-background">
    <div class="form login-page">
        <p> <a href="https://www.thebikeinbox.com.br"><img src="img/logo_thebikeinbox.png"></a></p> <br>
        <input type="text" id="edtUser" placeholder="usuário" name="user" />
        <input type="password" id="edtPass" placeholder="senha" name="pass" />
        <button id="btn_login">login</button>
        <br><br>
        <p><a id="btn_esq_senha">esqueci minha senha</a> 
          |<a id="btn_novousuario"> novo usuário</a>
          |<a id="btn_disclamer"> disclamer</a>
        </p>
    </div>
  </div>

  <div class="overlay"> 
    <div class="popup">
      <h2 id="popTitle"></h2>
      <div class="close" >&times</div>
      <div class="content"></div>
    </div>
  </div>

</body>
</html>