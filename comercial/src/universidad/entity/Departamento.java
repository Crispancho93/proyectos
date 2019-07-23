package universidad.entity;



public class Departamento {
    
    private int idDepartamento;
    private String nombreDepartamento;
    private String edificio;
    private String despacho;
    private String numCuerpoDocente;
    
    //constructor vacio
    public Departamento(){
    }

    //constructor con parametros
    public Departamento(String nombreDepartamento, String edificio, String despacho, String numCuerpoDocente){
       
        this.nombreDepartamento = nombreDepartamento;
        this.edificio = edificio;
        this.despacho = despacho;
        this.numCuerpoDocente = numCuerpoDocente;
    }
    
    public int getIdDepartamento(){
        return idDepartamento;
    }
    
    public void setIdDepartamento(int idDepartamento){
        this.idDepartamento = idDepartamento;
    }
    
    public String getNombreDepartamento(){
        return nombreDepartamento;
    }
    
    public void setNombreDepartamento(String nombreDepartamento){
        this.nombreDepartamento = nombreDepartamento;
    }

    public String getEdificio(){
        return edificio;
    }
    
    public void setEdificio(String edificio){
        this.edificio = edificio;
    }

    public String getDespacho(){
        return despacho;
    }
    
     public void setDespacho(String despacho){
        this.despacho = despacho;
    }

    public String getNumCuerpoDocente(){
        return numCuerpoDocente;
    }

     public void setNumCuerpoDocente(String numCuerpoDocente){
        this.numCuerpoDocente = numCuerpoDocente;
    }
     
    //sobre escribir al metodo toString que es de la clase objet
    @Override
    public String toString() {
        return "Departamento{" + "idDepartamento=" + nombreDepartamento + ", edificio=" + edificio + ", despacho=" + despacho + ", numCuerpoDocente=" + numCuerpoDocente + '}';
    }
    
}
