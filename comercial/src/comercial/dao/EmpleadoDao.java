package comercial.dao;

import entity.Empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JTable;

/**
 *
 * @author Crispancho
 */
public class EmpleadoDao {
    
    private String sql;
    private String mensaje = "";
    
    
    public String agregarEmpleado(Connection conn, Empleado empleado){
        
        PreparedStatement declaracionPreparada = null;
        sql = "";
        sql = "INSERT INTO empleado\n" +
                "(nombre, apellido, cedula, estado_civil, genero, edad)\n" +
                "VALUES\n" +
                "(?,?,?,?,?,?)";
        
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
        
        PreparedStatement declaracionPreparada = null;
        sql = "";
        sql = "UPDATE empleado\n" +
                "SET nombre = '?',\n" +
                "    apellido = '?',\n" +
                "    cedula = '?',\n" +
                "    estado_civil = '?',\n" +
                "    genero = '?',\n" +
                "    edad = ?\n" +
                "WHERE ID_EMPLEADO = ?";
        
        try {
          declaracionPreparada = conn.prepareStatement(sql);
          declaracionPreparada.setString(1, empleado.getNombre());
          declaracionPreparada.setString(2, empleado.getApellido());
          declaracionPreparada.setString(3, empleado.getCedula());
          declaracionPreparada.setString(4, empleado.getEstadoCivil());
          declaracionPreparada.setString(5, empleado.getGenero());
          declaracionPreparada.setInt(6, empleado.getEdad());
          declaracionPreparada.setInt(7, empleado.getIdEmpleado());
          mensaje = "empleado actualizado correctamente";
          declaracionPreparada.execute();
          declaracionPreparada.close();
        } catch (SQLException e) {
            mensaje = "No se puede actualizar el empleado DAO " + e.getMessage();
        }
        
        return mensaje;           
    }
    
    public String eliminarEmpleado(Connection conn, int idEmpleado){
        
        PreparedStatement declaracionPreparada = null;
        sql = "";
        sql = "DELETE FROM empleado\n" +
                "WHERE id_empleado = ?";
        
        try {
            declaracionPreparada = conn.prepareStatement(sql);
            declaracionPreparada.setInt(1, idEmpleado);
            mensaje = "Se elimino correctamente el empleado";
            declaracionPreparada.execute();
            declaracionPreparada.close();
        } catch (SQLException e) {
            mensaje = "No se puede eliminar el empleado DAO" + e.getMessage();
        }
        return mensaje;
    }
            
            
    public void listarEmpleado(Connection conn, JTable tabla){
        
    }
}
