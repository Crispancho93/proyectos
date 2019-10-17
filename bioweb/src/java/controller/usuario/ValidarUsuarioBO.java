package controller.usuario;

import entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import model.*;

/**
 *
 * @author Crispancho
 *
 */
@WebServlet(name = "ValidarUsuarioBO", urlPatterns = {"/ValidarUsuarioBO"})

public class ValidarUsuarioBO extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=iso-8859-1");
        PrintWriter out = response.getWriter();

        // encargado de redireccionar 
        RequestDispatcher transportador;

        // creo objetos necesarios
        Usuario miUsuario = new Usuario();
        UsuarioDAO miDao = new UsuarioDAO();

        // validamos que ha recibido un apetición
        if (request.getParameter("enviar") != null) {

            //  establezco valores, que llegan de la vista 
            miUsuario.setLoguin(request.getParameter("usuario").trim());
            miUsuario.setClave(request.getParameter("clave").trim());

            /*
                * retorna un array de usuario, con usuario, clave y tipo de usuario
                * si el usuario que se ingreso en la vista existe en la db.
                * de lo contrario retorna un array vacío
             */
            // si el arreglo no esta vacío, es por que exixte el usuario en la db
            if (!miDao.validarUsuario(miUsuario).isEmpty()) {

                /*
                    * si el arreglo tiene valores es por que exite el usuario en la db
                    * y procedo a enviar parametros a la vista, el 1 es por que existe
                    * el usuario.
                    * envio el tipo de usuario para validar el perfil del mismo
                 */
                request.setAttribute("v", "1");

                // envío el nombre del usuario
                request.setAttribute("usuario", request.getParameter("usuario"));

                // envío el tipo de usuario
                request.setAttribute("tipoUsuario", miDao.validarUsuario(miUsuario).get(0));

            } else {

                // envío el 0 por que no existe el usuario en la db
                request.setAttribute("v", "0");

            }
        }

        // le decimos adonde va enviar las respuestas
        transportador = request.getRequestDispatcher("loguin.jsp");
        transportador.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
