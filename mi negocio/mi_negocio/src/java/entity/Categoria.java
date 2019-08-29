package entity;

/**
 *
 * @author Crispancho
 */
public class Categoria {
    
    private int idCategoria;
    private String nombre;
    private String decripcion;
    private boolean condicion;

    public Categoria(int idCategoria, String nombre, String decripcion, boolean condicion) {
        this.idCategoria = idCategoria;
        this.nombre = nombre;
        this.decripcion = decripcion;
        this.condicion = condicion;
    }

  
    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDecripcion() {
        return decripcion;
    }

    public void setDecripcion(String decripcion) {
        this.decripcion = decripcion;
    }

    public boolean isCondicion() {
        return condicion;
    }

    public void setCondicion(boolean condicion) {
        this.condicion = condicion;
    }
    
    @Override
    public String toString() {
        return "Categoria{" + "idCategoria=" + idCategoria + ", nombre=" + nombre + ", decripcion=" + decripcion + ", condicion=" + condicion + '}';
    }
}
