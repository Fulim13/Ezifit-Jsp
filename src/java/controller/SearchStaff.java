package controller;

import model.StaffService;
import model.Staff;
import java.io.*;
import java.util.logging.*;
import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class SearchStaff extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            StaffService staffService = new StaffService(em);
            HttpSession session = request.getSession();
            int staff_id = (Integer) session.getAttribute("staff_id");
            String button = (String) session.getAttribute("button");

            Staff staff = staffService.findStaffById(staff_id);

            session.setAttribute("staff", staff);
            if (button.equals("Delete")) {
                response.sendRedirect("secureManager/Staff/DeleteConfirmationStaff.jsp");
            } else {
                response.sendRedirect("secureManager/Staff/UpdateConfirmationStaff.jsp");
            }
  
        } catch (Exception ex) {
            Logger.getLogger(AddStaff.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
