/* 
 * enviamos datos del formulario de loguin por ajax para ser validados,
 * recibiendo un json con el usuario si este existe de lo contrario un json null 
 */

$('#frmLoguin').on('submit', function (event) {
    
    event.preventDefault();
    $("#btnIniciarSesion").prop("disabled", true);
    
    // seleciona formulario
    let frmLoguin = new FormData($("#frmLoguin")[0]);
    
    
    $.ajax({
       url: "../controller/validar_usuario.php?btnIniciarSesion=1",
       type: "POST",
       data: frmLoguin,
       contentType: false,
       processData: false,
       dataType: 'json',
       
       success: function(respuesta){
            console.log(typeof(respuesta));
            console.log(respuesta);
       }
       
    });
});

