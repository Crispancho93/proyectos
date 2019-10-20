<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Producto
 *
 * @author crispancho
 */
class Producto {
    private $idProducto;
    private $codigo;
    private $nombre;
    private $observacion;
    
    function __construct() {
        
    }
    
    function getIdProducto() {
        return $this->idProducto;
    }

    function getCodigo() {
        return $this->codigo;
    }

    function getNombre() {
        return $this->nombre;
    }

    function getObservacion() {
        return $this->observacion;
    }

    function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    function setCodigo($codigo) {
        $this->codigo = $codigo;
    }

    function setNombre($nombre) {
        $this->nombre = $nombre;
    }

    function setObservacion($observacion) {
        $this->observacion = $observacion;
    }


}
