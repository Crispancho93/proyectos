package model;


import java.sql.PreparedStatement;
import java.sql.SQLException;
import entity.Persona;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Crispancho
 */
public class PersonaDAO extends Conexion{

    private PreparedStatement declaracionPreparada;
    private ResultSet resultado;
    private String consultaPersonaDAO;
    private ArrayList<Persona> listaPersona = new ArrayList<Persona>();

    /**
     * 
     * @param miPersona
     * @return 
     */
    public boolean agregarPersona(Persona miPersona){
        
        consultaPersonaDAO = "";
        consultaPersonaDAO = "INSERT INTO persona\n" +
        "(nombre, tipo_persona, tipo_documento, numero_documento, direccion, telefono, correo, nombre_contacto, telefono_contacto)\n" +
        "VALUES\n" +
        "(?,?,?,?,?,?,?,?,?)";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaPersonaDAO);
            declaracionPreparada.setString(1, miPersona.getNombre());
            declaracionPreparada.setString(2, miPersona.getTipoPersona());
            declaracionPreparada.setString(3, miPersona.getTipoDocumento());
            declaracionPreparada.setString(4, miPersona.getNumeroDocumento());
            declaracionPreparada.setString(5, miPersona.getDireccion());
            declaracionPreparada.setString(6, miPersona.getTelefono());
            declaracionPreparada.setString(7, miPersona.getCorreo());
            declaracionPreparada.setString(8, miPersona.getNombreContacto());
            declaracionPreparada.setString(9, miPersona.getNumeroContacto());
            declaracionPreparada.execute();
            declaracionPreparada.close();
            cerrarConexion();
            return true;
        } catch (SQLException e) {
            cerrarConexion();
            return false;
        }
    }
    
    /**
     * 
     * @param miPersona
     * @return 
     */
    public boolean actualizarPersona(Persona miPersona){
        
        consultaPersonaDAO = "";
        consultaPersonaDAO = "UPDATE persona\n" +
        "SET nombre = ?,\n" +
        "    tipo_persona = ?,\n" +
        "    tipo_documento = ?,\n" +
        "    numero_documento = ?,\n" +
        "    direccion = ?,\n" +
        "    telefono = ?,\n" +
        "    correo = ?,\n" +
        "    nombre_contacto = ?,\n" +
        "    telefono_contacto = ?\n" + 
        "WHERE idpersona = ?";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaPersonaDAO);
            declaracionPreparada.setString(1, miPersona.getNombre());
            declaracionPreparada.setString(2, miPersona.getTipoPersona());
            declaracionPreparada.setString(3, miPersona.getTipoDocumento());
            declaracionPreparada.setString(4, miPersona.getNumeroDocumento());
            declaracionPreparada.setString(5, miPersona.getDireccion());
            declaracionPreparada.setString(6, miPersona.getTelefono());
            declaracionPreparada.setString(7, miPersona.getCorreo());
            declaracionPreparada.setString(8, miPersona.getNombreContacto());
            declaracionPreparada.setString(9, miPersona.getNumeroContacto());
            declaracionPreparada.setInt(10, miPersona.getIdPersona());
            declaracionPreparada.execute();
            declaracionPreparada.close();
            cerrarConexion();
            return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            cerrarConexion();
            return false;
        } 
    }
    
    /**
     * 
     * @param miPersona
     * @return 
     */
    public boolean eliminarPersona(Persona miPersona){
    
        consultaPersonaDAO = "";
        consultaPersonaDAO = "DELETE FROM `persona` WHERE (`idpersona` = ?)";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaPersonaDAO);
            declaracionPreparada.setInt(1, miPersona.getIdPersona());
            declaracionPreparada.execute();
            declaracionPreparada.close();
            cerrarConexion();
            return true;
        } catch (SQLException e) {
            cerrarConexion();
            return false;
        }
        
    }
    
   /**
    * 
    * @param tipoPersona
    * @return 
    */
   public ArrayList<Persona> buscarPersona(String tipoPersona){
        
       listaPersona.clear();
       consultaPersonaDAO = "";
       consultaPersonaDAO = "SELECT * FROM persona WHERE tipo_persona= ? ORDER BY nombre ASC";
        
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaPersonaDAO);
            declaracionPreparada.setString(1, tipoPersona);
            resultado = declaracionPreparada.executeQuery();
            
            
            // recorre la tabla mientras hallan registros
            while (resultado.next()) {     

                listaPersona.add(new Persona(resultado.getInt(1), resultado.getString(2), resultado.getString(3), resultado.getString(4), resultado.getString(5), resultado.getString(6), resultado.getString(7), resultado.getString(8), resultado.getString(9), resultado.getString(10)));
            }
            
            
            resultado.close();
            declaracionPreparada.close();
            cerrarConexion();
            return listaPersona;
            
        } catch (SQLException e) {
            cerrarConexion();
            
        }
        return listaPersona;
    }
   
   /**
    * 
    * @param idPersona
    * @return 
    * busca una persona por el id
    */
   public ArrayList<Persona> buscarUnaPersona(String idPersona){
       
       
       listaPersona.clear();
       consultaPersonaDAO = "";
       consultaPersonaDAO = "SELECT * FROM persona WHERE idpersona = ?";
       Persona miPersona = new Persona();
       miPersona.setIdPersona(Integer.valueOf(idPersona));
       
       try {
           
           declaracionPreparada = getConnection().prepareStatement(consultaPersonaDAO);
           declaracionPreparada.setInt(1, miPersona.getIdPersona());
           resultado = declaracionPreparada.executeQuery();
           
           // recorro hasta la tabla, buscando el registro
           while (resultado.next()) {               
               // guardo la persona para devolverlo
                listaPersona.add(new Persona(resultado.getInt(1), resultado.getString(2), resultado.getString(3), resultado.getString(4), resultado.getString(5), resultado.getString(6), resultado.getString(7), resultado.getString(8), resultado.getString(9), resultado.getString(10)));
           }
           
           declaracionPreparada.close();
           resultado.close();
           cerrarConexion();
           
           return listaPersona;
       } catch (SQLException e) {
           cerrarConexion();
       }
       
       return listaPersona;
   }
}
