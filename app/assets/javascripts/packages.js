$(document).ready(function(){
  $('.materialboxed').materialbox();
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

  $( "#update-package" ).submit(function( event ) {
    event.preventDefault();
    var formData = JSON.parse(JSON.stringify(jQuery(this).serializeArray())); 
    var data = {
      "package":{
        "raw_address" : formData[0].value,
        "order_status_id": formData[1].value,
        "bus_id": formData[2].value
      }
    };
    $.ajax({
        type: "PUT",
        url: "/packages/"+ formData[3].value +".json",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(data){
          alert("Datos Actualizados");
          location.reload();
        },
        failure: function(errMsg) {
            alert(errMsg);
        }
    });
  });
});