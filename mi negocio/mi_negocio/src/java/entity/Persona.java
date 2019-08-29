package entity;

/**
 *
 * @author Crispancho
 */
public class Persona {
    
    private int idPersona;
    private String tipoPersona;
    private String nombre;
    private String tipoDocumento;
    private String numeroDocumento;
    private String direccion;
    private String telefono;
    private String email;

    public Persona(int idPersona, String tipoPersona, String nombre, String tipoDocumento, String numeroDocumento, String direccion, String telefono, String email) {
        this.idPersona = idPersona;
        this.tipoPersona = tipoPersona;
        this.nombre = nombre;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public String getTipoPersona() {
        return tipoPersona;
    }

    public void setTipoPersona(String tipoPersona) {
        this.tipoPersona = tipoPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Persona{" + "idPersona=" + idPersona + ", tipoPersona=" + tipoPersona + ", nombre=" + nombre + ", tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento + ", direccion=" + direccion + ", telefono=" + telefono + ", email=" + email + '}';
    }
    
    
}
