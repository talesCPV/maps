

$(document).ready(function(){
  $('#user').html(readCookie('usuario'));

//  max_ranges();


    $('#btn_menu').click(function(){ 
        if ($('.menu ul').is(':visible')) {
            $(".menu ul").css("display", "none");
        } else {
          $(".menu ul").css("display", "block");        
        }
    }); 



/*    
    $('input[type=range]').on('input', function () { // WHEN RANGE IS CHANGING

      $(this).trigger('change'); // chama a funçao change()
      $("#rng_ini").prop("value", $(this).val()) // muda o valor de outro range
      
    });
*/

});