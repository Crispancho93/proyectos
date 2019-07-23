package universidad.bo;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import universidad.dao.DepartamentoDAO;
import universidad.db.Conexion;
import universidad.entity.Departamento;

/**
 *
 * @author crispancho
 */
public class DepartamentoBO {
    
    private String mensaje = "";
    private DepartamentoDAO depDAO = new DepartamentoDAO() ;
    private Connection conn = Conexion.getConnection();
    
    
    public String agregarDepartamento(Departamento dep){
        
        try {
            mensaje = depDAO.agregarDepartamento(conn, dep);
           
        } catch (Exception e) {
            
            mensaje = mensaje + "No se puede agregar un departamento - BO" + e.getMessage();  
        } finally{
            
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                mensaje = mensaje + " Conexión de departamento NULL - BO" + e.getMessage();
            }
            
        }
        
        return mensaje;
    }
    
    public String modificarDepartamento(Departamento dep){
        
        try {
            mensaje = depDAO.modificarDepartamento(conn, dep);
            
        } catch (Exception e) {
            mensaje = "No se puede modificar el departamento - BO " + e.getMessage();
            System.out.println(mensaje);
        } finally{
            
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                mensaje = "No se puede modificar el departamento - BO - finnaly" + e.getMessage();
            }
        }
        
        return mensaje;
    }
    
    public String eliminarDeparatamento(int id){
        
        try {
            mensaje = depDAO.eliminarDeparatamento(conn, id);
            
        } catch (Exception e) {
            mensaje = "No se pudo eliminar el departamento BO";
        } finally{
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                mensaje = "No se pudo eliminar el departamento - BO - finally";
            }
        }
        return mensaje;
    }
    
    public void listarDeparatamento(JTable tabla){
        
        depDAO.listarDeparatamento(conn, tabla);
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
