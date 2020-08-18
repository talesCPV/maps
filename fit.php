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

      // get size of the binary file  
//      $file = 'fit/20180110.fit';
//      $file = 'fit/5123255984.fit';
      $file = 'fit/4546136108.fit';
//      $file = 'fit/5118715405.fit';
      $filesize = filesize($file);
      // open file for reading in binary mode
      $fp = fopen($file, 'rb');
      // read the entire file into a binary string
      $binary = fread($fp, $filesize);
      // finally close the file
      fclose($fp);
      // unpack the data - notice that we create a format code using 'C%d'
      // that will unpack the size of the file in unsigned chars
      $unpacked = unpack(sprintf('C%d', $filesize), $binary);

      // reset array keys
      $unpacked = array_values($unpacked);

      $razao = 23;
      $fim = 'EF'; // quebra a linha
      $cont = 0;
      echo'<table><tr>';
      for ($i = 0; $i < sizeof($unpacked); $i++) {
        $cont += 1;
        $val = dectohex($unpacked[$i]);
        print '<td>' . $val . '</td>';
//        print ' ' . str_pad($unpacked[$i] , 3 , '0' , STR_PAD_LEFT) ;
        if($cont >= $razao || $val == $fim ){
          print '</tr><tr>';
          $cont=0;
        }        
      }
      echo'</tr></table>';

    ?>
  </body>
</html>
