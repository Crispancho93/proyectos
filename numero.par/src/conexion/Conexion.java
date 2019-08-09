/*
 * Numero par
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
    private static String user = "system";
    private static String password = "Colombia.123";
    private static String url = "jdbc:oracle:thin:@10.10.0.1:1521:xe";
    
    public static Connection getConnection(){
        
        try {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, user, password);
            conn.setAutoCommit(false);
            System.out.println("Conexión establecida");
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se puede conectar " + e.getMessage());
        }
        
        return conn;
    }
    
    public void desconectar(){
        
        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println("No se puede desconectar");
        }
    }
    
    
}

