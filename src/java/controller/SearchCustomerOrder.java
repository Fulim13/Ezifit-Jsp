/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import model.Orders;

public class SearchCustomerOrder extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            List<Orders> cust_orders = em.createNamedQuery("Orders.findAll", Orders.class).getResultList();
            int cust_id = Integer.parseInt(request.getParameter("cust_id"));
            List<Customer> cust_record=em.createNamedQuery("Customer.findAll").getResultList();
            HttpSession session = request.getSession();

            for (int i = 0; i < cust_orders.size(); i++) {
                if (cust_orders.get(i).getCustomerId().getCustomerId() != cust_id) {
                    cust_orders.remove(i);
                    i--;
                }
            }
            
            //remove customer order without this id
            for(int i=0;i<cust_record.size();i++){
                if(cust_record.get(i).getCustomerId()!=cust_id){
                    cust_record.remove(i);
                    i--;
                }
            }
            session.setAttribute("cust_record", cust_record);
            session.setAttribute("cust_orders", cust_orders);
            response.sendRedirect("secureStaff/customer_order.jsp");
            
//            
           
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
            protected void doGet
            (HttpServletRequest request, HttpServletResponse response)
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
            protected void doPost
            (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                processRequest(request, response);
            }

            /**
             * Returns a short description of the servlet.
             *
             * @return a String containing servlet description
             */
            @Override
            public String getServletInfo
            
                () {
        return "Short description";
            }// </editor-fold>

        }
