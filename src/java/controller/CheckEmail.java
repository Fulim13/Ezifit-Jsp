/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Verification;
import helper.Error;
import helper.MailUtil;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import org.apache.commons.lang3.time.DateUtils;

@WebServlet(name = "CheckEmail", urlPatterns = {"/CheckEmail"})
public class CheckEmail extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        Error error = new Error();

        //Validation
        //check whether email is empty
        if (email.isEmpty()) {
            error.setIsError(true);
            error.setEmailEmpty(true);
        }

        //check whether email is in the database 
        Query queryEmail = em.createNamedQuery("Customer.findByEmail").setParameter("email", email);
        List<Customer> customer1 = queryEmail.getResultList();
        if (customer1.size() > 0) {
            error.setIsError(true);
            error.setEmailRedundant(true);
        }

        //if user do not enter correct email - back to signup
        if (error.isIsError()) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("error", error);
            response.sendRedirect("signup.jsp");
        } else {
            //get all the verification code from the database
            List<Verification> verficationList = em.createNamedQuery("Verification.findAll", Verification.class).getResultList();

            //generate 6 verification code
            Random rnd = new Random();
            int number = rnd.nextInt(999999);

            // this will convert any number sequence into 6 character.
            String verificationCode = String.format("%06d", number);

            int addMinuteTime = 10;
            Date targetTime = new Date();
            System.out.println("Before Adding : " + targetTime);
            targetTime = DateUtils.addMinutes(targetTime, addMinuteTime); // add minute
            System.out.println("After adding targetTime : " + targetTime);
            Verification verification = new Verification(verificationCode, targetTime, targetTime, email);
            try {
                utx.begin();
                em.persist(verification);
                utx.commit();
            } catch (Exception ex) {

            }

            try {
                MailUtil.sendMail(email, "noreplyezifit@gmail.com", "Ezifit Verification Code", "Verification Code: " + verificationCode + "\n\nThis Verificaticode will expired in 10 mins", true);
            } catch (MessagingException e) {
                System.out.println(e.getMessage());
            }
            HttpSession session = request.getSession();
            session.removeAttribute("email");
            
            session.setAttribute("email", email);
            response.sendRedirect("signupWithCode.jsp");

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
