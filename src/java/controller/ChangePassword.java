package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import helper.Error;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Customer;

@WebServlet(name = "ChangePassword", urlPatterns = {"/ChangePassword"})
public class ChangePassword extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        HttpSession session = request.getSession();
        Error error = new Error();
        //password cannot be emtpy
        //password must follow certain format
        if (password.trim().length() == 0 || password.length() < 7) {
            error.setIsError(true);
            error.setPasswordNotFollowRequirement(true);
        }

        char[] passwordChar = password.toCharArray();
        boolean gotLetter = false;
        boolean gotDigit = false;
        for (int i = 0; i < passwordChar.length; i++) {

            if (Character.isLetter(passwordChar[i])) {
                gotLetter = true;
            }

            if (Character.isDigit(passwordChar[i])) {
                gotDigit = true;
            }

        }
        if (!gotLetter || !gotDigit) {
            error.setIsError(true);
            error.setPasswordNotFollowRequirement(true);
        }

        //two password must same 
        if (!password.equals(confirmPassword)) {
            error.setIsError(true);
            error.setPasswordNotSame(true);
        }
        // if fail the validation - redirect back to changePassword.jsp
        if (error.isIsError()) {
            session.setAttribute("error", error);
            session.setAttribute("email", email);
            response.sendRedirect("changePassword.jsp");
        } else {
            //get the customer object using email
            Query queryEmail = em.createNamedQuery("Customer.findByEmail").setParameter("email", email);
            List<Customer> customer1ist = queryEmail.getResultList();
            if (customer1ist.size() > 0) {
                Customer customer = customer1ist.get(0);
                //save the new password in the database
                customer.setPassword(password);
                //update database
                try {
                    utx.begin();
                    em.merge(customer);
                    utx.commit();
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }
                session.removeAttribute("email");
                //redirect to log in page
                response.sendRedirect("login.jsp");
            }

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
