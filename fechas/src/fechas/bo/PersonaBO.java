package fechas.bo;


import java.sql.Connection;
import fechas.entity.Persona;
import fechas.dao.*;
/**
 *
 * @author Crispancho
 */
public class PersonaBO {
    
    private Connection conn = null;
    
    public void agregarPersona(Persona miPersona){
        
        System.out.println(miPersona);
        conn = Conexion.getConnection();
        PersonaDAO miDao = new PersonaDAO();
        
        miDao.agregarPersona(conn, miPersona);
    }
}
