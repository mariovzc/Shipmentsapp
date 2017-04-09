$( document ).ready(function() {
    $( "#search-package" ).submit(function( event ) {
        event.preventDefault();
        $.get( "getPackageByTrackingID/" + $("#search").val() + ".json", function( data ) {
            if(data === null){
                alert("Codigo no valido o ya entregado");
                return;
            }
            console.log(data);
            $('#trackingid').val($("#search").val());
            $('#address').val();
            $('#order_status').val();
            $('#bus').val();
        });
    });
});