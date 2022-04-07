/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.CartItem;
import model.CartItemService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class SearchProductSales extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        try {
            
            HttpSession session = request.getSession();
            
            String category = (String)session.getAttribute("category");
            String selection = (String)session.getAttribute("selection");
            String button = (String) session.getAttribute("button");
            
            
                if (category.length() == 0) {
                out.println("Category is required.");
            } else {
            if(request.getParameter("category") != null)
            {
                CartItemService cartItemService = new CartItemService(em);
//                CartItem cartItem = cartItemService.findCartItemByCategory(category);
                List<CartItem> cartItemList = (List<CartItem>)session.getAttribute("cartItemList");
                List<CartItem> categoryList = new ArrayList<CartItem>();
                for(int index = 0; index < cartItemList.size(); index++){
                session.setAttribute("categoryList", categoryList);
            }
            }
            
            if(button.equals("Previous")){
                response.sendRedirect("index.html");
            } else {
               if(selection.equals("high")){
                    response.sendRedirect("SortFromHigh.jsp");
               } else {
                    response.sendRedirect("SortFromLow.jsp");
               }
            }
                }
        }catch (Exception ex) {
            Logger.getLogger(SearchProductSales.class.getName()).log(Level.SEVERE, null, ex);
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
