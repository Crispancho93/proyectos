package entity;

/**
 *
 * @author Crispancho
 */
public class Persona {
    
    private int idPersona;
    private String nombre;
    private String tipoPersona;
    private String tipoDocumento;
    private String numeroDocumento;
    private String direccion;
    private String telefono;
    private String correo;
    private String nombreContacto;
    private String numeroContacto;
    
    public Persona() {
        
        
    }

    
    
    public Persona(int idPersona, String nombre, String tipoPersona, String tipoDocumento, String numeroDocumento, String direccion, String telefono, String correo, String nombreContacto, String numeroContacto) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.tipoPersona = tipoPersona;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.direccion = direccion;
        this.telefono = telefono;
        this.correo = correo;
        this.nombreContacto = nombreContacto;
        this.numeroContacto = numeroContacto;
    }

    
    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(String tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombreContacto() {
        return nombreContacto;
    }

    public void setNombreContacto(String nombreContacto) {
        this.nombreContacto = nombreContacto;
    }

    public String getNumeroContacto() {
        return numeroContacto;
    }

    public void setNumeroContacto(String numeroContacto) {
        this.numeroContacto = numeroContacto;
    }

    @Override
    public String toString() {
        return "Persona{" + "idPersona=" + idPersona + ", nombre=" + nombre + ", tipoPersona=" + tipoPersona + ", tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento + ", direccion=" + direccion + ", telefono=" + telefono + ", correo=" + correo + ", nombreContacto=" + nombreContacto + ", numeroContacto=" + numeroContacto + '}';
    }
    
}