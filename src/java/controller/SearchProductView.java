package controller;

import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SearchProductView extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //To get search result
            List<Product> productList = em.createNamedQuery("Product.findAll", Product.class).getResultList();
            String search_for_product = request.getParameter("search_for_product").toUpperCase();
            List<Product> productList2 = new ArrayList<>();
            if (search_for_product != null) {
                for (int i = 0; i < productList.size(); i++) {
                    if (search_for_product.equalsIgnoreCase(productList.get(i).getProdId().toString()) || productList.get(i).getProdName().toUpperCase().contains(search_for_product) || productList.get(i).getProdName().equalsIgnoreCase(search_for_product)) {
                        productList2.add(productList.get(i));
                    }
                }
                productList = productList2;

            }

            HttpSession session = request.getSession();
            session.setAttribute("productList", productList);
            response.sendRedirect("secureStaff/DisplayProductCategoryList.jsp");
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
