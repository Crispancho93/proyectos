package entity;

/**
 *
 * @author Crispancho
 */
public class Articulo {
    
    private int idArticulo;
    private int idCategoria;
    private String codigo;
    private String nombre;
    private int stock;
    private String descripcion;
    private String imagen;
    private boolean condicion;

    public Articulo(int idArticulo, int idCategoria, String codigo, String nombre, int stock, String descripcion, String imagen, boolean condicion) {
        this.idArticulo = idArticulo;
        this.idCategoria = idCategoria;
        this.codigo = codigo;
        this.nombre = nombre;
        this.stock = stock;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.condicion = condicion;
    }

    
    public int getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(int idArticulo) {
        this.idArticulo = idArticulo;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
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

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public boolean isCondicion() {
        return condicion;
    }

    public void setCondicion(boolean condicion) {
        this.condicion = condicion;
    }

    @Override
    public String toString() {
        return "Articulo{" + "idArticulo=" + idArticulo + ", idCategoria=" + idCategoria + ", codigo=" + codigo + ", nombre=" + nombre + ", stock=" + stock + ", descripcion=" + descripcion + ", imagen=" + imagen + ", condicion=" + condicion + '}';
    }
    
    
}
