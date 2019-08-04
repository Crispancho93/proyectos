/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Crispancho
 */
public class Empleado {
    
    private int idEmpleado;
    private String nombre;
    private String apellido;
    private String cedula;
    private String estadoCivil;
    private String genero;
    private int edad;
    
    public Empleado(){
        
    }
    
    public Empleado(int idEmpleado,String nombre, String apellido, String cedula, 
            String estadoCivil, String genero, int edad){
        
        this.idEmpleado = idEmpleado;
        this.nombre = nombre;
        this.apellido = apellido;
        this.cedula = cedula;
        this.estadoCivil = estadoCivil;
        this.genero = genero;
        this.edad = edad;
    }
    
    
    public int getIdEmpleado(){
        return idEmpleado;
    }
    
    public void setIdEmpleado(int idEmpleado){
        this.idEmpleado = idEmpleado;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    
    public String getApellido(){
        return apellido;
    }
    
    public void setApellido(String apellido){
        this.apellido = apellido;
    }
    
    public String getCedula(){
        return cedula;
    }
    
    public void setCedula(String cedula){
        this.cedula = cedula;
    }
    
    public String getEstadoCivil(){
        return estadoCivil;
    }
    
    public void setEstadoCivil(String estadoCivil){
        this.estadoCivil = estadoCivil;
    }
    
    public String getGenero(){
        return genero;
    }

    public void setGenero(String genero){
        this.genero = genero;
    }
    
    public int getEdad(){
        return edad;
    }
    
    public void setEdad(int edad){
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "Empleado{" + "idEmpleado=" + idEmpleado + ", nombre=" + nombre + ", apellido=" + apellido + ", cedula=" + cedula + ", estadoCivil=" + estadoCivil + ", genero=" + genero + ", edad=" + edad + '}';
    }
    
    
    
}
