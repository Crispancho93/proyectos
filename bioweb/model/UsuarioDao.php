<?php

require_once '../config/Conexion.php';
require_once '../entity/Usuario.php';
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UsuarioDao
 *
 * @author crispancho
 */
class UsuarioDao extends Conexion {

    /**
     * 
     * @param Usuario $usuario
     * @return type boolean
     */
    public function agregarUsuario(Usuario $usuario) {

        $consulta = "INSERT INTO usuario(nombre, tipo_usuario, tipo_documento, "
                . "numero_documento, direccion, telefono, correo, loguin, clave) "
                . "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";

        $statement = Conexion::getConexion()->prepare($consulta);
        $result = $statement->execute([
            $usuario->getNombre(),
            $usuario->getTipoUsuario(),
            $usuario->getTipoDocumento(),
            $usuario->getNumeroDocumento(),
            $usuario->getDireccion(),
            $usuario->getTelefono(),
            $usuario->getCorreo(),
            $usuario->getLoguin(),
            $usuario->getClave()
        ]);

        return $result;
    }

    /**
     * 
     * @param Usuario $usuario
     * @return type boolean
     */
    public function actualizarUsuario(Usuario $usuario) {

        $consulta = "UPDATE usuario\n" .
                "SET nombre = ?,\n" .
                "    tipo_usuario = ?,\n" .
                "    tipo_documento = ?,\n" .
                "    numero_documento = ?,\n" .
                "    direccion = ?,\n" .
                "    telefono = ?,\n" .
                "    correo = ?,\n" .
                "    loguin = ?,\n" .
                "    clave = ?\n" .
                "WHERE idusuario = ?;";

        $statement = Conexion::getConexion()->prepare($consulta);
        $result = $statement->execute([
            $usuario->getNombre(),
            $usuario->getTipoUsuario(),
            $usuario->getTipoDocumento(),
            $usuario->getNumeroDocumento(),
            $usuario->getDireccion(),
            $usuario->getTelefono(),
            $usuario->getCorreo(),
            $usuario->getLoguin(),
            $usuario->getClave(),
            $usuario->getIdUsuario()
        ]);
        return $result;
    }

    /**
     * 
     * @param type $id
     */
    public function eliminarUsuario($id) {

        return Conexion::getConexion()->query("DELETE FROM `usuario` WHERE (`idusuario` = $id);");
    }

    /**
     * 
     * @param Usuario $usuario
     * devuelve objeto usuario con valores en caso que exista 
     * en caso contrario devuelve NULL 
     */
    public function validarUsuario(Usuario $usuario) {

        // ejecuta query
        $statement = Conexion::getConexion()->query(
                "SELECT * FROM usuario WHERE loguin='{$usuario->getLoguin()}' AND clave='{$usuario->getClave()}'"
        );

        // ordena la consulta por numero de columna        
        $result = $statement->fetchAll(PDO::FETCH_NUM);

        foreach ($result as $row) {
            $user = new Usuario();
            $user->setTipoUsuario($row[2]);
            $user->setLoguin($row[8]);
            return $user;
        }
    }

}

function valid() {
    $user = new Usuario();
    $userDao = new UsuarioDao();

    $user->setLoguin("crispancho");
    $user->setClave("1993");

    var_dump($userDao->validarUsuario($user));
}

function del() {

    $userDao = new UsuarioDao();

    if ($userDao->eliminarUsuario(10)) {
        echo "del";
    } else {
        echo "no del";
    }
}

function add() {

    $user = new Usuario();
    $user->setNombre("julieta");
    $user->setTipoUsuario("admin");
    $user->setTipoDocumento("RC");
    $user->setNumeroDocumento("515154");
    $user->setDireccion("calle 6");
    $user->setTelefono("3008120524");
    $user->setCorreo("corr@corr");
    $user->setLoguin("juli");
    $user->setClave("2012");

    $userDao = new UsuarioDao();

    if ($userDao->agregarUsuario($user)) {
        echo 'add';
    } else {
        echo 'no add';
    }
}

function updat() {
    $user = new Usuario();
    $user->setIdUsuario(1);
    $user->setNombre("Ramón Valdés Muñoz");
    $user->setTipoUsuario("admin");
    $user->setTipoDocumento("CC");
    $user->setNumeroDocumento("15115");
    $user->setDireccion("calle 5");
    $user->setTelefono("30044484");
    $user->setCorreo("coor");
    $user->setLoguin("rmon");
    $user->setClave("rmon");

    $userDao = new UsuarioDao();

    if ($userDao->actualizarUsuario($user)) {
        echo 'up';
    } else {
        echo 'no up';
    }
}
