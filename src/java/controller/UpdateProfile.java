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
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
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
import helper.Error;

@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 10,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 11
)
public class UpdateProfile extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //get all the field from the use submission form
        String fullName = request.getParameter("fullName");
//        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
//        String password = request.getParameter("password");
//        String confirmPassword = request.getParameter("confirmPassword");
        Part profilePicture = request.getPart("profilePicture");

        //validation for all the field
        Error error = new helper.Error();
        //fullName cannot be empty
        if (fullName.isEmpty() || fullName.trim().length() == 0) {
            error.setIsError(true);
            error.setFullNameEmpty(true);
        }
        //phone cannot be empty
        if (phone.isEmpty() || fullName.trim().length() == 0) {
            error.setIsError(true);
            error.setPhoneNoEmpty(true);
        }
        //phone of customer cannot duplicate to other customer phone
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("loggedInCustomer");
        String customerEmail = customer.getEmail();
        Query queryExceptCustomer = em.createQuery("SELECT c FROM Customer c WHERE c.email != :email").setParameter("email", customerEmail);
        List<Customer> customerList = queryExceptCustomer.getResultList();
        for (Customer cust : customerList) {
            System.out.println(cust.getPhone());
            if (phone.equals(cust.getPhone())) {
                error.setIsError(true);
                error.setPhoneNoRedundant(true);
            }
        }

        //dob must need to be a valid string
        Pattern p = Pattern.compile("\\d{4}-\\d{2}-\\d{2}");
        if (!p.matcher(dob).matches() && !dob.isEmpty()) {
            error.setIsError(true);
            error.setDobFormatErr(true);
        }

        //redirect back to profile page with error
        if (error.isIsError()) {
            session.setAttribute("error", error);
            System.out.println("Hi");
            response.sendRedirect("profile.jsp");
        } else{
            
//        // get the user data from db 
//        HttpSession session = request.getSession();
//        Customer customer = (Customer)session.getAttribute("loggedInCustomer");
//        String customerEmail = customer.getEmail();
        //get Customer object from the database
        Query querySessionCustomer = em.createQuery("SELECT c FROM Customer c WHERE c.email = :email").setParameter("email", customerEmail);
        List<Customer> sessionCustomerList = querySessionCustomer.getResultList();

        if (sessionCustomerList.size() > 0) {
            Customer sessionCustomerObj = sessionCustomerList.get(0);

            //set fullname
            sessionCustomerObj.setFullname(fullName);
            //set phone No
            sessionCustomerObj.setPhone(phone);
            //set address
            sessionCustomerObj.setAddress(address);
            //convert String date in html to JAVA Date (to store in db)
                    DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date dobDate = dateformat.parse(dob);
                System.out.println(dobDate);
                sessionCustomerObj.setDob(dobDate);
            } catch (ParseException ex) {
                Logger.getLogger(UpdateProfile.class.getName()).log(Level.SEVERE, null, ex);
            }

            //convert user uploaded image to the format that db accept
            if (profilePicture.getSize() > 0 && profilePicture != null) {
                long size = profilePicture.getSize();
                byte[] imageBytes = new byte[(int) size];
                InputStream inputStream = profilePicture.getInputStream();
                inputStream.read(imageBytes);
                inputStream.close();
                sessionCustomerObj.setCustomerImage(imageBytes);
            }

            //update database
            try {
                utx.begin();
                em.merge(sessionCustomerObj);
                utx.commit();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
            //update session loggedInCustomer 
            session.setAttribute("loggedInCustomer", sessionCustomerObj);
            response.sendRedirect("profile.jsp");
        } else {
//            response.sendRedirect("profile.jsp");
        }
        }


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
