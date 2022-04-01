package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import helper.Error;
import helper.MailUtil;
import java.util.Date;
import java.util.List;
import java.util.Random;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.Customer;
import model.Verification;
import org.apache.commons.lang3.time.DateUtils;

@WebServlet(name = "CheckEmailInDB", urlPatterns = {"/CheckEmailInDB"})
public class CheckEmailInDB extends HttpServlet {
@PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Server side Validation
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        Error error = new helper.Error();
        //email cannot be empty
        if (email.isEmpty()) {
            error.setIsError(true);
            error.setEmailEmpty(true);
        }
        //email must in the db
        Query queryEmail = em.createNamedQuery("Customer.findByEmail").setParameter("email", email);
        List<Customer> customer1 = queryEmail.getResultList();
        if (customer1.isEmpty()) {
            error.setIsError(true);
            error.setEmailNotFound(true);
        }

        //if got error redirect back to forgotPassword
        //send with error object and user entered email
        if(error.isIsError()){
            session.setAttribute("error", error);
            session.setAttribute("email", email);
            response.sendRedirect("forgotPassword.jsp");
        } else {
            //get all the verification code from the database
            List<Verification> vList = em.createQuery("SELECT v FROM Verification v WHERE v.email = :email").setParameter("email", email).getResultList();
            //delete verification 
            int size = vList.size();
            if (size > 0) {
                Verification verification = vList.get(0);
                try {
                    utx.begin();
                    if (!em.contains(verification)) {
                        verification = em.merge(verification);
                    }
                    em.remove(verification);
                    utx.commit();
                } catch (Exception ex) {
                    System.out.println(ex.getMessage() + "Error");
                }
            }

            //generate 6 verification code
            Random rnd = new Random();
            int number = rnd.nextInt(999999);

            String verificationCode = String.format("%06d", number);

            int addMinuteTime = 10;
            Date targetTime = new Date();
            targetTime = DateUtils.addMinutes(targetTime, addMinuteTime); // add minute
            Verification verification = new Verification(verificationCode, targetTime, email);
            try {
                utx.begin();
                em.persist(verification);
                utx.commit();
            } catch (Exception ex) {

            }

            try {
                MailUtil.sendMail(email, "noreplyezifit@gmail.com", "Ezifit Verification Code", "<div>Verification Code: " + verificationCode + "</div>" + "<div>This Verification code will expired in 10 mins</div>", true);
            } catch (MessagingException e) {
                System.out.println(e.getMessage());
            }
            session.removeAttribute("email");

            session.setAttribute("verifiedEmail", email);
            response.sendRedirect("changePasswordWithCode.jsp");

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
