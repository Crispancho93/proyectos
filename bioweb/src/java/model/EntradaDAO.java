package model;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import entity.Entrada;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Crispancho
 */
public class EntradaDAO extends Conexion {

    private PreparedStatement declaracionPreparada;
    private ResultSet resultado;
    private String consultaEntrada;
    private ArrayList<Entrada> listaEntrada = new ArrayList<Entrada>();
    private JsonObject gson = new JsonObject();
    private JsonArray listaEntradaJson = new JsonArray();

    /**
     *
     * @param miEntrada
     * @return calcula diferencia y peso neto
     */
    public boolean agregarEntrada(Entrada miEntrada) {

        // si KgRemisionado es direfente de 0 es por que tiene valor y calculamos diferencia 
        if (miEntrada.getKgRemisionado() != 0) {

            // resto al kg remisionado el peso en planta para calcular la diferenia 
            miEntrada.setDiferencia(miEntrada.getKgRemisionado() - miEntrada.getKgPlanta());
        }

        // calculamos el peso neto
        miEntrada.setPesoNeto(miEntrada.getKgPlanta()
                - (miEntrada.getPerdidaPesoSegundoProceso() + miEntrada.getProductoMalo()));

        // insert calculando diferencia y peso neto, se calcula diferencia para los conductores de ruta.
        try {

            consultaEntrada = "";
            consultaEntrada = "INSERT INTO `bioweb`.`entrada` (`usuario_sistema`, `idproducto`, `responsable`, `proveedor`, `ruta`, `conductor`, `numero_placa`, `consecutivo`, `fecha_hora`, `caneca`, `galon`, `kg_remisionado`, `kg_planta`, `diferencia`, `producto_malo`, `perdida_peso_segundo_proceso`, `peso_neto`, `observacion`)\n"
                    + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            declaracionPreparada = getConnection().prepareStatement(consultaEntrada);
            declaracionPreparada.setInt(1, miEntrada.getUsuarioSistema());
            declaracionPreparada.setInt(2, miEntrada.getIdProducto());
            declaracionPreparada.setInt(3, miEntrada.getResponsable());
            declaracionPreparada.setInt(4, miEntrada.getProveedor());
            declaracionPreparada.setString(5, miEntrada.getRuta());
            declaracionPreparada.setInt(6, miEntrada.getConductor());
            declaracionPreparada.setString(7, miEntrada.getNumeroPlaca());
            declaracionPreparada.setInt(8, miEntrada.getConsecutivo());
            declaracionPreparada.setString(9, miEntrada.getFechaHora());
            declaracionPreparada.setFloat(10, miEntrada.getCaneca());
            declaracionPreparada.setFloat(11, miEntrada.getGalon());
            declaracionPreparada.setFloat(12, miEntrada.getKgRemisionado());
            declaracionPreparada.setFloat(13, miEntrada.getKgPlanta());
            declaracionPreparada.setFloat(14, miEntrada.getDiferencia());
            declaracionPreparada.setFloat(15, miEntrada.getProductoMalo());
            declaracionPreparada.setFloat(16, miEntrada.getPerdidaPesoSegundoProceso());
            declaracionPreparada.setFloat(17, miEntrada.getPesoNeto());
            declaracionPreparada.setString(18, miEntrada.getObservacion());
            declaracionPreparada.execute();
            declaracionPreparada.close();
            cerrarConexion();
            return true;

        } catch (SQLException e) {
            cerrarConexion();
            return false;
        }
    }

