$(document).ready(function () {

    let tabla = $('#tablaSalida').DataTable({
        "lengthMenu": [[30, 60, 90, 120, -1], [30, 60, 90, 120, "Todos"]],
        "ajax":
                {
                    type: 'POST',
                    url: "listaSalidas.jsp",
                    dataSrc: "listaSalidas",
                    dataType: 'json'
                },
        "columns": [
            {"data": "idsalida"},
            {"data": "calculo"},
            {"data": "nombreUsuario"},
            {"data": "nombreProducto"},
            {"data": "nombreResponsable"},
            {"data": "nombreCliente"},
            {"data": "nombreConductor"},
            {"data": "numeroPlaca"},
            {"data": "consecutivo"},
            {"data": "fechaHora"},
            {"data": "caneca"},
            {"data": "galon"},
            {"data": "pesoBruto"},
            {"data": "tara"},
            {"data": "pesoNeto"},
            {"data": "gradosBrix"},
            {"data": "cantidadBulto"},
            {"data": "observacion"}

        ],

        "language": {
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron resultados",
            "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sSearch": "Buscar:",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "sProcessing": "Procesando..."
        }
    });
    tabla.order([9, 'desc']).draw();

});

