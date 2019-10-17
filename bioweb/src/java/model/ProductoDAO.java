package model;

import entity.Producto;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Crispancho
 */
public class ProductoDAO extends Conexion{
    
    private PreparedStatement declaracionPreparada;
    private ResultSet resultado;
    private String consultaProducto;
    private ArrayList<Producto> listaProducto = new ArrayList<Producto>();
    
    /**
     * 
     * @param miProducto
     * @return 
     */
    public boolean agregarProducto(Producto miProducto){
        consultaProducto = "";
        consultaProducto = "INSERT INTO producto\n" +
        "(codigo, nombre, observacion)\n" +
        "VALUES\n" +
        "(?,?,?)";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaProducto);
            declaracionPreparada.setString(1, miProducto.getCodigo());
            declaracionPreparada.setString(2, miProducto.getNombre());
            declaracionPreparada.setString(3, miProducto.getObservacion());
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
     * @param miProducto
     * @return 
     */
    public boolean actualizarProducto(Producto miProducto){
        consultaProducto = "";
        consultaProducto = "UPDATE producto\n" +
        "SET codigo = ?,\n" +
        "    nombre = ?,\n" +
        "    observacion = ?\n" +
        "WHERE idproducto = ?";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaProducto);
            declaracionPreparada.setString(1, miProducto.getCodigo());
            declaracionPreparada.setString(2, miProducto.getNombre());
            declaracionPreparada.setString(3, miProducto.getObservacion());
            declaracionPreparada.setInt(4, miProducto.getIdProducto());
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
     * @return 
     */
    public ArrayList<Producto> buscarProducto(){
        listaProducto.clear();
        consultaProducto = "";
        consultaProducto = "select * from producto ORDER BY nombre ASC";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaProducto);
            resultado = declaracionPreparada.executeQuery();
            
            while (resultado.next()) {                
                listaProducto.add(new Producto(resultado.getInt(1), resultado.getString(2), resultado.getString(3), resultado.getString(4)));
            }
            
            declaracionPreparada.close();
            resultado.close();
            cerrarConexion();
            return listaProducto;
        } catch (SQLException e) {
            cerrarConexion();
            return listaProducto;
        }
    }
    
    /**
     * 
     * @param diProducto
     * @return 
     */
    public ArrayList<Producto> buscarUnProducto(String diProducto){
        listaProducto.clear();
        consultaProducto = "";
        consultaProducto = "SELECT * FROM PRODUCTO WHERE idproducto = ?";
        Producto miProducto = new Producto();
        miProducto.setIdProducto(Integer.valueOf(diProducto));
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaProducto);
            declaracionPreparada.setInt(1, miProducto.getIdProducto());
            resultado = declaracionPreparada.executeQuery();
            
            while (resultado.next()) {                
                listaProducto.add(new Producto(resultado.getInt(1), resultado.getString(2), resultado.getString(3), resultado.getString(4)));
            }
            
            declaracionPreparada.close();
            resultado.close();
            cerrarConexion();
            return listaProducto;
        } catch (SQLException e) {
            cerrarConexion();
            return listaProducto;
        }
        
    }
    
    /**
     * 
     * @param miProducto
     * @return 
     */
    public boolean eliminarProducto(Producto miProducto){
        
        consultaProducto = "";
        consultaProducto = "DELETE FROM producto WHERE idproducto = ?";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaProducto);
            declaracionPreparada.setInt(1, miProducto.getIdProducto());
            declaracionPreparada.execute();
            declaracionPreparada.close();
            cerrarConexion();
            return true;
        } catch (SQLException e) {
            cerrarConexion();
            return false;
        }
    }
}
