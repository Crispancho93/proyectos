package model;

import entity.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Crispancho
 */
public class UsuarioDAO extends Conexion{
    
    private ArrayList<String> usuario = new ArrayList<String>();
    private ArrayList<Usuario> listaUsuario = new ArrayList<Usuario>();
    private PreparedStatement declaracionPreparada;
    private ResultSet resultado;
    private String consultaUsuario;
    
    /* 
    * este metodo retorna el registro, si el usuario y clave son iguales 
    * si no existe retorna vacio
    */ 
    public ArrayList<String> validarUsuario(Usuario miUsuario){
        
        try {
            declaracionPreparada = getConnection().prepareStatement("SELECT * FROM USUARIO WHERE LOGUIN=? AND CLAVE=?");
            declaracionPreparada.setString(1, miUsuario.getLoguin());
            declaracionPreparada.setString(2, miUsuario.getClave());
            resultado = declaracionPreparada.executeQuery();
            
            // si ingresa al bucle, es por que trajo un registro 
            while (resultado.next()) {  
                
                // agrega tipo de usuario; loguin y clave al arreglo 
                usuario.add(resultado.getString(3));
                usuario.add(resultado.getString(9));
                usuario.add(resultado.getString(10));
                
            }
            
            // cierro 
            resultado.close();                       
            declaracionPreparada.close();
            cerrarConexion();
            return usuario;
            
        } catch (SQLException e) {
            return usuario;
        }
        
    }
    
    /*
    * agrega un usuario
    */
    public boolean agregarUsuario(Usuario miUsuario){
        
        consultaUsuario = "";
        consultaUsuario = "INSERT INTO usuario\n" +
        "(nombre, tipo_usuario, tipo_documento, numero_documento, direccion, telefono, correo, loguin, clave)\n" +
        "VALUES\n" +
        "(?,?,?,?,?,?,?,?,?);";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaUsuario);
            declaracionPreparada.setString(1, miUsuario.getNombre());
            declaracionPreparada.setString(2, miUsuario.getTipoUsuario());
            declaracionPreparada.setString(3, miUsuario.getTipoDocumento());
            declaracionPreparada.setString(4, miUsuario.getNumeroDocumento());
            declaracionPreparada.setString(5, miUsuario.getDireccion());
            declaracionPreparada.setString(6, miUsuario.getTelefono());
            declaracionPreparada.setString(7, miUsuario.getCorreo());
            declaracionPreparada.setString(8, miUsuario.getLoguin());
            declaracionPreparada.setString(9, miUsuario.getClave());
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
    
    /*
    * actualiza un usuario
    */
    public boolean actualizarUsuario(Usuario miUsuario){
        
        consultaUsuario = "";
        consultaUsuario = "UPDATE usuario\n" +
        "SET nombre = ?,\n" +
        "    tipo_usuario = ?,\n" +
        "    tipo_documento = ?,\n" +
        "    numero_documento = ?,\n" +
        "    direccion = ?,\n" +
        "    telefono = ?,\n" +
        "    correo = ?,\n" +
        "    loguin = ?,\n" +
        "    clave = ?\n" +
        "WHERE idusuario = ?";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaUsuario);
            declaracionPreparada.setString(1, miUsuario.getNombre());
            declaracionPreparada.setString(2, miUsuario.getTipoUsuario());
            declaracionPreparada.setString(3, miUsuario.getTipoDocumento());
            declaracionPreparada.setString(4, miUsuario.getNumeroDocumento());
            declaracionPreparada.setString(5, miUsuario.getDireccion());
            declaracionPreparada.setString(6, miUsuario.getTelefono());
            declaracionPreparada.setString(7, miUsuario.getCorreo());
            declaracionPreparada.setString(8, miUsuario.getLoguin());
            declaracionPreparada.setString(9, miUsuario.getClave());
            declaracionPreparada.setInt(10, miUsuario.getIdUsuario());
            declaracionPreparada.execute();
            declaracionPreparada.close();
            cerrarConexion();
            return true;
        } catch (SQLException e) {
            cerrarConexion();
            return false;
        }
    }
    
    /*
    * elimina un usuario
    */
    public boolean eliminarUsuario(Usuario miUsuario){
        
        consultaUsuario = "";
        consultaUsuario = "DELETE FROM `usuario` WHERE (`idusuario` = ?)";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaUsuario);
            declaracionPreparada.setInt(1, miUsuario.getIdUsuario());
            declaracionPreparada.execute();
            declaracionPreparada.close();
            cerrarConexion();
            return true;
        } catch (SQLException e) {
            return false;
        } 
    }
    
    /*
    * busca todos los usuarios
    */
    public ArrayList<Usuario> buscarUsuarios(){
        
        listaUsuario.clear();
        
        try {
            declaracionPreparada = getConnection().prepareStatement("SELECT * FROM USUARIO ORDER BY nombre ASC");
            resultado = declaracionPreparada.executeQuery();
            
            while (resultado.next()) {                
                listaUsuario.add(new Usuario(resultado.getInt(1), resultado.getString(2), resultado.getString(3), resultado.getString(4), resultado.getString(5), resultado.getString(6), resultado.getString(7), resultado.getString(8), resultado.getString(9), resultado.getString(10)));
            }
            
            
            declaracionPreparada.close();
            resultado.close();
            cerrarConexion();
            return listaUsuario;
            
        } catch (SQLException e) {
            return listaUsuario;
        }
         
    }
    
    /*
    * busca un solo usuario con el id
    */
    public ArrayList<Usuario> buscarUnUsuario(String idUsuario){
        
        consultaUsuario = "";
        consultaUsuario = "SELECT * FROM usuario WHERE idusuario = ?";
        listaUsuario.clear();
        Usuario miUsuario = new Usuario();
        miUsuario.setIdUsuario(Integer.valueOf(idUsuario));
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaUsuario);
            declaracionPreparada.setInt(1, miUsuario.getIdUsuario());
            resultado = declaracionPreparada.executeQuery();
            
            while (resultado.next()) {                
                listaUsuario.add(new Usuario(resultado.getInt(1), resultado.getString(2), resultado.getString(3), resultado.getString(4), resultado.getString(5), resultado.getString(6), resultado.getString(7), resultado.getString(8), resultado.getString(9), resultado.getString(10)));
            }
            
            declaracionPreparada.close();
            resultado.close();
            cerrarConexion();
            return listaUsuario;
        } catch (SQLException e) {
            return listaUsuario;
        }
    }
    
    /*
    * busca un usuario por el loguin
    */
    public ArrayList<Usuario> buscarUsuarioLoguin(String loguin){
        
        listaUsuario.clear();
        consultaUsuario = "";
        consultaUsuario = "SELECT * FROM usuario\n" +
        "WHERE loguin=?";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaUsuario);
            declaracionPreparada.setString(1, loguin);
            resultado = declaracionPreparada.executeQuery();
            
            while (resultado.next()) {                
                listaUsuario.add(new Usuario(resultado.getInt(1), resultado.getString(2), resultado.getString(3), resultado.getString(4), resultado.getString(5), resultado.getString(6), resultado.getString(7), resultado.getString(8), resultado.getString(9), resultado.getString(10)));
            }
            
            declaracionPreparada.close();
            resultado.close();
            cerrarConexion();
            return listaUsuario;
        } catch (SQLException e) {
            cerrarConexion();
            return listaUsuario;
       }
    }
}
