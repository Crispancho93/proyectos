
package usuario.bo;

import java.sql.Connection;
import java.sql.SQLException;
import usuario.dao.*;
import usuario.entity.Usuario;

/**
 *
 * @author Crispancho
 */
public class UsuarioBO extends UsuarioDAO{
    
    private Connection conn = null;
    
    
    public void agregarUsuario(Usuario miUsuario){
        
        
        conn = Conexion.getConnection();
        agregarUsuario(conn, miUsuario);
        
        try {
            conn.close();
        } catch (SQLException e) {
        }
        
    }
}
