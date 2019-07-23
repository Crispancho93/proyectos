package universidad.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import universidad.dao.DepartamentoDAO;
import universidad.entity.Curso;
import universidad.entity.Departamento;

/**
 *
 * @author crispancho
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
            JOptionPane.showMessageDialog(null, "No se puede realizar la conexión a la base de datos: " + e.getMessage());
        }
        return conn;
    }
    
    public static void desconctar(){
        
        try {
            conn.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error al desconctar" + e.getMessage());
        }
    }
    
   
            
}   

