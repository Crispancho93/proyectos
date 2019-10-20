<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title>administrativo</title>

        <!--iconos-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

        <!--bootstrap-->
        <link href="bootstrap/bootstrap4.1.3.min.css" rel="stylesheet" type="text/css"/>

        <!--jquery-->
        <script src="js/jquery-3.4.1.min.js" type="text/javascript"></script>

        <!-- Custom styles for this template-->
        <link href="stryle/sb-admin.css" rel="stylesheet" type="text/css"/>

        <title>Bioweb</title>
    </head>

    <body id="page-top">

        <!--menu-->
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

            <a class="navbar-brand mr-1 " href="home.php">MENÚ</a>

            <!--boton para activar menu desplegable-->
            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" >
                <!--acordeon-->
                <i class="fas fa-bars"></i>
            </button>

            <!-- separador para posicionar elementos en la esquina superior derecha-->
            <div class=" d-md-inline-block ml-auto mr-0 mr-md-3 my-2 my-md-0"></div>

            <!-- opciones esquina superior derecha -->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown no-arrow mx-1">
                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        USUARIOS <i class="fas fa-user-circle fa-fw"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                        <a class="dropdown-item" href="usuario/buscar_usuario.php">BUSCAR</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="usuario/crear_usuario.php">CREAR</a>
                    </div>
                </li> 
            </ul>
        </nav>

        <!--opciones del menú-->
        <div id="wrapper">

            <!-- Sidebar entradas -->
            <ul class="sidebar navbar-nav">
                <!--entradas-->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-truck"></i>
                        <span>ENTRADAS</span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                        <h6 class="dropdown-header">Login Screens:</h6>
                        <a class="dropdown-item" href="login.html">Login</a>
                        <a class="dropdown-item" href="register.html">Register</a>
                        <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Other Pages:</h6>
                        <a class="dropdown-item" href="404.html">404 Page</a>
                        <a class="dropdown-item" href="blank.html">Blank Page</a>
                    </div>
                </li>

            </ul>



            <div id="content-wrapper">

                <div class="container-fluid">

                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © Your Website 2019</span>
                        </div>
                    </div>
                </footer>

            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /#wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>



