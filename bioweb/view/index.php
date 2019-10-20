
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset=iso-8859-1>

        <!--iconos-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <!--estilos-->
        <link href="stryle/loguin.css" rel="stylesheet" type="text/css"/>

        <!--bootstrap-->
        <link href="bootstrap/bootstrap4.1.3.min.css" rel="stylesheet" type="text/css"/>


        <title>Bioweb</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">

                            <!--logo-->
                            <center><img  style="width: 280px;" class="rounded mb-5" src="../files/biologo.png"/></center>
                            <form id="frmLoguin" class="form-signin" method="POST" action="../controller/validar_usuario.php">

                                <!--usuario-->
                                <div class="form-label-group">
                                    <input type="text" id="loguin" name="loguin" class="form-control" placeholder="Usuario" required autofocus>
                                    <label for="loguin">Usuario</label>
                                </div>

                                <!--clave-->
                                <div class="form-label-group">
                                    <input type="password" id="clave" name="clave" class="form-control" placeholder="clave" required>
                                    <label for="clave">Clave</label>
                                </div>

                                <!--botones-->
                                <button class="btn btn-lg btn-primary btn-block" type="submit" name="btnIniciarSesion" value="1"><i class="fas fa-sign-in-alt"></i> Iniciar sesión</button>
                                <hr class="my-4">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- JS dependencies -->
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="bootstrap/popper.min.js" type="text/javascript"></script>
        <script src="bootstrap/bootstrap4.1.3.min.js" type="text/javascript"></script>

        <!-- bootbox code -->
        <script src="js/bootbox.min.js" type="text/javascript"></script>
        <script src="js/bootbox.locales.min.js" type="text/javascript"></script>


        <?php
        // si esta definida es por que el usuario no existe en la db
        if (isset($_GET["userValid"])) {
            ?>

            <script type="text/javascript">

                bootbox.alert({
                    message: "Datos incorrectos",
                    backdrop: true
                });

            </script>

            <?php
        }
        ?>

    </body>
</html>
