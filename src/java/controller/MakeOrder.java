package controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import model.CartItem;

/**
 *
 * @author Lim
 */
@WebServlet(urlPatterns = {"/MakeOrder"})
public class MakeOrder extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get selected CartItemID

        String[] cartItemIdArr = request.getParameterValues("cartItemList");
        if (cartItemIdArr == null) {
            response.sendRedirect("purchase.jsp");
        } else {
            ArrayList<CartItem> purchaseCartItemList = new ArrayList<CartItem>();
            double orderPrice = 0;
            double weight = 0;
            double shippingFee = 0;

            //Find all the selected cart Item where this customer select to buy
            for (String cartItemId : cartItemIdArr) {
                CartItem cartItem = em.find(CartItem.class, Integer.parseInt(cartItemId));
                //calc subtotal
                orderPrice += cartItem.getSubtotal();
                //calculate Shipping feee based on weight
                weight += cartItem.getPurchaseQty() * cartItem.getProdId().getWeight();
                

                purchaseCartItemList.add(cartItem);
            }
            
            if (weight <= 1) {
                    //less than or equal to 1kg
                    shippingFee = 4.5;
                } else if (weight <= 3) {
                    //less than or equal to 3kg
                    shippingFee = 10;
                } else if (weight <= 5) {
                    //less than or equal to 5kg
                    shippingFee = 20;
                } else {
                    //more than 5 kg
                    // first 5 kg - RM 20
                    //subsequent kg (each kg - RM5)
                    shippingFee = 20 + ((weight - 5) * 5);
                }

            HttpSession session = request.getSession();
            session.setAttribute("purchaseCartItemList", purchaseCartItemList);
            session.setAttribute("shippingFee", Double.parseDouble(String.format("%.2f", shippingFee)));
            session.setAttribute("orderPrice", orderPrice);
            response.sendRedirect("payment.jsp");
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
