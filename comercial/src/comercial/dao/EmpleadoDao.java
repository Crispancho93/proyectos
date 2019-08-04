package comercial.dao;

import entity.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Crispancho
 */
public class EmpleadoDao {
    
    private String sql;
    private String mensaje = "";
    
    
    public String agregarEmpleado(Connection conn, Empleado empleado){
        
        PreparedStatement declaracionPreparada = null;
        sql = "INSERT INTO empleado\n" +
                "(nombre, apellido, cedula, estado_civil, genero, edad)\n" +
                "VALUES\n" +
                "(?,?,?,?,?,?);";
        
        try {
            
            declaracionPreparada = conn.prepareStatement(sql);
            declaracionPreparada.setString(1, empleado.getNombre());
            declaracionPreparada.setString(2, empleado.getApellido());
            declaracionPreparada.setString(3, empleado.getCedula());
            declaracionPreparada.setString(4, empleado.getEstadoCivil());
            declaracionPreparada.setString(5, empleado.getGenero());
            declaracionPreparada.setInt(6, empleado.getEdad());
            mensaje = "Empleado guardado correctamente";
            declaracionPreparada.execute();
            declaracionPreparada.close();
                    
        } catch (SQLException e) {
            mensaje = "No se puede guardar el empleado DAO\n" + e.getMessage();
        }
        
        return mensaje;
    }
    
    public String modificarEmpleado(Connection conn, Empleado empleado){
        return mensaje;           
    }
    
    public String eliminarEmpleado(Connection conn, int idEmpleado){
        return mensaje;
    }
            
            
    public void listarEmpleado(){
        
    }
}
