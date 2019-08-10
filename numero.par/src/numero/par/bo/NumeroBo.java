/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package numero.par.bo;
import entity.Numero;
import java.sql.Connection;
import numero.par.dao.NumeroDao;
/**
 *
 * @author Crispancho
 */
public class NumeroBo {
    
    
    
    public boolean numeroPar(int numero)
    {
        
        Numero miNumero = new Numero();
        miNumero.setNumero(numero);
        
        NumeroDao miNumeroDao = new NumeroDao();
        Connection conn = conexion.ConexionNumeroPar.getConnection();
        
        if (miNumero.getNumero()% 2 == 0) 
        {   
            miNumero.setDescripcion("El numero es par");
            miNumeroDao.agregarNumero(conn, miNumero);
            return true; 
        }
        
        miNumero.setDescripcion("El numero es impar");
        miNumeroDao.agregarNumero(conn, miNumero);
        return false;
    }
}
