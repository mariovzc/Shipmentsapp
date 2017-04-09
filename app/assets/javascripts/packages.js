$(document).ready(function(){
  $("#document").keyup(function(){
      $.get("/user/document/" + $(this).val() +".json", function(data, status){
          if(data !== null){
              console.log(data);
              $("#first_name").val(data.first_name).addClass('valid');
              $("#last_name").val(data.last_name).addClass('valid');
              $(".package-label").addClass('active');
              $("#created").val(data.id);
          }else{
              $("#first_name").val("").removeClass('valid');
              $("#last_name").val("").removeClass('valid');
              $(".package-label").removeClass('active');
              $("#created").val(0);
          }
    });
  });
});