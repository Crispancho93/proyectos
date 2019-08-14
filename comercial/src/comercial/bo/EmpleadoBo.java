package comercial.bo;

import entity.Empleado;
import comercial.dao.EmpleadoDao;
import java.sql.Connection;
import conexion.ConexionMssql;
import javax.swing.JTable;
/**
 *
 * @author Crispancho
 */
public class EmpleadoBo {
    
    private String mensaje = "";
    private EmpleadoDao miEmpleadoDao = new EmpleadoDao();
    private Connection conn = conexion.ConexionMariadb.getConnection();
    
    public String agregarEmpleado(Empleado empleado){
        
        
        
        try {
           mensaje =  miEmpleadoDao.agregarEmpleado(conn, empleado);
        } catch (Exception e) {
            mensaje = "No se puede ejecutar Agregar Empleado BO" + e.getMessage();
        }
        return mensaje;
    }
    
    public String modificarEmpleado(Empleado empleado){
        return mensaje;
    }
    
    public String eliminarEmpleado(int idEmpleado){
        return mensaje;
    }
    
    public void listarEmpleado(JTable tabla){
        
        miEmpleadoDao.listarEmpleado(conn, tabla);
        try {
            
            miEmpleadoDao.desconectar();
        } catch (Exception e) {
        }
    }
    
}
