package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.UserTransaction;
import model.AuthToken;
import model.Customer;

@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Customer customer = (Customer) request.getSession().getAttribute("loggedInCustomer");

        Cookie[] cookies = request.getCookies();
        String tokenValue = "";
        if (cookies != null) {
            System.out.println("Hi");
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("token")) {
                    System.out.println("HiHi");
                    tokenValue = cookie.getValue();
                }
            }

            if (!tokenValue.isEmpty()) {
                //find the Token from db using 
                AuthToken token = (AuthToken) em.createQuery("SELECT a FROM AuthToken a WHERE a.tokenValue = :tokenValue and a.customerId = :customerId").setParameter("tokenValue", tokenValue).setParameter("customerId", customer).getSingleResult();
                //delete Token from db      
                 try {
                    utx.begin();
                    if (!em.contains(token)) {
                        token = em.merge(token);
                    }
                    em.remove(token);
                    utx.commit();
                } catch (Exception ex) {
                    System.out.println(ex.getMessage() + "Error");
                }
                

                //remove Cookies
                Cookie cookie = new Cookie("selector", "");
                cookie.setMaxAge(0);
                response.addCookie(cookie);

            }
        }
        request.getSession().removeAttribute("loggedInCustomer");
        response.sendRedirect(request.getContextPath());
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
