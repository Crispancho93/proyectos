package usuario.entity;

/**
 *
 * @author Crispancho
 */
public class Usuario {
    
    private int idUsuario;
    private String Usuario;
    private String clave;
    private String nombre;
    private String lasSesion;
    private int idTipo;
    
    public Usuario(){
        
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuarios) {
        this.idUsuario = idUsuarios;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String password) {
        this.clave = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLasSesion() {
        return lasSesion;
    }

    public void setLasSesion(String lasSesion) {
        this.lasSesion = lasSesion;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", Usuario=" + Usuario + ", clave=" + clave + ", nombre=" + nombre + ", lasSesion=" + lasSesion + ", idTipo=" + idTipo + '}';
    }
    
    
    
}
