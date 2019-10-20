<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Persona
 *
 * @author crispancho
 */
class Persona {

    private $idPersona;
    private $nombre;
    private $tipoPersona;
    private $tipoDocumento;
    private $numeroDocumento;
    private $direccion;
    private $telefono;
    private $correo;
    private $nombreContacto;
    private $numeroContacto;
    
    function __construct() {
        
    }

    function getIdPersona() {
        return $this->idPersona;
    }

    function getNombre() {
        return $this->nombre;
    }

    function getTipoPersona() {
        return $this->tipoPersona;
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

    function getNombreContacto() {
        return $this->nombreContacto;
    }

    function getNumeroContacto() {
        return $this->numeroContacto;
    }

    function setIdPersona($idPersona) {
        $this->idPersona = $idPersona;
    }

    function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    function setTipoPersona($tipoPersona) {
        $this->tipoPersona = $tipoPersona;
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

    function setNombreContacto($nombreContacto) {
        $this->nombreContacto = $nombreContacto;
    }

    function setNumeroContacto($numeroContacto) {
        $this->numeroContacto = $numeroContacto;
    }


}
