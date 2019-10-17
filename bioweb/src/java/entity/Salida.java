package entity;

/**
 *
 * @author Crispancho
 */
public class Salida {
    
    private int idSalida;
    private int usuarioSistema;
    private String loguin;
    private int idProducto;
    private String nombreProducto;
    private int responsable;
    private String nombreResponsable;
    private int cliente;
    private String nombreCliente;
    private int conductor;
    private String nombreConductor;
    private String numeroPlaca;
    private int consecutivo;
    private String fechaHora;
    private float caneca;
    private float galon;
    private float pesoBruto;
    private float tara;
    private float pesoNeto;
    private float gradosBrix;
    private float cantidadBulto;
    private String observacion;

    public Salida() {
    }

    
    
    public Salida(int idSalida, int usuarioSistema, String loguin, int idProducto, String nombreProducto, int responsable, String nombreResponsable, int cliente, String nombreCliente, int conductor, String nombreConductor, String numeroPlaca, int consecutivo, String fechaHora, float caneca, float galon, float pesoBruto, float tara, float pesoNeto, float gradosBrix, float cantidadBulto, String observacion) {
        this.idSalida = idSalida;
        this.usuarioSistema = usuarioSistema;
        this.loguin = loguin;
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.responsable = responsable;
        this.nombreResponsable = nombreResponsable;
        this.cliente = cliente;
        this.nombreCliente = nombreCliente;
        this.conductor = conductor;
        this.nombreConductor = nombreConductor;
        this.numeroPlaca = numeroPlaca;
        this.consecutivo = consecutivo;
        this.fechaHora = fechaHora;
        this.caneca = caneca;
        this.galon = galon;
        this.pesoBruto = pesoBruto;
        this.tara = tara;
        this.pesoNeto = pesoNeto;
        this.gradosBrix = gradosBrix;
        this.cantidadBulto = cantidadBulto;
        this.observacion = observacion;
    }

    
    
    public int getIdSalida() {
        return idSalida;
    }

    public void setIdSalida(int idSalida) {
        this.idSalida = idSalida;
    }

    public int getUsuarioSistema() {
        return usuarioSistema;
    }

    public void setUsuarioSistema(int usuarioSistema) {
        this.usuarioSistema = usuarioSistema;
    }

    public String getLoguin() {
        return loguin;
    }

    public void setLoguin(String loguin) {
        this.loguin = loguin;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getResponsable() {
        return responsable;
    }

    public void setResponsable(int responsable) {
        this.responsable = responsable;
    }

    public String getNombreResponsable() {
        return nombreResponsable;
    }

    public void setNombreResponsable(String nombreResponsable) {
        this.nombreResponsable = nombreResponsable;
    }

    public int getCliente() {
        return cliente;
    }

    public void setCliente(int cliente) {
        this.cliente = cliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public int getConductor() {
        return conductor;
    }

    public void setConductor(int conductor) {
        this.conductor = conductor;
    }

    public String getNombreConductor() {
        return nombreConductor;
    }

    public void setNombreConductor(String nombreConductor) {
        this.nombreConductor = nombreConductor;
    }


    public String getNumeroPlaca() {
        return numeroPlaca;
    }

    public void setNumeroPlaca(String numeroPlaca) {
        this.numeroPlaca = numeroPlaca;
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

    public float getPesoBruto() {
        return pesoBruto;
    }

    public void setPesoBruto(float pesoBruto) {
        this.pesoBruto = pesoBruto;
    }

    public float getTara() {
        return tara;
    }

    public void setTara(float tara) {
        this.tara = tara;
    }

    public float getPesoNeto() {
        return pesoNeto;
    }

    public void setPesoNeto(float pesoNeto) {
        this.pesoNeto = pesoNeto;
    }

    public float getGradosBrix() {
        return gradosBrix;
    }

    public void setGradosBrix(float gradosBrix) {
        this.gradosBrix = gradosBrix;
    }

    public float getCantidadBulto() {
        return cantidadBulto;
    }

    public void setCantidadBulto(float cantidadBulto) {
        this.cantidadBulto = cantidadBulto;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    @Override
    public String toString() {
        return "Salida{" + "idSalida=" + idSalida + ", usuarioSistema=" + usuarioSistema + ", loguin=" + loguin + ", idProducto=" + idProducto + ", nombreProducto=" + nombreProducto + ", responsable=" + responsable + ", nombreResponsable=" + nombreResponsable + ", cliente=" + cliente + ", nombreCliente=" + nombreCliente + ", conductor=" + conductor + ", nombreConductor=" + nombreConductor + ", numeroPlaca=" + numeroPlaca + ", consecutivo=" + consecutivo + ", fechaHora=" + fechaHora + ", caneca=" + caneca + ", galon=" + galon + ", pesoBruto=" + pesoBruto + ", tara=" + tara + ", pesoNeto=" + pesoNeto + ", gradosBrix=" + gradosBrix + ", cantidadBulto=" + cantidadBulto + ", observacion=" + observacion + '}';
    }

}