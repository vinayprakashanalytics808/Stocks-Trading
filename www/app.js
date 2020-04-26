// Background colour of the application
$(document).on("shiny:value", function(e) {

  if (e.name == "display") { 

    setInterval(function(){

      $("#display th").each(function () {

        if ($(this).text() == "date"){

          console.log($("check").text()); 

          $(this).text("Date")

        }
        
        if ($(this).text() == "symbol"){

          console.log($("check").text()); 

          $(this).text("Symbol")

        }
        
           if ($(this).text() == "open"){

          console.log($("check").text()); 

          $(this).text("Open")

        }
        
           if ($(this).text() == "low"){

          console.log($("check").text()); 

          $(this).text("Low")

        }
        
           if ($(this).text() == "close"){

          console.log($("check").text()); 

          $(this).text("Close")

        }
        
         if ($(this).text() == "high"){

          console.log($("check").text()); 

          $(this).text("High")

        }
      });

    },100);

  }

});

 