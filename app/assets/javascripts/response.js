window.onload=function(){ 
    (function() {
            $(".responses.new").ready(function() {
              return setTimeout(function() {
                // return response_submit.click();
                return alert("Test dialog");
              }, 3000);
            });
          
          }).call(this);
};