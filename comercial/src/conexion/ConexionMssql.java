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
public class ConexionMssql {
    
    private static Connection conn = null;
    
    public static Connection getConnection(){
        
        try {
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=aprendiendo", "sa", "Colombia.123");
            System.out.println("Conexion correcta");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se puede conectar "+e.getMessage());
        }
        
        return conn;
    }
    
    
    
}
