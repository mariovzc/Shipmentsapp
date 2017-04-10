$( document ).ready(function() {
    $( "#search-package" ).submit(function( event ) {
        event.preventDefault();
        $.get( "getPackageByTrackingID/" + $("#search").val() + ".json", function( data ) {
            if(data === null){
                alert("Codigo no valido o ya entregado");
                return;
            }
            $('#trackingid').html($("#search").val());
            $('#address').html(data.address);
            $('#order_status').html(data.status);
            $('#bus').html(data.bus);
            $('#package-id').val(data.id);
            $('#package-info').removeClass('hide');
            console.log(data.status_id);
            if(data.status_id == 2){
                $(".cancel-package-button").hide();                
            }
        });
    });
    $( ".cancel-package-button" ).click(function() {
        $.ajax({
            url: 'packages/' + $('#package-id').val() + ".json",
            type: 'DELETE', //<-----this should have to be an object.
            contentType:'application/json',  // <---add this
            dataType: 'text',                // <---update this
            success: function(result) {
                alert("pedido Cancelado");
                location.reload();
            },
            error: function(result){
                alert("no se pudo borrar el pedido");
            }
        });
    });
});