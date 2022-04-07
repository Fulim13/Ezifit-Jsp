/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.CustomerService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;

public class sortCustomer extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            CustomerService customerService=new CustomerService(em);
            //create a session
            HttpSession session=request.getSession();
            
            String button=(String)session.getAttribute("button");
            int count_name=(int)session.getAttribute("count_name");
            int count_dob=(int)session.getAttribute("count_dob");
            int count_register_date=(int)session.getAttribute("count_register_date");
            List<Customer> custList=null;
            if(button.equals("Full Name")){
                if(count_name %2 !=0){
                    custList=customerService.findSortNameASC();
                }
                else if(count_name%2==0){
                    custList=customerService.findSortNameDESC();
            }
            }
            if(button.equals("Date Of Birth")){
                if(count_dob%2!=0){
                    custList=customerService.findSortDobASC();
                }
                else if(count_dob%2==0){
                    custList=customerService.findSortDobDESC();
            }
            }
            if(button.equals("Register Date")){
                if(count_register_date%2!=0){
                    custList=customerService.findSortRegisterDateASC();
                }
                else if(count_register_date%2==0){
                    custList=customerService.findSortRegisterDateDESC();
            }
            }
                session.setAttribute("custList", custList);
                response.sendRedirect("secureStaff/viewSort.jsp");
        }catch (Exception ex){
            
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
