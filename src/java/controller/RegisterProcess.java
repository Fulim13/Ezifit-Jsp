package controller;

import model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import helper.Error;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.persistence.*;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

@WebServlet(name = "RegisterProcess", urlPatterns = {"/RegisterProcess"})
public class RegisterProcess extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Customer entered data
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String phoneNo = request.getParameter("phoneNo");
        String password = request.getParameter("password");
        Customer customer = new Customer(email, fullName, phoneNo, password, new Date());

        Error error = new Error();

        //check fullname is emtpy
        if (fullName.isEmpty()) {
            error.setIsError(true);
            error.setFullNameEmpty(true);
        }

        //chekc phone No is empty
        if (phoneNo.isEmpty()) {
            error.setIsError(true);
            error.setPhoneNoEmpty(true);
        }

        //Check phone no is in the database
        Query queryPhone = em.createNamedQuery("Customer.findByPhone").setParameter("phone", phoneNo);
        List<Customer> customer2 = queryPhone.getResultList();
        if (customer2.size() > 0) {
            error.setIsError(true);
            error.setPhoneNoRedundant(true);
        }

        //Check password streght
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
        

        if (error.isIsError()) {
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            session.setAttribute("error", error);
            response.sendRedirect("registration.jsp");
        } else {
            try {

                utx.begin();
                em.persist(customer);
                utx.commit();

                HttpSession session = request.getSession();
                session.removeAttribute("email");
                session.removeAttribute("customer");
                session.setAttribute("loggedInCustomer", customer);

                response.sendRedirect(request.getContextPath());
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
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
