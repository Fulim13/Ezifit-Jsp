/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Product;
import model.Search;
import model.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SearchStaffInformation extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Search search = new Search(em);
            String search_staff=request.getParameter("search_staff").toUpperCase();
            
             //To get search result
        List<Staff> staffList = em.createNamedQuery("Staff.findAll", Staff.class).getResultList(); 
        List<Staff> staffList2 = new ArrayList<>();
        if(search_staff != null){
            for(int i=0; i<staffList.size(); i++){           
                if(search_staff.equalsIgnoreCase(staffList.get(i).getStaffId().toString()) || staffList.get(i).getStaffName().toUpperCase().contains(search_staff) || staffList.get(i).getStaffName().equalsIgnoreCase(search_staff)){
                    staffList2.add(staffList.get(i));
                }
            }
            staffList = staffList2;
            
        }
            HttpSession session=request.getSession();
            session.setAttribute("staffList",staffList );
            response.sendRedirect("secureManager/Staff/DisplayStaffList.jsp");
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
