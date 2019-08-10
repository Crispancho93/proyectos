/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package numero.par.dao;

import entity.Numero;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Crispancho
 */
public class NumeroDao {
    
    
    private String sql = "";
    public void agregarNumero(Connection conn, Numero numero){
        
        PreparedStatement declaracionPreparada = null;
        sql = "";
        sql = "INSERT INTO NUMERO (VALOR, DESCRIPCION)\n" +
                "VALUES (?, ?)";
        
        try {
            declaracionPreparada = conn.prepareStatement(sql);
            declaracionPreparada.setInt(1, numero.getNumero());
            declaracionPreparada.setString(2, numero.getDescripcion());
            declaracionPreparada.execute();
            declaracionPreparada.close();
            return;
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "No se puede agregar el registro"+e.getMessage());
            return;
        }
        
        
    }
}
