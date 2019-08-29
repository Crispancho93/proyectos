package entity;

/**
 *
 * @author Crispancho
 */
public class Ingreso {
    
    private int idIngreso;
    private int idPersona;
    private int idUsuario;
    private int idArticulo;
    private String tipoComprobante;
    private String numeroComprobante;
    private String fechaExpedicion;
    private String fechaVencimiento;
    private float cantidad;
    private float valorUnitario;
    private float subtotal;
    private float descuento;
    private float subtotalDescuento;
    private float iva;
    private float total;
    private float rteFuente;
    private float rteIva;
    private float rteIca;
    private float neto;
    private String estado;
    private String observaciones;

    public int getIdIngreso() {
        return idIngreso;
    }

    public void setIdIngreso(int idIngreso) {
        this.idIngreso = idIngreso;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(int idArticulo) {
        this.idArticulo = idArticulo;
    }

    public String getTipoComprobante() {
        return tipoComprobante;
    }

    public void setTipoComprobante(String tipoComprobante) {
        this.tipoComprobante = tipoComprobante;
    }

    public String getNumeroComprobante() {
        return numeroComprobante;
    }

    public void setNumeroComprobante(String numeroComprobante) {
        this.numeroComprobante = numeroComprobante;
    }

    public String getFechaExpedicion() {
        return fechaExpedicion;
    }

    public void setFechaExpedicion(String fechaExpedicion) {
        this.fechaExpedicion = fechaExpedicion;
    }

    public String getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(String fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public float getCantidad() {
        return cantidad;
    }

    public void setCantidad(float cantidad) {
        this.cantidad = cantidad;
    }

    public float getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(float valorUnitario) {
        this.valorUnitario = valorUnitario;
    }

    public float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(float subtotal) {
        this.subtotal = subtotal;
    }

    public float getDescuento() {
        return descuento;
    }

    public void setDescuento(float descuento) {
        this.descuento = descuento;
    }

    public float getSubtotalDescuento() {
        return subtotalDescuento;
    }

    public void setSubtotalDescuento(float subtotalDescuento) {
        this.subtotalDescuento = subtotalDescuento;
    }

    public float getIva() {
        return iva;
    }

    public void setIva(float iva) {
        this.iva = iva;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public float getRteFuente() {
        return rteFuente;
    }

    public void setRteFuente(float rteFuente) {
        this.rteFuente = rteFuente;
    }

    public float getRteIva() {
        return rteIva;
    }

    public void setRteIva(float rteIva) {
        this.rteIva = rteIva;
    }

    public float getRteIca() {
        return rteIca;
    }

    public void setRteIca(float rteIca) {
        this.rteIca = rteIca;
    }

    public float getNeto() {
        return neto;
    }

    public void setNeto(float neto) {
        this.neto = neto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    @Override
    public String toString() {
        return "Ingreso{" + "idIngreso=" + idIngreso + ", idPersona=" + idPersona + ", idUsuario=" + idUsuario + ", idArticulo=" + idArticulo + ", tipoComprobante=" + tipoComprobante + ", numeroComprobante=" + numeroComprobante + ", fechaExpedicion=" + fechaExpedicion + ", fechaVencimiento=" + fechaVencimiento + ", cantidad=" + cantidad + ", valorUnitario=" + valorUnitario + ", subtotal=" + subtotal + ", descuento=" + descuento + ", subtotalDescuento=" + subtotalDescuento + ", iva=" + iva + ", total=" + total + ", rteFuente=" + rteFuente + ", rteIva=" + rteIva + ", rteIca=" + rteIca + ", neto=" + neto + ", estado=" + estado + ", observaciones=" + observaciones + '}';
    }
    
    
}
