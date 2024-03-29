//CHAN KAI LIN

package controller;

import java.io.IOException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Orders;
import model.Product;
import model.Review;


public class SaveProdReview extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");        
        
        try{
            HttpSession session = request.getSession();
            
            //Get required variables
            int orderID = (Integer)session.getAttribute("orderID");           
            String prodIDStr = request.getParameter("prodID");
            int prodID = Integer.parseInt(prodIDStr.replaceAll("[^0-9]", ""));           
            int rating = Integer.parseInt(request.getParameter("rating"));
            String comment = request.getParameter("comment");
            
            //Get order & product
            Orders order = em.find(Orders.class, orderID);
            Product product = em.find(Product.class, prodID);
            
            //Get current date
            long millis = System.currentTimeMillis();
            Date date = new java.sql.Date(millis);
            
            //Store review
            Review review = new Review(order, product, rating, comment, date);
            utx.begin();
            em.persist(review);
            utx.commit();            

            response.sendRedirect("ThanksForReviewProd.jsp");
           
        } catch(Exception ex){
            Logger.getLogger(SaveOrderReview.class.getName()).log(Level.SEVERE, null, ex);
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
