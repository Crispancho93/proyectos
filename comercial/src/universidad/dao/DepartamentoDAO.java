package universidad.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import universidad.entity.Departamento;

/**
 *
 * @author crispancho
 */
public class DepartamentoDAO {
    
    private String mensaje;
    private PreparedStatement sentencia;
    private String sql; 
    
    public String agregarDepartamento(Connection con, Departamento dep){
        
        sentencia = null;
        sql = null;
        sql = "INSERT INTO DEPARTAMENTO\n" +
                    "(NOMBRE_DEPARTAMENTO, EDIFICIO, DESPACHO, NUM_CUERPO_DOCENTE)\n" +
                    "VALUES\n" +
                    "(?, ?, ?, ?)";
        
        try {
            
            sentencia = con.prepareStatement(sql);
            sentencia.setString(1, dep.getNombreDepartamento());
            sentencia.setString(2, dep.getEdificio());
            sentencia.setString(3, dep.getDespacho());
            sentencia.setString(4, dep.getNumCuerpoDocente());
            mensaje = "Se guardo correctamente el departamento";
            sentencia.execute();
            sentencia.close();
            
        } catch (SQLException e) {
            mensaje = "Error al insertar departamento - DAO\n" + e.getMessage();
        }
 
        return mensaje;
    }
    
    public String modificarDepartamento(Connection con, Departamento dep){
        
        sentencia = null;
        sql = null;
        sql = "UPDATE DEPARTAMENTO\n" +
                "SET NOMBRE_DEPARTAMENTO = ?,\n" +
                "    EDIFICIO = ?,\n" +
                "    DESPACHO = ?,\n" +
                "    NUM_CUERPO_DOCENTE = ?\n" +
                "WHERE ID_DEPARTAMENTO = ?";
        
        try {
            
            sentencia = con.prepareStatement(sql);
            sentencia.setString(1, dep.getNombreDepartamento());
            sentencia.setString(2, dep.getEdificio());
            sentencia.setString(3, dep.getDespacho());
            sentencia.setString(4, dep.getNumCuerpoDocente());
            sentencia.setInt(5, dep.getIdDepartamento()); 
            mensaje = "Se actualizo correctamente el departamento";
            sentencia.execute();
            sentencia.close();
                
        } catch (SQLException e) {
            mensaje = "No se pudo relizar la actualización correctamente - DAO\n" + e.getMessage();
        }
        
        return mensaje;
    }
    
    public String eliminarDeparatamento(Connection con, int id){
        
        sentencia = null;
        sql = null;
        sql = "DELETE FROM departamento\n" +
                "WHERE ID_DEPARTAMENTO = ?";
        
        try {
            
            sentencia = con.prepareStatement(sql);
            sentencia.setInt(1, id);
            mensaje = "Se elimino correctamente el departamento";
            sentencia.execute();
            sentencia.close();
            
        } catch (SQLException e) {
            mensaje = "No se elimino el departamento - DAO";
        }
        
        return mensaje;
    }
    
    public void listarDeparatamento(Connection con, JTable tabla){
        
        DefaultTableModel model;
        String [] columnas = {"ID_DEPARTAMENTO", "NOMBRE_DEPARTAMENTO", "EDIFICIO", "DESPACHO", "NUM_CUERPO_DOCENTE"};
        model = new DefaultTableModel(null ,columnas);
        
        sql = "SELECT\n" +
                "    *   \n" +
                "FROM DEPARTAMENTO ORDER BY nombre_departamento";
        
        String [] filas = new String[5];
        Statement declaracion = null;
        ResultSet resultado = null;
        
        try {
            declaracion = con.createStatement();
            resultado = declaracion.executeQuery(sql);
            while (resultado.next()) {                
                for (int i = 0; i < 5; i++) {
                    filas[i] = resultado.getString(i+1);
                }
                model.addRow(filas);
            }
            
            tabla.setModel(model);
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "No se puede mostrar la tabla");
        }
    }
}
