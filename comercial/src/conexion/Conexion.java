/*
 * Proyecto comercial
 */
package conexion;

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
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=test", "sa", "Colombia.123");
            System.out.println("Conexion correcta");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se puede conectar "+e.getMessage());
        }
        
        return conn;
    }
    
    public static void main(String[] args) {
        
        conexion.Conexion.getConnection();
    }
}
