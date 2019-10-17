/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.usuario;

import entity.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UsuarioDAO;

/**
 *
 * @author Crispancho
 */
@WebServlet(name = "IngresoUsuario", urlPatterns = {"/IngresoUsuario"})
public class IngresoUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=iso-8859-1");
        PrintWriter out = response.getWriter();
           
         // crearUsuarioSistema, creamos un usuario de sistema
        if (request.getParameter("btnAgregarUsuario") != null) {
            
            Usuario addUser = new Usuario();
            UsuarioDAO userDao = new UsuarioDAO();
            addUser.setNombre(request.getParameter("nombre").trim());
            addUser.setTipoUsuario(request.getParameter("tipoUsuario").trim());
            addUser.setTipoDocumento(request.getParameter("tipoDocumento").trim());
            addUser.setNumeroDocumento(request.getParameter("numeroDocumento").trim());
            addUser.setDireccion(request.getParameter("direccion").trim());
            addUser.setTelefono(request.getParameter("telefono").trim());
            addUser.setCorreo(request.getParameter("correo").trim());
            addUser.setLoguin(request.getParameter("loguin").trim());
            addUser.setClave(request.getParameter("clave").trim());

            // llamo al metodo para crear el usuario y lo valido
            if (userDao.agregarUsuario(addUser)) {
                request.setAttribute("usuarioCreado", "1");
                
            } else {
                request.setAttribute("usuarioCreado", "0");
               
            } 
        }
        
        request.getRequestDispatcher("crearUsuarioSistema.jsp").forward(request, response);
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
