/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.producto;

import entity.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductoDAO;

/**
 *
 * @author Crispancho
 */
@WebServlet(name = "ActualizarProducto", urlPatterns = {"/ActualizarProducto"})
public class ActualizarProducto extends HttpServlet {
    
    private ProductoDAO miDao = new ProductoDAO();
    
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
         * actualiza un producto
         */
        if (request.getParameter("btnActualizarProducto") != null) {
            
            Producto proUpdate = new Producto();
            
            proUpdate.setIdProducto(Integer.valueOf(request.getParameter("idProducto").trim()));
            proUpdate.setCodigo(request.getParameter("codigoProducto").trim());
            proUpdate.setNombre(request.getParameter("nombreProducto").trim());
            proUpdate.setObservacion(request.getParameter("observacion").trim());

            if (miDao.actualizarProducto(proUpdate)) {
                request.setAttribute("productoAgregado", "1");
            } else {
                request.setAttribute("productoAgregado", "0");
            }
        }

        /**
         * eliminar producto
         */
        if (request.getParameter("btnEliminarProducto") != null) {
            
            Producto proDelete = new Producto();
            
            proDelete.setIdProducto(Integer.valueOf(request.getParameter("idProducto")));

            if (miDao.eliminarProducto(proDelete)) {
                request.setAttribute("productoEliminado", "1");
            } else {
                request.setAttribute("productoEliminado", "0");
            }
        }
        
        request.getRequestDispatcher("buscarProducto.jsp").forward(request, response);
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
