<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Conexion
 *
 * @author Crispancho
 */
class Conexion {
    
    public function getConexion() {

        try {
            $conn = new PDO('mysql:host=localhost;dbname=bioweb', 
                    'root', 
                    'Colombia.123',
                    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES latin1") 
                    );
            
            return $conn;
            
        } catch (PDOException $e) {
            print "¡Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }
}





