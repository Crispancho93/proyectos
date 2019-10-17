package entity;

/**
 *
 * @author Crispancho
 */
public class Producto {
    
    private int idProducto;
    private String codigo;
    private String nombre;
    private String observacion;

    public Producto() {
    }

    public Producto(int idProducto, String codigo, String nombre, String observacion) {
        this.idProducto = idProducto;
        this.codigo = codigo;
        this.nombre = nombre;
        this.observacion = observacion;
    }

    
    
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    } 

    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", codigo=" + codigo + ", nombre=" + nombre + ", observacion=" + observacion + '}';
    }
    
    
}
