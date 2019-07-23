package fundamentos.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;



/**
 * Fundamentos
 * @author carboleda
 */

public class Conexion {
    
    private static Connection conn = null;
    private static String usuario = "system";
    private static String clave = "Colombia.123";
    private static String url = "jdbc:oracle:thin:@181.129.45.197:11521:orcl";
    
    public static Connection getConnection(){
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, usuario, clave);
            conn.setAutoCommit(false);
            System.out.println("Conexión establecida");
            
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "No se puede conectar a la base de datos" + e.getMessage());
        }
        return conn;
    }
    
    public static void desconstar(){
        try {
            conn.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error al desconctar" + ex.getMessage());
        }
    }
    
    public static void main(String args[]){
        
        Conexion conexion = new Conexion();
        
        conexion.getConnection();
    } 
}
