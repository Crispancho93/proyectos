
package entity;

/**
 *
 * @author Crispancho
 */
public class Numero {
    
    private int idNumero;
    private int numero;
    
    public Numero(){
        
    }
    
    public Numero(int numero){
        this.numero = numero;
    }
    
    public int getNumero(){
        return numero;
    }
    
    public void setNumero(int numero){
        this.numero = numero;
    }
    
    public int getIdNumero(){
        return idNumero;
    }
    
    public void setIdNumero(int id){
        this.idNumero = id;
    }

    @Override
    public String toString() {
        return "Numero{" + "idNumero=" + idNumero + ", numero=" + numero + '}';
    }
    
    
}
