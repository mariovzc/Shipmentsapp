$( document ).ready(function() {
    $( "#create_fleets" ).submit(function( event ) {
        event.preventDefault();        
        var formData = JSON.parse(JSON.stringify(jQuery(this).serializeArray())); 
        var data = {
            "fleet": {
                "name": formData[0].value,
                "city_id": formData[1].value
            }
            };
    $.ajax({
        type: "POST",
        url: "/fleets.json",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(data){
            alert("Flota Creada");
            $("#create_fleets").trigger("reset");
        },
        failure: function(errMsg) {
            alert(errMsg);
        }
    });

    });
});