    /**
     * actualizar una entrada con diferencia o sin diferencia
     *
     * @param miEntrada
     * @return
     */
    public boolean actualizarEntrada(Entrada miEntrada) {

        // si KgRemisionado es direfente de 0 es por que tiene valor y calculamos diferencia 
        if (miEntrada.getKgRemisionado() != 0) {
            miEntrada.setDiferencia(miEntrada.getKgRemisionado()
                    - miEntrada.getKgPlanta());
        }

        // calculamos el peso neto
        miEntrada.setPesoNeto(miEntrada.getKgPlanta()
                - (miEntrada.getProductoMalo() + miEntrada.getPerdidaPesoSegundoProceso()));

        // update con diferencia, solo se calcula diferencia para los conductores de ruta.
        try {
            consultaEntrada = "";
            consultaEntrada = "UPDATE entrada\n"
                    + "SET usuario_sistema = ?,\n"
                    + "    idproducto = ?,\n"
                    + "    responsable = ?,\n"
                    + "    proveedor = ?,\n"
                    + "    ruta = ?,\n"
                    + "    conductor = ?,\n"
                    + "    numero_placa = ?,\n"
                    + "    consecutivo = ?,\n"
                    + "    fecha_hora = ?,\n"
                    + "    caneca = ?,\n"
                    + "    galon = ?,\n"
                    + "    kg_remisionado = ?,\n"
                    + "    kg_planta = ?,\n"
                    + "    diferencia = ?,\n"
                    + "    producto_malo = ?,\n"
                    + "    perdida_peso_segundo_proceso = ?,\n"
                    + "    peso_neto = ?,\n"
                    + "    observacion = ?\n"
                    + "WHERE identrada = ?";

            declaracionPreparada = getConnection().prepareStatement(consultaEntrada);
            declaracionPreparada.setInt(1, miEntrada.getUsuarioSistema());
            declaracionPreparada.setInt(2, miEntrada.getIdProducto());
            declaracionPreparada.setInt(3, miEntrada.getResponsable());
            declaracionPreparada.setInt(4, miEntrada.getProveedor());
            declaracionPreparada.setString(5, miEntrada.getRuta());
            declaracionPreparada.setInt(6, miEntrada.getConductor());
            declaracionPreparada.setString(7, miEntrada.getNumeroPlaca());
            declaracionPreparada.setInt(8, miEntrada.getConsecutivo());
            declaracionPreparada.setString(9, miEntrada.getFechaHora());
            declaracionPreparada.setFloat(10, miEntrada.getCaneca());
            declaracionPreparada.setFloat(11, miEntrada.getGalon());
            declaracionPreparada.setFloat(12, miEntrada.getKgRemisionado());
            declaracionPreparada.setFloat(13, miEntrada.getKgPlanta());
            declaracionPreparada.setFloat(14, miEntrada.getDiferencia());
            declaracionPreparada.setFloat(15, miEntrada.getProductoMalo());
            declaracionPreparada.setFloat(16, miEntrada.getPerdidaPesoSegundoProceso());
            declaracionPreparada.setFloat(17, miEntrada.getPesoNeto());
            declaracionPreparada.setString(18, miEntrada.getObservacion());
            declaracionPreparada.setInt(19, miEntrada.getIdEntrada());
            declaracionPreparada.execute();
            declaracionPreparada.close();
            cerrarConexion();
            return true;

        } catch (SQLException e) {
            cerrarConexion();
            return false;
        }

    }

