package entity;

/**
 *
 * @author Crispancho
 */
public class Entrada {

    private String loguin;
    private String nombreProducto;
    private String nombreResponsable;
    private String nombreProveedor;
    private String nombreConductor;

    private int idEntrada;
    private int usuarioSistema;
    private int idProducto;
    private int responsable;
    private int proveedor;
    private String ruta;
    private int conductor;
    private int consecutivo;
    private String fechaHora;
    private float caneca;
    private float galon;
    private float kgRemisionado;
    private float kgPlanta;
    private float diferencia;
    private float productoMalo;
    private float perdidaPesoSegundoProceso;
    private float pesoNeto;
    private String observacion;
    private String numeroPlaca;

    /**
     * 
     * @param loguin
     * @param nombreProducto
     * @param nombreResponsable
     * @param nombreProveedor
     * @param nombreConductor
     * @param idEntrada
     * @param ruta
     * @param consecutivo
     * @param fechaHora
     * @param caneca
     * @param galon
     * @param kgRemisionado
     * @param kgPlanta
     * @param diferencia
     * @param productoMalo
     * @param perdidaPesoSegundoProceso
     * @param pesoNeto
     * @param observacion
     * @param numeroPlaca 
     * 
     * constructor espesifico para crear objetos de la consulta inner join
     */
    public Entrada(int idEntrada, String loguin, String nombreProducto, String nombreResponsable, String nombreProveedor, String ruta, String nombreConductor, String numeroPlaca, int consecutivo, String fechaHora, float caneca, float galon, float kgRemisionado, float kgPlanta, float diferencia, float productoMalo, float perdidaPesoSegundoProceso, float pesoNeto, String observacion) {
        
        this.idEntrada = idEntrada;
        this.loguin = loguin;
        this.nombreProducto = nombreProducto;
        this.nombreResponsable = nombreResponsable;
        this.nombreProveedor = nombreProveedor;
        this.nombreConductor = nombreConductor;
        this.ruta = ruta;
        this.consecutivo = consecutivo;
        this.fechaHora = fechaHora;
        this.caneca = caneca;
        this.galon = galon;
        this.kgRemisionado = kgRemisionado;
        this.kgPlanta = kgPlanta;
        this.diferencia = diferencia;
        this.productoMalo = productoMalo;
        this.perdidaPesoSegundoProceso = perdidaPesoSegundoProceso;
        this.pesoNeto = pesoNeto;
        this.observacion = observacion;
        this.numeroPlaca = numeroPlaca;
    }

    
    public Entrada() {
    }

   
    public String getLoguin() {
        return loguin;
    }

    public void setLoguin(String loguin) {
        this.loguin = loguin;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getNombreResponsable() {
        return nombreResponsable;
    }

    public void setNombreResponsable(String nombreResponsable) {
        this.nombreResponsable = nombreResponsable;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public String getNombreConductor() {
        return nombreConductor;
    }

    public void setNombreConductor(String nombreConductor) {
        this.nombreConductor = nombreConductor;
    }

    public int getIdEntrada() {
        return idEntrada;
    }

    public void setIdEntrada(int idEntrada) {
        this.idEntrada = idEntrada;
    }

    public int getUsuarioSistema() {
        return usuarioSistema;
    }

    public void setUsuarioSistema(int usuarioSistema) {
        this.usuarioSistema = usuarioSistema;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getResponsable() {
        return responsable;
    }

    public void setResponsable(int responsable) {
        this.responsable = responsable;
    }

    public int getProveedor() {
        return proveedor;
    }

    public void setProveedor(int proveedor) {
        this.proveedor = proveedor;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public int getConductor() {
        return conductor;
    }

    public void setConductor(int conductor) {
        this.conductor = conductor;
    }

    public int getConsecutivo() {
        return consecutivo;
    }

    public void setConsecutivo(int consecutivo) {
        this.consecutivo = consecutivo;
    }

    public String getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(String fechaHora) {
        this.fechaHora = fechaHora;
    }

    public float getCaneca() {
        return caneca;
    }

    public void setCaneca(float caneca) {
        this.caneca = caneca;
    }

    public float getGalon() {
        return galon;
    }

    public void setGalon(float galon) {
        this.galon = galon;
    }

    public float getKgRemisionado() {
        return kgRemisionado;
    }

    public void setKgRemisionado(float kgRemisionado) {
        this.kgRemisionado = kgRemisionado;
    }

    public float getKgPlanta() {
        return kgPlanta;
    }

    public void setKgPlanta(float kgPlanta) {
        this.kgPlanta = kgPlanta;
    }

    public float getDiferencia() {
        return diferencia;
    }

    public void setDiferencia(float diferencia) {
        this.diferencia = diferencia;
    }

    public float getProductoMalo() {
        return productoMalo;
    }

    public void setProductoMalo(float productoMalo) {
        this.productoMalo = productoMalo;
    }

    public float getPerdidaPesoSegundoProceso() {
        return perdidaPesoSegundoProceso;
    }

    public void setPerdidaPesoSegundoProceso(float perdidaPesoSegundoProceso) {
        this.perdidaPesoSegundoProceso = perdidaPesoSegundoProceso;
    }

    public float getPesoNeto() {
        return pesoNeto;
    }

    public void setPesoNeto(float pesoNeto) {
        this.pesoNeto = pesoNeto;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String getNumeroPlaca() {
        return numeroPlaca;
    }

    public void setNumeroPlaca(String numeroPlaca) {
        this.numeroPlaca = numeroPlaca;
    }

    @Override
    public String toString() {
        return "Entrada{" + "loguin=" + loguin + ", nombreProducto=" + nombreProducto + ", nombreResponsable=" + nombreResponsable + ", nombreProveedor=" + nombreProveedor + ", nombreConductor=" + nombreConductor + ", idEntrada=" + idEntrada + ", usuarioSistema=" + usuarioSistema + ", idProducto=" + idProducto + ", responsable=" + responsable + ", proveedor=" + proveedor + ", ruta=" + ruta + ", conductor=" + conductor + ", consecutivo=" + consecutivo + ", fechaHora=" + fechaHora + ", caneca=" + caneca + ", galon=" + galon + ", kgRemisionado=" + kgRemisionado + ", kgPlanta=" + kgPlanta + ", diferencia=" + diferencia + ", productoMalo=" + productoMalo + ", perdidaPesoSegundoProceso=" + perdidaPesoSegundoProceso + ", pesoNeto=" + pesoNeto + ", observacion=" + observacion + ", numeroPlaca=" + numeroPlaca + '}';
    }

    
}
