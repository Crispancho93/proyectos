package usuario.dao;

import usuario.entity.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author Crispancho
 */
public class UsuarioDAO {
    
    private String sql;
    
    public void agregarUsuario(Connection conn, Usuario miUsuario){
        
       PreparedStatement declaracionPreparada = null;
       sql = "INSERT INTO usuario\n" +
                "(usuario, clave, nombre, las_sesion, id_tipo)\n" +
                "VALUES\n" +
                "(?,?,?,?,?)";
       
        try {
            declaracionPreparada = conn.prepareStatement(sql);
            declaracionPreparada.setString(1, miUsuario.getUsuario());
            declaracionPreparada.setString(2, miUsuario.getClave());
            declaracionPreparada.setString(3, miUsuario.getNombre());
            declaracionPreparada.setString(4, miUsuario.getLasSesion());
            declaracionPreparada.setInt(5, miUsuario.getIdTipo());
            declaracionPreparada.execute();
            System.out.println("Se se inserto correctamente el usuario");
            declaracionPreparada.close();
        } catch (SQLException e) {
            System.out.println("No se puede insertar el usuario "+ e.getMessage());
        }
    }
    
    
}