    /**
     * lista todas las entradas
     *
     * @param fechaInicio
     * @param fechaFin
     * @return
     */
    public JsonObject buscarEntrada(String fechaInicio, String fechaFin) {

        consultaEntrada = "";

        // consulta con inner join 
        consultaEntrada = "SELECT \n"
                + "    e.identrada, \n" // int
                + "    usu.loguin, \n" // string
                + "    pro.nombre, \n" // string
                + "    per.nombre, \n" // string
                + "    prov.nombre, \n" // string
                + "    e.ruta, \n" // string
                + "    con.nombre, \n" // string
                + "    e.numero_placa, \n" // string
                + "    e.consecutivo, \n" // int
                + "    e.fecha_hora, \n" // string
                + "    e.caneca, \n" // float
                + "    e.galon, \n" // float
                + "    e.kg_remisionado, \n" // float
                + "    e.kg_planta, \n" // float
                + "    e.diferencia ,\n" // float
                + "    e.producto_malo, \n" // float
                + "    e.perdida_peso_segundo_proceso, \n" // float
                + "    e.peso_neto, e.observacion\n" // float
                + "FROM entrada e\n"
                + "    INNER JOIN usuario AS usu ON e.usuario_sistema = usu.idusuario \n"
                + "    INNER JOIN producto AS pro ON e.idproducto = pro.idproducto\n"
                + "    INNER JOIN persona AS per ON e.responsable = per.idpersona\n"
                + "    INNER JOIN persona AS prov ON e.proveedor = prov.idpersona\n"
                + "    INNER JOIN persona AS con ON e.conductor = con.idpersona \n"
                + "WHERE DATE(e.fecha_hora) BETWEEN ? AND ? ORDER BY e.identrada DESC";

        try {
            declaracionPreparada = getConnection().prepareStatement(consultaEntrada);
            declaracionPreparada.setString(1, fechaInicio);
            declaracionPreparada.setString(2, fechaFin);
            resultado = declaracionPreparada.executeQuery();

            while (resultado.next()) {

                // se crea un un objeto, por cada iteración 
                JsonObject item = new JsonObject();

                // se guarda una columna espesifica de la db por cada iteración
                item.addProperty("identrada", "<a href=\"actualizarEntrada.jsp?entradaSeleccionada=" + resultado.getInt(1) + "\" id=\" " + resultado.getInt(1) + "\" class=\"btn btn-warning btn-sm\" name=\"btnBuscarEntrada\" value=\" " + resultado.getInt(1) + "\">EDITAR <i class=\"fas fa-pencil-alt\"></i></a>" + resultado.getInt(1));
                item.addProperty("calcular", "<button type=\"submit\" class=\"btn btn-info btn-sm\" name=\"btncalcular\">SUMA <i class=\"fas fa-calculator\"></i></button> "
                        + "<input type=\"checkbox\" name=\"checkId\" class=\"btn btn-primary btn-sm \" value=\"" + resultado.getInt(1) + "\">");
                item.addProperty("loguin", resultado.getString(2));
                item.addProperty("producto", resultado.getString(3));
                item.addProperty("responsable", resultado.getString(4));
                item.addProperty("proveedor", resultado.getString(5));
                item.addProperty("ruta", resultado.getString(6));
                item.addProperty("conductor", resultado.getString(7));
                item.addProperty("placa", resultado.getString(8));
                item.addProperty("consecutivo", resultado.getInt(9));
                item.addProperty("fecha", resultado.getString(10));
                item.addProperty("caneca", resultado.getFloat(11));
                item.addProperty("galon", resultado.getFloat(12));
                item.addProperty("remisionado", resultado.getFloat(13));
                item.addProperty("planta", resultado.getFloat(14));
                item.addProperty("diferencia", resultado.getFloat(15));
                item.addProperty("malo", resultado.getFloat(16));
                item.addProperty("perdida", resultado.getFloat(17));
                item.addProperty("neto", resultado.getFloat(18));
                item.addProperty("observacion", resultado.getString(19));

                // se agrega un registro de la por cada itearción
                listaEntradaJson.add(item);
            }
            // almaceno el JsonArray en JsonObject, y le ponemos un nombre para que lo reciba
            // la petición ajax
            gson.add("listaEntradas", listaEntradaJson);

            declaracionPreparada.close();
            resultado.close();
            cerrarConexion();
            return gson;

        } catch (SQLException e) {
            cerrarConexion();
            return gson;
        }
    }

