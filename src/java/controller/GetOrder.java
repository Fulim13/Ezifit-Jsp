package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Customer;
import model.Orders;

@WebServlet(name = "GetOrder", urlPatterns = {"/GetOrder"})
public class GetOrder extends HttpServlet {

  @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
        // not enable the people whoe have not logged in , to profile page
        if (!loggedIn) {
            response.sendRedirect("login.jsp");
        }
        Customer loggedInCustomer = (Customer)session.getAttribute("loggedInCustomer");
        List <Orders> ordersList = em.createQuery("SELECT o FROM Orders o WHERE o.customerId = :customerId").setParameter("customerId", loggedInCustomer).getResultList();
         //Test Display sucessful
        for(Orders orders : ordersList){
            System.out.println(orders.getOrderId());
            System.out.println(orders.getOrderPrice());
        }
        session.setAttribute("ordersList", ordersList);
        response.sendRedirect("orders.jsp");
        
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
