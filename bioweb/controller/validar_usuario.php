<?php
require_once '../model/UsuarioDao.php';

session_start();

/**
 * validamos el usuario
 */
if(!empty(htmlspecialchars($_POST["btnIniciarSesion"]))){
    
    $userDao = new UsuarioDao();
    $usuario = new Usuario();
    
    $usuario->setLoguin(htmlspecialchars($_POST["loguin"]));
    $usuario->setClave(htmlspecialchars($_POST["clave"]));
    
    // se crea sesión si el usuario es diferente de null
    if($userDao->validarUsuario($usuario) != null){
        
        $userValid = $userDao->validarUsuario($usuario);
        
        $_SESSION["usuario"] = $userValid->getLoguin();
        $_SESSION["tipoUsuario"] = $userValid->getTipoUsuario();
        
        header("Location: ../view/home.php");
                
    } else {
        header("Location: ../view/index.php?userValid=0"); 
    }
    
} else {
    header("Location: ../view/index.php");  
}
