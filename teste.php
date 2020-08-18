<!doctype html>
<html>
  <head>
    <title>BINARIO</title>

  </head>
  <body>
    <?php

      function hexa($number){
        $resp = $number;
        switch ($number) {
          case 10:
            $resp='A';
            break;
          case 11:
            $resp='B';
            break;
          case 12:
            $resp='C';
            break;
          case 13:
            $resp='D';
            break;
          case 14:
            $resp='E';
            break;
          case 15:
            $resp='F';
            break;
        }
        return $resp;
      }

      function dectohex($number){
        $B = hexa($number % 16);
        $A = hexa(intdiv($number,16));
        return $A.$B;
      }

//      echo strtotime('2012-03-27 18:47:00'); //2020-06-20T09:58:22.000Z
      echo strtotime('2020-06-20T09:58:22.000Z'); //

    ?>

      <form class='estilo' action='config/getAppFile.php?user=tales' method='post' enctype='multipart/form-data'>
          <input type='file' name='arquivo' id='arquivo' accept='.gpx'><br>
          <button class='center_buttons' type='submit' > UPLOAD </button>
      </form>

  </body>
</html>
