package controller;

import model.StaffService;
import model.Staff;
import java.io.*;
import java.util.logging.*;
import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.transaction.UserTransaction;

public class UpdateStaff extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            StaffService staffService = new StaffService(em);

            int id = Integer.parseInt(request.getParameter("staff_id"));
            String staff_name = request.getParameter("staff_name");
            String staff_email = request.getParameter("staff_email");
            String password = request.getParameter("password");//get value from form insert
            String position = request.getParameter("position");

            Staff staff = new Staff(id, staff_name, staff_email, password, position);//delete update view add

            utx.begin();
            boolean success = staffService.updateStaff(staff);
            utx.commit();
            
           
            HttpSession session = request.getSession();
            session.setAttribute("success", success);
            response.sendRedirect("secureManager/Staff/UpdateConfirmStaff.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AddStaff.class.getName()).log(Level.SEVERE, null, ex);
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
