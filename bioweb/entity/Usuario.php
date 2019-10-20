<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Usuario
 *
 * @author crispancho
 */
class Usuario {

    private $idUsuario;
    private $nombre;
    private $tipoUsuario;
    private $tipoDocumento;
    private $numeroDocumento;
    private $direccion;
    private $telefono;
    private $correo;
    private $loguin;
    private $clave;

    function __construct() {
        
    }
    
    function getIdUsuario() {
        return $this->idUsuario;
    }

    function getNombre() {
        return $this->nombre;
    }

    function getTipoUsuario() {
        return $this->tipoUsuario;
    }

    function getTipoDocumento() {
        return $this->tipoDocumento;
    }

    function getNumeroDocumento() {
        return $this->numeroDocumento;
    }

    function getDireccion() {
        return $this->direccion;
    }

    function getTelefono() {
        return $this->telefono;
    }

    function getCorreo() {
        return $this->correo;
    }

    function getLoguin() {
        return $this->loguin;
    }

    function getClave() {
        return $this->clave;
    }

    function setIdUsuario($idUsuario) {
        $this->idUsuario = $idUsuario;
    }

    function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    function setTipoUsuario($tipoUsuario) {
        $this->tipoUsuario = $tipoUsuario;
    }

    function setTipoDocumento($tipoDocumento) {
        $this->tipoDocumento = $tipoDocumento;
    }

    function setNumeroDocumento($numeroDocumento) {
        $this->numeroDocumento = $numeroDocumento;
    }

    function setDireccion($direccion) {
        $this->direccion = $direccion;
    }

    function setTelefono($telefono) {
        $this->telefono = $telefono;
    }

    function setCorreo($correo) {
        $this->correo = $correo;
    }

    function setLoguin($loguin) {
        $this->loguin = $loguin;
    }

    function setClave($clave) {
        $this->clave = $clave;
    }


}
