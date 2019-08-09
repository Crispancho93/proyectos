/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package numero.par.bo;
import entity.Numero;
/**
 *
 * @author Crispancho
 */
public class NumeroBo {
    
    
    
    public boolean numeroPar(int numero){
        
        Numero miNumero = new Numero();
        miNumero.setNumero(numero);
        
        return miNumero.getNumero()% 2 == 0;
    }
}
