$( document ).ready(function() {
    $('#filter-packages').on('change', function() {
        $.get( "/getPackagesByStatus/" + this.value + ".json", function( data ) {
            var html = "";
            for (var i = 0; i < data.packages.length; i++) {
                html += "<tr>";
                var element = data.packages[i];
                html += "<td>"+ element.trackingid +"</td>";
                html += "<td>" + element.status + "</td>";
                if (element.address === null){
                    html += "<td> Sin Asignar </td>";
                }else{
                    html += "<td>" + element.address + "</td>";
                }

                html += "<td>" + element.date  + "</td>";
                html += "<td><a class='btn-floating blue' href='/packages/"+ element.id + "'><i class='material-icons'>explore</i></a></td>";
                html += "</tr>";
            }
            $("#packages-table").html(html);
        });
    });
});
//packages-table
