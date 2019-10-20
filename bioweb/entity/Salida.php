<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Salida
 *
 * @author crispancho
 */
class Salida {

    private $idSalida;
    private $usuarioSistema;
    private $loguin;
    private $idProducto;
    private $nombreProducto;
    private $responsable;
    private $nombreResponsable;
    private $cliente;
    private $nombreCliente;
    private $conductor;
    private $nombreConductor;
    private $numeroPlaca;
    private $consecutivo;
    private $fechaHora;
    private $caneca;
    private $galon;
    private $pesoBruto;
    private $tara;
    private $pesoNeto;
    private $gradosBrix;
    private $cantidadBulto;
    private $observacion;
    
    function __construct() {
        
    }

    function getIdSalida() {
        return $this->idSalida;
    }

    function getUsuarioSistema() {
        return $this->usuarioSistema;
    }

    function getLoguin() {
        return $this->loguin;
    }

    function getIdProducto() {
        return $this->idProducto;
    }

    function getNombreProducto() {
        return $this->nombreProducto;
    }

    function getResponsable() {
        return $this->responsable;
    }

    function getNombreResponsable() {
        return $this->nombreResponsable;
    }

    function getCliente() {
        return $this->cliente;
    }

    function getNombreCliente() {
        return $this->nombreCliente;
    }

    function getConductor() {
        return $this->conductor;
    }

    function getNombreConductor() {
        return $this->nombreConductor;
    }

    function getNumeroPlaca() {
        return $this->numeroPlaca;
    }

    function getConsecutivo() {
        return $this->consecutivo;
    }

    function getFechaHora() {
        return $this->fechaHora;
    }

    function getCaneca() {
        return $this->caneca;
    }

    function getGalon() {
        return $this->galon;
    }

    function getPesoBruto() {
        return $this->pesoBruto;
    }

    function getTara() {
        return $this->tara;
    }

    function getPesoNeto() {
        return $this->pesoNeto;
    }

    function getGradosBrix() {
        return $this->gradosBrix;
    }

    function getCantidadBulto() {
        return $this->cantidadBulto;
    }

    function getObservacion() {
        return $this->observacion;
    }

    function setIdSalida($idSalida) {
        $this->idSalida = $idSalida;
    }

    function setUsuarioSistema($usuarioSistema) {
        $this->usuarioSistema = $usuarioSistema;
    }

    function setLoguin($loguin) {
        $this->loguin = $loguin;
    }

    function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    function setNombreProducto($nombreProducto) {
        $this->nombreProducto = $nombreProducto;
    }

    function setResponsable($responsable) {
        $this->responsable = $responsable;
    }

    function setNombreResponsable($nombreResponsable) {
        $this->nombreResponsable = $nombreResponsable;
    }

    function setCliente($cliente) {
        $this->cliente = $cliente;
    }

    function setNombreCliente($nombreCliente) {
        $this->nombreCliente = $nombreCliente;
    }

    function setConductor($conductor) {
        $this->conductor = $conductor;
    }

    function setNombreConductor($nombreConductor) {
        $this->nombreConductor = $nombreConductor;
    }

    function setNumeroPlaca($numeroPlaca) {
        $this->numeroPlaca = $numeroPlaca;
    }

    function setConsecutivo($consecutivo) {
        $this->consecutivo = $consecutivo;
    }

    function setFechaHora($fechaHora) {
        $this->fechaHora = $fechaHora;
    }

    function setCaneca($caneca) {
        $this->caneca = $caneca;
    }

    function setGalon($galon) {
        $this->galon = $galon;
    }

    function setPesoBruto($pesoBruto) {
        $this->pesoBruto = $pesoBruto;
    }

    function setTara($tara) {
        $this->tara = $tara;
    }

    function setPesoNeto($pesoNeto) {
        $this->pesoNeto = $pesoNeto;
    }

    function setGradosBrix($gradosBrix) {
        $this->gradosBrix = $gradosBrix;
    }

    function setCantidadBulto($cantidadBulto) {
        $this->cantidadBulto = $cantidadBulto;
    }

    function setObservacion($observacion) {
        $this->observacion = $observacion;
    }


}
