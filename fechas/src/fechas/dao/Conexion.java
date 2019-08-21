package fechas.dao;


import fechas.view.frmPersona;
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
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/fechas?user=root&password=Colombia.123");
            System.out.println("Conexión establecida");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("No se puede realizar la conexión");
        }
        
        return conn;
    }
    
    public static void cerrarConexion(){
        try {
            conn.close();
            System.out.println("Conexión cerrada");
        } catch (SQLException e) {
            System.out.println("No se puede desconectar de la db "+e.getMessage());
        }
    }
    
    
    public static void main(String[] args) {
        
        frmPersona miPersona = new frmPersona();
        miPersona.setVisible(true);
        
    }
}
