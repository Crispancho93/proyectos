/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import entity.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.UsuarioDao;

/**
 *
 * @author Crispancho
 */
public class Conexion {
    
     
    private Connection conn = null;

    // conectra db
    public Connection getConnection() {

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/administrativo?user=root&password=Colombia.123");
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Error Conexión " + e.getMessage());
        }

        return conn;
    }

    // cerrar db
    public void cerrarConexion() {
        try {
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public static void main(String[] args) {
        UsuarioDao usuarioDao = new UsuarioDao();
        Usuario usuario = new Usuario();
        usuario.setLoguin("crispancho");
        usuario.setClave("1993");
        System.out.println(usuarioDao.validarUsuario(usuario));
    }
}
