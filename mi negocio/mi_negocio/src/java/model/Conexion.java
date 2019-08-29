package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Crispancho
 */
public class Conexion {
    
    private static Connection conn = null;
    
    public static Connection getConnection(){
        
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mi_negocio?user=root&password=Colombia.123");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error db " + e.getMessage());
        }
        
        return conn;
    }
    
    public static void main(String[] args) {
        
        
    }
}
