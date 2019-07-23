package universidad.entity;

/**
 *
 * @author crispancho
 */
public class Curso {
    
    private String numeroCurso;
    private String nombreCurso;
    private String descripcion;
    private float credito;
    private float tarifa;
    private String idDeparatamento;
    
    //constructor
    public Curso(){
        
    }
    
    public Curso(String numeroCurso, String nombreCurso, String descripcion
    ,float credito, float tarifa, String idDeparatamento){
        
        this.numeroCurso = numeroCurso;
        this.nombreCurso = nombreCurso;
        this.descripcion = descripcion;
        this.credito = credito;
        this.tarifa = tarifa;
        this.idDeparatamento = idDeparatamento;
    }
    
    //getter and setters
    public String getNumeroCurso(){
        return numeroCurso;
    }
    
    public void setNumeroCurso(String numeroCurso){
        this.numeroCurso = numeroCurso;
    }
    
    public String getNombreCurso(){
        return nombreCurso;
    }
    
    public void setNombreCurso(String nombreCurso){
        this.nombreCurso = nombreCurso;
    }
    
    public String getDscripcion(){
        return descripcion;
    }
    
    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }
 
    public float getCredito(){
        return credito;
    }
    
     public void setCredito(float credito){
        this.credito = credito;
    }

    public float getTarifa(){
        return tarifa;
    }
    
    public void setTarifa(float tarifa){
        this.tarifa = tarifa;
    }

    public String getIdDeparatamento(){
        return idDeparatamento;
    }
    
    public void setIdDeparatamento(String idDeparatamento){
        this.idDeparatamento = idDeparatamento;
    }
    @Override
    public String toString() {
        return "Curso{" + "numeroCurso=" + numeroCurso + ", nombreCurso=" + nombreCurso + ", descripcion=" + descripcion + ", credito=" + credito + ", tarifa=" + tarifa + ", idDeparatamento=" + idDeparatamento + '}';
    }
   
}
