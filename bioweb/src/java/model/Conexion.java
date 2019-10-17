package model;

import entity.Entrada;
import entity.Persona;
import entity.Salida;
import entity.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Crispancho
 */
public class Conexion {

    private Connection conn = null;

    // conectra db
    public Connection getConnection() {

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/bioweb?user=root&password=Colombia.123");
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Error Conexión " + e.getMessage());
        }

        return conn;
    }

    // cerrar db
    public void cerrarConexion() {
        try {
            conn.close();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        
        int contador = 1;
        while (contador <= 31) {       
            
            for (int i = 0; i < 20; i++) {
            
           Conexion.salid(contador);
        }
            contador +=1;
        }

        
    }

    public static void agregarPersona() {

        Persona miPersona = new Persona();
        miPersona.setNombre("ramon valdez");
        miPersona.setTipoPersona("empleado");
        miPersona.setTipoDocumento("cc");
        miPersona.setNumeroDocumento("115298632");
        miPersona.setDireccion("calle 89");
        miPersona.setTelefono("223423");
        miPersona.setCorreo("erik@t.com");
        miPersona.setNombreContacto("hernan ramirez");
        miPersona.setNumeroContacto("3005896963");

        PersonaDAO miDAO = new PersonaDAO();
        if (miDAO.agregarPersona(miPersona)) {
            System.out.println("persona agregada");
        } else {
            System.out.println("persona no agregada");
        }
    }

    public static void actualizarPersona() {

        Persona miPersona = new Persona();
        miPersona.setIdPersona(89);
        miPersona.setNombre("ramon valdez");
        miPersona.setTipoPersona("empleado");
        miPersona.setTipoDocumento("cc");
        miPersona.setNumeroDocumento("115298632");
        miPersona.setDireccion("calle 89");
        miPersona.setTelefono("223423");
        miPersona.setCorreo("rmon@t.com");
        miPersona.setNombreContacto("hernan ramirez");
        miPersona.setNumeroContacto("4440000");

        PersonaDAO miDAO = new PersonaDAO();
        if (miDAO.actualizarPersona(miPersona)) {
            System.out.println("persona actualizada");
        }

    }

    public static void eliminarPersona() {
        Persona miPersona = new Persona();
        miPersona.setIdPersona(6);

        PersonaDAO miDAO = new PersonaDAO();
        if (miDAO.eliminarPersona(miPersona)) {
            System.out.println("Persona eliminada");
        }
    }

    public static void listarperson() {

        PersonaDAO miDAO = new PersonaDAO();
        System.out.println(miDAO.buscarPersona("empleado"));
    }

    public static void modificarUser() {

        UsuarioDAO miUsuarioDAO = new UsuarioDAO();
        Usuario miUsuario = new Usuario();
        miUsuario.setIdUsuario(4);
        miUsuario.setNombre("Robert Camilo Valdés Ortiz");
        miUsuario.setTipoUsuario("admin");
        miUsuario.setTipoDocumento("CC");
        miUsuario.setNumeroDocumento("01010110");
        miUsuario.setDireccion("calle 4 # 45 belén fatima");
        miUsuario.setTelefono("4414141 - 3008795854");
        miUsuario.setCorreo("robert@r.com");
        miUsuario.setLoguin("robert");
        miUsuario.setClave("1234");

        if (miUsuarioDAO.eliminarUsuario(miUsuario)) {
            System.out.println("ok");
        } else {
            System.out.println("fail");
        }
    }

    public static void entra(int dia) {
        Entrada entrada = new Entrada();
        EntradaDAO miDAO = new EntradaDAO();

        entrada.setIdEntrada(48);
        entrada.setUsuarioSistema(2);
        entrada.setIdProducto(2);
        entrada.setResponsable(50);
        entrada.setProveedor(75);
        entrada.setRuta("pasto");
        entrada.setConductor(49);
        entrada.setNumeroPlaca("00JG4");
        entrada.setConsecutivo(180);
        entrada.setFechaHora("2019-05-" +dia+ " 16:59:00");
        entrada.setCaneca(3.0f);
        entrada.setGalon(3.0f);
        entrada.setKgRemisionado(510.43f);
        entrada.setKgPlanta(521.43f);
        entrada.setDiferencia(3);
        entrada.setPerdidaPesoSegundoProceso(12.5f);
        entrada.setProductoMalo(10.3f);
        entrada.setPesoNeto(3);
        entrada.setObservacion("nueva");
        System.out.println(miDAO.agregarEntrada(entrada));
    }

    public static void salid(int dia) {

        Salida s = new Salida();
        s.setIdSalida(3);
        s.setUsuarioSistema(15);
        s.setIdProducto(35);
        s.setResponsable(85);
        s.setCliente(27);
        s.setConductor(83);
        s.setNumeroPlaca("DFD45");
        s.setConsecutivo(19);
        s.setFechaHora("2019-01-"+dia+" 11:30:00");
        s.setCaneca(34.5f);
        s.setGalon(126.5f);
        s.setPesoBruto(415.6f);
        s.setTara(4.2f);
        s.setPesoNeto(3.4f);
        s.setGradosBrix(16.3f);
        s.setCantidadBulto(3f);
        s.setObservacion("salida full");

        SalidaDAO sDao = new SalidaDAO();

        System.out.println(sDao.agregarSalida(s));

    }
}
