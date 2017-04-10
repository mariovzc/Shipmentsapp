$( document ).ready(function() {
    $('select').material_select();
    $( "#create_bus" ).submit(function( event ) {
        event.preventDefault();        
        var formData = JSON.parse(JSON.stringify(jQuery(this).serializeArray())); 
        var data = {
            "bus": {
                "license_plate": formData[0].value,
                "fleet_id": formData[1].value
            }
            };
    $.ajax({
        type: "POST",
        url: "/bus.json",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function(data){
            alert("Bus Creado");
            $("#create_bus").trigger("reset");
            location.reload();
        },
        failure: function(errMsg) {
            alert(errMsg);
        }
    });

    });
});