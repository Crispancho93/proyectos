package fechas.dao;

import fechas.entity.Persona;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Crispancho
 */
public class PersonaDAO {
    
    private String sql = "";
    
    public void agregarPersona(Connection conn, Persona miPersona){
        
        PreparedStatement declaracionPreparada = null;
        sql = "INSERT INTO persona\n" +
                "(nombre, numero_documento, fecha_nacimineto)\n" +
                "VALUES\n" +
                "(?, ?, ?)";
        
        try {
            declaracionPreparada = conn.prepareStatement(sql);
            declaracionPreparada.setString(1, miPersona.getNombres());
            declaracionPreparada.setString(2, miPersona.getNumeroDocumento());
            declaracionPreparada.setString(3, miPersona.getFechaHora());
            declaracionPreparada.execute();
            System.out.println("Se inserto correctamente");
            declaracionPreparada.close();
        } catch (SQLException e) {
            System.out.println("No se puede insertar la persona");
        }
    }
}
