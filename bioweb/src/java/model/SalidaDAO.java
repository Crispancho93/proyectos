package model;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import entity.Salida;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Crispancho
 */
public class SalidaDAO extends Conexion {

    private PreparedStatement declaracionPreparada;
    private ResultSet resultado;
    private String consultaSalida;
    private ArrayList<Salida> listaSalida = new ArrayList<Salida>();

    /**
     * agregar salida
     *
     * @param miSalida
     * @return
     */
    public boolean agregarSalida(Salida miSalida) {

        consultaSalida = "";
        consultaSalida = "INSERT INTO salida\n"
                + "(usuario_sistema, idproducto, responsable, cliente, conductor, numero_placa, consecutivo, fecha_hora, caneca, galon, peso_bruto, tara, peso_neto, grados_brix, cantidad_bulto, observacion)\n"
                + "VALUES\n"
                + "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        try {
            declaracionPreparada = getConnection().prepareStatement(consultaSalida);
            declaracionPreparada.setInt(1, miSalida.getUsuarioSistema());
            declaracionPreparada.setInt(2, miSalida.getIdProducto());
            declaracionPreparada.setInt(3, miSalida.getResponsable());
            declaracionPreparada.setInt(4, miSalida.getCliente());
            declaracionPreparada.setInt(5, miSalida.getConductor());
            declaracionPreparada.setString(6, miSalida.getNumeroPlaca());
            declaracionPreparada.setInt(7, miSalida.getConsecutivo());
            declaracionPreparada.setString(8, miSalida.getFechaHora());
            declaracionPreparada.setFloat(9, miSalida.getCaneca());
            declaracionPreparada.setFloat(10, miSalida.getGalon());
            declaracionPreparada.setFloat(11, miSalida.getPesoBruto());
            declaracionPreparada.setFloat(12, miSalida.getTara());
            declaracionPreparada.setFloat(13, miSalida.getPesoNeto());
            declaracionPreparada.setFloat(14, miSalida.getGradosBrix());
            declaracionPreparada.setFloat(15, miSalida.getCantidadBulto());
            declaracionPreparada.setString(16, miSalida.getObservacion());
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
     * actualizar salida
     *
     * @param miSalida
     * @return
     */
    public boolean actualizarSalida(Salida miSalida) {

        consultaSalida = "";
        consultaSalida = "UPDATE salida\n"
                + "SET usuario_sistema = ?,\n"
                + "    idproducto = ?,\n"
                + "    responsable = ?,\n"
                + "    cliente = ?,\n"
                + "    conductor = ?,\n"
                + "    numero_placa = ?,\n"
                + "    consecutivo = ?,\n"
                + "    fecha_hora = ?,\n"
                + "    caneca = ?,\n"
                + "    galon = ?,\n"
                + "    peso_bruto = ?,\n"
                + "    tara = ?,\n"
                + "    peso_neto = ?,\n"
                + "    grados_brix = ?,\n"
                + "    cantidad_bulto = ?,\n"
                + "    observacion = ?\n"
                + "WHERE idsalida = ?";

        try {
            declaracionPreparada = getConnection().prepareStatement(consultaSalida);
            declaracionPreparada.setInt(1, miSalida.getUsuarioSistema());
            declaracionPreparada.setInt(2, miSalida.getIdProducto());
            declaracionPreparada.setInt(3, miSalida.getResponsable());
            declaracionPreparada.setInt(4, miSalida.getCliente());
            declaracionPreparada.setInt(5, miSalida.getConductor());
            declaracionPreparada.setString(6, miSalida.getNumeroPlaca());
            declaracionPreparada.setInt(7, miSalida.getConsecutivo());
            declaracionPreparada.setString(8, miSalida.getFechaHora());
            declaracionPreparada.setFloat(9, miSalida.getCaneca());
            declaracionPreparada.setFloat(10, miSalida.getGalon());
            declaracionPreparada.setFloat(11, miSalida.getPesoBruto());
            declaracionPreparada.setFloat(12, miSalida.getTara());
            declaracionPreparada.setFloat(13, miSalida.getPesoNeto());
            declaracionPreparada.setFloat(14, miSalida.getGradosBrix());
            declaracionPreparada.setFloat(15, miSalida.getCantidadBulto());
            declaracionPreparada.setString(16, miSalida.getObservacion());
            declaracionPreparada.setInt(17, miSalida.getIdSalida());
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
     * devuelve todas las salidas en formato json
     *
     * @param fechaInicial
     * @param fechaFinal
     * @return
     */
    public JsonObject buscarSalida(String fechaInicial, String fechaFinal) {

        JsonObject objetoJson = new JsonObject();
        JsonArray arrayJson = new JsonArray();
        consultaSalida = "";
        consultaSalida = "SELECT \n"
                + "    s.idsalida,\n"
                + "    usu.loguin,\n"
                + "    pro.nombre,\n"
                + "    resp.nombre,\n"
                + "    clie.nombre,\n"
                + "    con.nombre,\n"
                + "    s.numero_placa,\n"
                + "    s.consecutivo,\n"
                + "    s.fecha_hora,\n"
                + "    s.caneca,\n"
                + "    s.galon,\n"
                + "    s.peso_bruto,\n"
                + "    s.tara,\n"
                + "    s.peso_neto,\n"
                + "    s.grados_brix,\n"
                + "    s.cantidad_bulto,\n"
                + "    s.observacion\n"
                + "    \n"
                + "FROM salida s\n"
                + "    INNER JOIN usuario AS usu ON s.usuario_sistema = usu.idusuario \n"
                + "    INNER JOIN producto AS pro ON s.idproducto = pro.idproducto\n"
                + "    INNER JOIN persona AS resp ON s.responsable = resp.idpersona\n"
                + "    INNER JOIN persona AS clie ON s.cliente = clie.idpersona\n"
                + "	INNER JOIN persona AS con ON s.conductor = con.idpersona \n"
                + "WHERE DATE(s.fecha_hora) BETWEEN ? AND ? ORDER BY s.idsalida DESC";

        try {
            declaracionPreparada = getConnection().prepareStatement(consultaSalida);
            declaracionPreparada.setString(1, fechaInicial);
            declaracionPreparada.setString(2, fechaFinal);
            resultado = declaracionPreparada.executeQuery();

            while (resultado.next()) {

                // creo un objeto para cada iteración
                JsonObject item = new JsonObject();

                // se guarda una columna espesifica de la db por cada iteración
                item.addProperty("idsalida", "<a href=\"actualizarSalida.jsp?salidaSeleccionada="+ resultado.getInt(1) +"\" id=\" " + resultado.getInt(1) + "\" class=\"btn btn-warning btn-sm\" name=\"btnBuscarSalida\" value=\" " + resultado.getInt(1) + "\">EDITAR <i class=\"fas fa-pencil-alt\"></i></a>"    + resultado.getInt(1));
                item.addProperty("calculo", "<button type=\"submit\" class=\"btn btn-info btn-sm\" name=\"btncalcular\">SUMA <i class=\"fas fa-calculator\"></i></button> " + "<input type=\"checkbox\" name=\"checkId\" class=\"btn btn-primary btn-sm mr-1\" value=\"" + resultado.getInt(1) + "\">");
                item.addProperty("nombreUsuario", resultado.getString(2));
                item.addProperty("nombreProducto", resultado.getString(3));
                item.addProperty("nombreResponsable", resultado.getString(4));
                item.addProperty("nombreCliente", resultado.getString(5));
                item.addProperty("nombreConductor", resultado.getString(6));
                item.addProperty("numeroPlaca", resultado.getString(7));
                item.addProperty("consecutivo", resultado.getInt(8));
                item.addProperty("fechaHora", resultado.getString(9));
                item.addProperty("caneca", resultado.getFloat(10));
                item.addProperty("galon", resultado.getFloat(11));
                item.addProperty("pesoBruto", resultado.getFloat(12));
                item.addProperty("tara", resultado.getFloat(13));
                item.addProperty("pesoNeto", resultado.getFloat(14));
                item.addProperty("gradosBrix", resultado.getFloat(15));
                item.addProperty("cantidadBulto", resultado.getFloat(16));
                item.addProperty("observacion", resultado.getString(17));

                // se agrega un registro de la por cada itearción
                arrayJson.add(item);
            }

            // almaceno el JsonArray en JsonObject, y le ponemos un nombre para que lo reciba
            // la petición ajax
            objetoJson.add("listaSalidas", arrayJson);

            declaracionPreparada.close();
            resultado.close();
            cerrarConexion();
            return objetoJson;
        } catch (SQLException e) {
            cerrarConexion();
            return null;
        }
    }

    /**
     * retorna todas las salidas enviadas en el array string, en caso de no
     * poder retorna un array de salida vacio
     *
     * @param listaId
     * @return
     */
    public ArrayList<Salida> buscarVariasSalidas(String[] listaId) {

        listaSalida.clear();
        consultaSalida = "";
        consultaSalida = "SELECT * FROM salida WHERE idsalida = ?";

        // recorro mientras hallan id
        for (String id : listaId) {

            try {
                declaracionPreparada = getConnection().prepareStatement(consultaSalida);
                declaracionPreparada.setInt(1, Integer.parseInt(id));
                resultado = declaracionPreparada.executeQuery();

                // por cada iteración crea una salida y la agrega array de salida
                while (resultado.next()) {

                    Salida salida = new Salida();
                    salida.setIdSalida(resultado.getInt(1));
                    salida.setUsuarioSistema(resultado.getInt(2));
                    salida.setIdProducto(resultado.getInt(3));
                    salida.setResponsable(resultado.getInt(4));
                    salida.setCliente(resultado.getInt(5));
                    salida.setConductor(resultado.getInt(6));
                    salida.setNumeroPlaca(resultado.getString(7));
                    salida.setConsecutivo(resultado.getInt(8));
                    salida.setFechaHora(resultado.getString(9));
                    salida.setCaneca(resultado.getFloat(10));
                    salida.setGalon(resultado.getFloat(11));
                    salida.setPesoBruto(resultado.getFloat(12));
                    salida.setTara(resultado.getFloat(13));
                    salida.setPesoNeto(resultado.getFloat(14));
                    salida.setGradosBrix(resultado.getFloat(15));
                    salida.setCantidadBulto(resultado.getFloat(16));
                    salida.setObservacion(resultado.getString(17));

                    listaSalida.add(salida);
                }

                declaracionPreparada.close();
                resultado.close();

            } catch (SQLException e) {

            }
        }

        cerrarConexion();
        return listaSalida;
    }

    /**
     * lista una salida por id
     *
     * @param id
     * @return
     */
    public ArrayList<Salida> buscaUnaSalida(int id) {

        listaSalida.clear();
        consultaSalida = "";
        consultaSalida = "SELECT * FROM salida WHERE idsalida = ?";

        try {
            declaracionPreparada = getConnection().prepareStatement(consultaSalida);
            declaracionPreparada.setInt(1, id);
            resultado = declaracionPreparada.executeQuery();

            while (resultado.next()) {
                
                Salida salida = new Salida();
                salida.setIdSalida(resultado.getInt(1));
                salida.setUsuarioSistema(resultado.getInt(2));
                salida.setIdProducto(resultado.getInt(3));
                salida.setResponsable(resultado.getInt(4));
                salida.setCliente(resultado.getInt(5));
                salida.setConductor(resultado.getInt(6));
                salida.setNumeroPlaca(resultado.getString(7));
                salida.setConsecutivo(resultado.getInt(8));
                salida.setFechaHora(resultado.getString(9));
                salida.setCaneca(resultado.getFloat(10));
                salida.setGalon(resultado.getFloat(11));
                salida.setPesoBruto(resultado.getFloat(12));
                salida.setTara(resultado.getFloat(13));
                salida.setPesoNeto(resultado.getFloat(14));
                salida.setGradosBrix(resultado.getFloat(15));
                salida.setCantidadBulto(resultado.getFloat(16));
                salida.setObservacion(resultado.getString(17));

                listaSalida.add(salida);
            }

            declaracionPreparada.close();
            cerrarConexion();
            
        } catch (SQLException e) {
            listaSalida.clear();
            cerrarConexion();
        }

        return listaSalida;
    }
    
    /**
     * eliminar una salida
     * @param id
     * @return 
     */
    public boolean eliminarSalida(int id){
        
        consultaSalida = "";
        consultaSalida = "DELETE FROM salida WHERE idsalida = ?";
        
        try {
            declaracionPreparada = getConnection().prepareStatement(consultaSalida);
            declaracionPreparada.setInt(1, id);
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
