package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.transaction.UserTransaction;
import model.Customer;

@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 10,
        maxFileSize = 1024 * 1024 * 2 ,
        maxRequestSize = 1024 * 1024 * 3
)
public class UpdateProfile extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String confirmPassword = request.getParameter("confirmPassword");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        Part profilePicture = request.getPart("profilePicture");
        DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date dobDate = dateformat.parse(dob);
            System.out.println(dobDate);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(dob+ "First time");
       

//        Customer customer = new Customer(email, fullName, phone, password, new Date());
//        if (profilePicture.getSize() > 0 && profilePicture != null) {
//            long size  = profilePicture.getSize();
//            byte[] imageBytes = new byte[(int) size];
//            InputStream inputStream  = profilePicture.getInputStream();
//            inputStream.read(imageBytes);
//             inputStream.close();
//            customer.setCustomerImage(imageBytes);
//        }
//
//        try {
//            utx.begin();
//            em.persist(customer);
//            utx.commit();
//        } catch (Exception ex) {
//
//        }
//
//        HttpSession session = request.getSession();
//        List<Customer> customerList = em.createNamedQuery("Customer.findAll").getResultList();
//        session.setAttribute("customerList", customerList);
//        response.sendRedirect("displayCustomerImage.jsp");
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
