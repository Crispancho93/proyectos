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
@WebServlet(name = "ActualizarUsuario", urlPatterns = {"/ActualizarUsuario"})
public class ActualizarUsuario extends HttpServlet {
    
    private UsuarioDAO miDao = new UsuarioDAO();
    
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
           
        /**
         * actualizar usuario
         */
        if (request.getParameter("actualizarUsuario") != null) {
            
            Usuario updateUser = new Usuario();
           
            updateUser.setIdUsuario(Integer.valueOf(request.getParameter("idUsuario").trim()));
            updateUser.setNombre(request.getParameter("nombre").trim());
            updateUser.setTipoUsuario(request.getParameter("tipoUsuario").trim());
            updateUser.setTipoDocumento(request.getParameter("tipoDocumento").trim());
            updateUser.setNumeroDocumento(request.getParameter("numeroDocumento").trim());
            updateUser.setDireccion(request.getParameter("direccion").trim());
            updateUser.setTelefono(request.getParameter("telefono").trim());
            updateUser.setCorreo(request.getParameter("correo").trim());
            updateUser.setLoguin(request.getParameter("loguin").trim());
            updateUser.setClave(request.getParameter("clave").trim());

            if (miDao.actualizarUsuario(updateUser)) {
                request.setAttribute("usuarioActualizado", "1");
            } else {
                request.setAttribute("usuarioActualizado", "0");
            }
        }

        /**
         * eliminar usuario
         */
        if (request.getParameter("btnEliminarUsuario") != null) {
           
            Usuario deleteUser = new Usuario();
            deleteUser.setIdUsuario(Integer.valueOf(request.getParameter("idUsuario").trim()));
            
            if (miDao.eliminarUsuario(deleteUser)) {
                request.setAttribute("usuarioEliminado", "1");
            } else {
                request.setAttribute("usuarioEliminado", "0");
            }
        }
        
        request.getRequestDispatcher("buscarUsuarioSistema.jsp").forward(request, response);
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
