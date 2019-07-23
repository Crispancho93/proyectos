package fundamentos.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.concurrent.ExecutionException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    
    private static Connection conn = null;
    private static String db = "fundamentos";
    private static String usuario = "sa";
    private static String clave = "Colombia.123";
     
    
    public static Connection getConnection(){
        
        try {
            
            Class.forName("com.microsoft.sqlserver.jdbc");
            String url = "jdbc:sqlserver://localhost:databaseName="
                    +db+";user="+usuario+";password="+clave+";"; 
            
            conn = DriverManager.getConnection(url);
            
        } catch (ClassNotFoundException e) {
            System.out.println("Eror 1 no se puede conectar a la base de datos "+ e.getMessage());
        } catch (SQLException e) {
            System.out.println("Eror 2 no se puede conectar a la base de datos "+ e.getMessage());
        } catch (Exception e){
            System.out.println("Eror 3 no se puede conectar a la base de datos "+ e.getMessage());
        } 
       
        return conn;
    }
      
    public static void main(String[] args) {
        
        PreparedStatement sentencia;
        String sql = ""; 
        
        Conexion conexion = new Conexion();
        if (conexion.getClass() != null) {
            System.out.println("Conexion establecida");
        }
    }
}