<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Entrada
 *
 * @author crispancho
 */
class Entrada {

    private $idEntrada;
    private $usuarioSistema;
    private $idProducto;
    private $responsable;
    private $proveedor;
    private $ruta;
    private $conductor;
    private $consecutivo;
    private $fechaHora;
    private $caneca;
    private $galon;
    private $kgRemisionado;
    private $kgPlanta;
    private $diferencia;
    private $productoMalo;
    private $perdidaPesoSegundoProceso;
    private $pesoNeto;
    private $observacion;
    private $numeroPlaca;
    
    
    function __construct() {
        
    }

    function getIdEntrada() {
        return $this->idEntrada;
    }

    function getUsuarioSistema() {
        return $this->usuarioSistema;
    }

    function getIdProducto() {
        return $this->idProducto;
    }

    function getResponsable() {
        return $this->responsable;
    }

    function getProveedor() {
        return $this->proveedor;
    }

    function getRuta() {
        return $this->ruta;
    }

    function getConductor() {
        return $this->conductor;
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

    function getKgRemisionado() {
        return $this->kgRemisionado;
    }

    function getKgPlanta() {
        return $this->kgPlanta;
    }

    function getDiferencia() {
        return $this->diferencia;
    }

    function getProductoMalo() {
        return $this->productoMalo;
    }

    function getPerdidaPesoSegundoProceso() {
        return $this->perdidaPesoSegundoProceso;
    }

    function getPesoNeto() {
        return $this->pesoNeto;
    }

    function getObservacion() {
        return $this->observacion;
    }

    function getNumeroPlaca() {
        return $this->numeroPlaca;
    }

    function setIdEntrada($idEntrada) {
        $this->idEntrada = $idEntrada;
    }

    function setUsuarioSistema($usuarioSistema) {
        $this->usuarioSistema = $usuarioSistema;
    }

    function setIdProducto($idProducto) {
        $this->idProducto = $idProducto;
    }

    function setResponsable($responsable) {
        $this->responsable = $responsable;
    }

    function setProveedor($proveedor) {
        $this->proveedor = $proveedor;
    }

    function setRuta($ruta) {
        $this->ruta = $ruta;
    }

    function setConductor($conductor) {
        $this->conductor = $conductor;
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

    function setKgRemisionado($kgRemisionado) {
        $this->kgRemisionado = $kgRemisionado;
    }

    function setKgPlanta($kgPlanta) {
        $this->kgPlanta = $kgPlanta;
    }

    function setDiferencia($diferencia) {
        $this->diferencia = $diferencia;
    }

    function setProductoMalo($productoMalo) {
        $this->productoMalo = $productoMalo;
    }

    function setPerdidaPesoSegundoProceso($perdidaPesoSegundoProceso) {
        $this->perdidaPesoSegundoProceso = $perdidaPesoSegundoProceso;
    }

    function setPesoNeto($pesoNeto) {
        $this->pesoNeto = $pesoNeto;
    }

    function setObservacion($observacion) {
        $this->observacion = $observacion;
    }

    function setNumeroPlaca($numeroPlaca) {
        $this->numeroPlaca = $numeroPlaca;
    }


}
