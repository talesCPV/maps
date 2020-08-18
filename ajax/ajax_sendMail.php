<?php

	function smtpmailer($user, $pass, $para, $de, $de_nome, $assunto, $corpo) { 
		$mail = new PHPMailer();
		$mail->IsSMTP();		// Ativar SMTP
		$mail->SMTPDebug = 0;		// Debugar: 1 = erros e mensagens, 2 = mensagens apenas
		$mail->SMTPAuth = true;		// Autenticação ativada
		$mail->SMTPSecure = 'ssl';	// SSL REQUERIDO pelo GMail
		$mail->Host = 'thebikeinbox.com.br';	// SMTP utilizado
		$mail->Port = 465;  		// A porta 465 deverá estar aberta em seu servidor
		$mail->Username = $user;
		$mail->Password = $pass;
		$mail->SetFrom($de, $de_nome);
		$mail->Subject = $assunto;
		$mail->Body = $corpo;
		$mail->AddAddress($para);
		if(!$mail->Send()) {
			return 'Houve um erro no envio, favor tentar mais tarde: '.$mail->ErrorInfo; 
		} else {
			return true;
		}
	}



	require_once("../config/class.phpmailer.php");

	$host = "br610.hostgator.com.br"; 
	$usuario = 'cadastro@thebikeinbox.com.br';
	$senha = 'Xspider0#';

	$mensagem = $_POST["body"];
	$subject = $_POST["sub"];
	$email = $usuario;
	$fromaddr = $_POST["dest"];
	$name = 'theBikeinBox - Um novo conceito em Bike';



//	echo('usuario:'.$usuario.' senha:'.$senha.' para:'.$fromaddr.' de:'.$email. ' nome:'.$name.' assunto:'.$subject.' mss:'.$mensagem);
	smtpmailer($usuario, $senha, $fromaddr, $email, $name, $subject, $mensagem);



?>