/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.CartItem;
import model.CartItemService;
import model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author User
 */
public class SalesRecord extends HttpServlet {

    @PersistenceContext EntityManager em;
   @Resource UserTransaction utx;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try  {
            HttpSession session = request.getSession();
            
            List<CartItem> cartItemList = em.createNamedQuery("CartItem.findAll", CartItem.class).getResultList();
            List<CartItem> cartItemList2 = em.createNamedQuery("CartItem.findAll", CartItem.class).getResultList();
            
            for(int i = 0; i < cartItemList2.size(); i++){
                if(cartItemList2.get(i).getOrderId() == null){
                    cartItemList2.remove(i);
                    i--;
                }
            }
            
            int[] total = new int[cartItemList.size()];
            
            for(int i = 0; i < cartItemList.size(); i++){
                for(int j = 0; j < i; j++){
                        if(cartItemList.get(i).getProdId().getProdId().equals(cartItemList.get(j).getProdId().getProdId())){
                            cartItemList.remove(i);
                            i--;
                        }
                    }
                }

            for(int i = 0; i < cartItemList.size(); i++){
                    for(int j = 0; j < cartItemList2.size(); j++) {
                       if(cartItemList.get(i).getProdId().getProdId().equals(cartItemList2.get(j).getProdId().getProdId())){
                        total[i] += cartItemList2.get(j).getPurchaseQty();
                        cartItemList.get(i).setPurchaseQty(total[i]);
                    }
                }
            }

            
      
//           for(int i = 0; i < total.length; i++){
//               for (int j = i + 1; j < total.length; j++) {     
//                  int tmp = 0;                            
//                  if (total[i] < total[j]) {          
//                     tmp = total[i];               
//                     total[i] = total[j];           
//                     total[j] = tmp;    
//                  }
//               }
//            }

            session.setAttribute("total", total);
            session.setAttribute("cartItemList", cartItemList);
            response.sendRedirect("secureStaff/SalesRecordDisplay.jsp");
        }catch(Exception ex){
            
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
