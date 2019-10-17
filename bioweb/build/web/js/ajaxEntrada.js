$(document).ready(function () {


    let tabla = $('#tablaEntrada').DataTable({
        "lengthMenu": [[30, 60, 90, 120, -1], [30, 60, 90, 120, "Todos"]],
        "ajax":
                {
                    type: 'POST',
                    url: "entradaLista.jsp",
                    dataSrc: "listaEntradas",
                    dataType: 'json'

                },
        "columns": [
            {"data": "identrada"},
            {"data": "calcular"},
            {"data": "loguin"},
            {"data": "producto"},
            {"data": "responsable"},
            {"data": "proveedor"},
            {"data": "ruta"},
            {"data": "conductor"},
            {"data": "placa"},
            {"data": "consecutivo"},
            {"data": "fecha"},
            {"data": "caneca"},
            {"data": "galon"},
            {"data": "remisionado"},
            {"data": "planta"},
            {"data": "diferencia"},
            {"data": "malo"},
            {"data": "perdida"},
            {"data": "neto"},
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
    tabla.order([10, 'desc']).draw();

});