    /**
     *
     * @param listaId
     * @return devuelve todas las entradas que se envian en el array
     */
    public ArrayList<Entrada> buscarVariasEntradas(String[] listaId) {

        listaEntrada.clear();
        consultaEntrada = "";
        consultaEntrada = "SELECT * FROM entrada WHERE identrada=?";

        // se realizan consultas mientras hallan ids
        for (String id : listaId) {
            try {
                declaracionPreparada = getConnection().prepareStatement(consultaEntrada);
                declaracionPreparada.setInt(1, Integer.valueOf(id));
                resultado = declaracionPreparada.executeQuery();
                // recorre por cada consulta
                while (resultado.next()) {
                    // creo entrada nueva por cada iteración
                    Entrada entrada = new Entrada();

                    entrada.setIdEntrada(resultado.getInt(1));
                    entrada.setUsuarioSistema(resultado.getInt(2));
                    entrada.setIdProducto(resultado.getInt(3));
                    entrada.setResponsable(resultado.getInt(4));
                    entrada.setProveedor(resultado.getInt(5));
                    entrada.setRuta(resultado.getString(6));
                    entrada.setConductor(resultado.getInt(7));
                    entrada.setNumeroPlaca(resultado.getString(8));
                    entrada.setConsecutivo(resultado.getInt(9));
                    entrada.setFechaHora(resultado.getString(10));
                    entrada.setCaneca(resultado.getFloat(11));
                    entrada.setGalon(resultado.getFloat(12));
                    entrada.setKgRemisionado(resultado.getFloat(13));
                    entrada.setKgPlanta(resultado.getFloat(14));
                    entrada.setDiferencia(resultado.getFloat(15));
                    entrada.setProductoMalo(resultado.getFloat(16));
                    entrada.setPerdidaPesoSegundoProceso(resultado.getFloat(17));
                    entrada.setPesoNeto(resultado.getFloat(18));
                    entrada.setObservacion(resultado.getString(19));

                    listaEntrada.add(entrada);
                }
            } catch (SQLException e) {
                cerrarConexion();
                listaEntrada.clear();
                return listaEntrada;
            }
        }
        return listaEntrada;
    }

    /**
     * buscar una sola entrada
     *
     * @param idEntrada
     * @return
     */
    public ArrayList<Entrada> buscarUnaEntrada(String idEntrada) {

        listaEntrada.clear();
        consultaEntrada = "";
        consultaEntrada = "SELECT * FROM entrada WHERE identrada=?";
        Entrada miEntrada = new Entrada();
        miEntrada.setIdEntrada(Integer.valueOf(idEntrada));

        try {
            declaracionPreparada = getConnection().prepareStatement(consultaEntrada);
            declaracionPreparada.setInt(1, miEntrada.getIdEntrada());
            resultado = declaracionPreparada.executeQuery();

            while (resultado.next()) {

                miEntrada.setIdEntrada(resultado.getInt(1));
                miEntrada.setUsuarioSistema(resultado.getInt(2));
                miEntrada.setIdProducto(resultado.getInt(3));
                miEntrada.setResponsable(resultado.getInt(4));
                miEntrada.setProveedor(resultado.getInt(5));
                miEntrada.setRuta(resultado.getString(6));
                miEntrada.setConductor(resultado.getInt(7));
                miEntrada.setNumeroPlaca(resultado.getString(8));
                miEntrada.setConsecutivo(resultado.getInt(9));
                miEntrada.setFechaHora(resultado.getString(10));
                miEntrada.setCaneca(resultado.getFloat(11));
                miEntrada.setGalon(resultado.getFloat(12));
                miEntrada.setKgRemisionado(resultado.getFloat(13));
                miEntrada.setKgPlanta(resultado.getFloat(14));
                miEntrada.setDiferencia(resultado.getFloat(15));
                miEntrada.setProductoMalo(resultado.getFloat(16));
                miEntrada.setPerdidaPesoSegundoProceso(resultado.getFloat(17));
                miEntrada.setPesoNeto(resultado.getFloat(18));
                miEntrada.setObservacion(resultado.getString(19));

                listaEntrada.add(miEntrada);
            }

            declaracionPreparada.close();
            resultado.close();
            cerrarConexion();
            return listaEntrada;
        } catch (SQLException e) {
            cerrarConexion();
            return listaEntrada;
        }

    }

    /**
     *
     * @param miEntrada
     * @return
     */
    public boolean eliminarEntrada(Entrada miEntrada) {

        try {
            declaracionPreparada = getConnection().prepareStatement("DELETE FROM entrada WHERE identrada = ?");
            declaracionPreparada.setInt(1, miEntrada.getIdEntrada());
            declaracionPreparada.execute();
            declaracionPreparada.close();
            cerrarConexion();
            return true;
        } catch (SQLException e) {
            cerrarConexion();
            return false;
        }
    }
}
