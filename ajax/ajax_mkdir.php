<?php

	if (IsSet($_POST["path"])){

        $path = $_POST["path"];
        mkdir($path, 0777, true);

	}

?>