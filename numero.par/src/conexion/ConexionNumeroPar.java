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
public class ConexionNumeroPar {
    
    
    private static Connection conn = null;
    
    public static Connection getConnection(){
        
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/aprendiendo?user=root&password=Colombia.123");
            System.out.println("Conexión correcta");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Conexión fallida"+e.getMessage());
        }
        
        return conn;
    }
    
    public static void desconectar(){
        
        try {
            conn.close();
        } catch (SQLException e) {
            System.out.println("No se puede desconectar"+e.getMessage());
        }
    }
    
    
}

