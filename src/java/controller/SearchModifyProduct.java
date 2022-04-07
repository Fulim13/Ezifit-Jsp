package controller;

import model.Product;
import model.ProductService;
import java.io.*;
import java.util.logging.*;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class SearchModifyProduct extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductService productService = new ProductService(em);
            HttpSession session = request.getSession();
            int prod_id = (Integer) session.getAttribute("prod_id");
            String button = (String) session.getAttribute("button");

            Product product = productService.findProductById(prod_id);

            session.setAttribute("product", product);
            if (button.equals("Delete")) {
                response.sendRedirect("secureManager/Product/DeleteConfirmationProduct.jsp");
            }else {
                response.sendRedirect("secureManager/Product/UpdateConfirmationProduct.jsp");
            }

        } catch (Exception ex) {
            Logger.getLogger(AddStaff.class.getName()).log(Level.SEVERE, null, ex);
        }
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
