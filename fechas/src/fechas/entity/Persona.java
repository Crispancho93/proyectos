package fechas.entity;



/**
 *
 * @author Crispancho
 */
public class Persona {
    
    private String nombres;
    private String numeroDocumento;
    private String fechaHora;
    
    public Persona(){
        
    }
    
    public Persona(String nombres, String numeroDocumento, String fechaHora){
        this.nombres = nombres;
        this.numeroDocumento = numeroDocumento;
        this.fechaHora = fechaHora;
    }
    
    public String getNombres(){
        return nombres;
    }
    
    public void setNombres(String nombres){
        this.nombres = nombres;
    }
    
    public String getNumeroDocumento(){
        return numeroDocumento;
    }
    
    public void setNumeroDocumento(String numeroDocumento){
        this.numeroDocumento = numeroDocumento;
    }
    
    public String getFechaHora(){
        return fechaHora;
    }
    
    public void setFechaHora(String fechaHora){
        this.fechaHora = fechaHora;
    }

    @Override
    public String toString() {
        return "Persona{" + "nombres=" + nombres + ", numeroDocumento=" + numeroDocumento + ", fechaHora=" + fechaHora + '}';
    }
    
    
}
