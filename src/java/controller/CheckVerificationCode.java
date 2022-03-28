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
import model.Verification;
import helper.Error;

@WebServlet(name = "CheckVerificationCode", urlPatterns = {"/CheckVerificationCode"})
public class CheckVerificationCode extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String verificationCode = request.getParameter("verificationCode");
        System.out.println(email);
        List<Verification> vList = em.createQuery("SELECT v FROM Verification v WHERE  v.verificationCode = :verificationCode and v.email = :email").setParameter("verificationCode", verificationCode).setParameter("email", email).getResultList();
        int size = vList.size();
        System.out.println(size);
        HttpSession session = request.getSession();
        if (size > 0) {
            //check whether is expired or nto 

            //delete verification 
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
            session.removeAttribute("email");
            session.setAttribute("email", email);
            
            System.out.println(email+ "tseting");
            response.sendRedirect("registration.jsp");
        } else {
            Error err = new Error();
            err.setvCodeNotMatch(true);
            session.setAttribute("email", email);
            session.setAttribute("error",err);
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
