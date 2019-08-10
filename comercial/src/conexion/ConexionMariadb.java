/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexion;


import comercial.dao.EmpleadoDao;
import entity.Empleado;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Crispancho
 */
public class ConexionMariadb {
    
    private static Connection conn = null;
    
    
    public static Connection getConnection(){
        
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/aprendiendo?user=root&password=Colombia.123");
            System.out.println("Conexión correcta");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
        
        return conn;
    }
    
    public static void main(String[] args) {
        
        Connection conn = conexion.ConexionMariadb.getConnection();
        
        Empleado miEmpleado = new Empleado();
        miEmpleado.setNombre("julio");
        miEmpleado.setApellido("rojas");
        miEmpleado.setCedula("43545454");
        miEmpleado.setEstadoCivil("1");
        miEmpleado.setGenero("1");
        miEmpleado.setEdad(25);
        
        EmpleadoDao miDao = new EmpleadoDao();
        miDao.agregarEmpleado(conn, miEmpleado);
    }
}
