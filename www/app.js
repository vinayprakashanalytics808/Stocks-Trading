// Background colour of the application

$(function() {

    $("#button").click(function(){


        setTimeout(function(){
          $("#display th").each(function () {
            if ($(this).text() == "date"){
              console.log($(this).text()); 
              $(this).text("Date")
            }
          });

        },100);
    });
});