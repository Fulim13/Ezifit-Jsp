/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.CartItem;
import model.Customer;
import model.Orders;
import model.Product;
import org.apache.commons.lang3.time.DateUtils;

/**
 *
 * @author Lim
 */
@WebServlet(name = "Payment", urlPatterns = {"/Payment"})
public class Payment extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] purchaseCartItemIdArr = request.getParameterValues("purchaseCartItem");
        String paymentMethod = request.getParameter("paymentMethod");
        String shippingAddress = request.getParameter("shippingAddress");

        System.out.println(shippingAddress);
        double shippingFee = Double.parseDouble(request.getParameter("shippingFee"));
        double orderPrice = Double.parseDouble(request.getParameter("orderPrice"));
        List<CartItem> purchaseCartItemList = new ArrayList<CartItem>();

        for (String purchaseCartItemId : purchaseCartItemIdArr) {
            //minus product quantity
            CartItem purchaseCartItem = em.find(CartItem.class, Integer.parseInt(purchaseCartItemId));
            //order have paid the payment 
            if (purchaseCartItem.getOrderId() != null) {
                System.out.println("hi");
                response.sendRedirect("orderHaveMade.jsp");
                return;
            }
            int originalQty = purchaseCartItem.getProdId().getQuantity();
            int purchaseQty = purchaseCartItem.getPurchaseQty();
            if (purchaseQty > originalQty) {
                response.sendRedirect("orderFail.jsp");
                return;
            } else {
                Product product = em.find(Product.class, purchaseCartItem.getProdId().getProdId());
                product.setQuantity(originalQty - purchaseQty);

                try {
                    utx.begin();
                    em.merge(product);
                    utx.commit();
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }

                purchaseCartItemList.add(purchaseCartItem);
            }
        }

//        for (String purchaseCartItemId : purchaseCartItemIdArr) {
//            System.out.println(purchaseCartItemId);
//            CartItem purchaseCartItem = em.find(CartItem.class, Integer.parseInt(purchaseCartItemId));
//            System.out.println(purchaseCartItem);
////            purchaseCartItem.setOrderId(order);
//            purchaseCartItemList.add(purchaseCartItem);
////            //update database
////            try {
////                utx.begin();
////                em.merge(purchaseCartItem);
////                utx.commit();
////            } catch (Exception ex) {
////                System.out.println(ex.getMessage());
////            }
//
//        }
        HttpSession session = request.getSession();
        Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");
        Orders order = new Orders(new Date(), orderPrice, paymentMethod, shippingFee, "Ordered", shippingAddress);
        order.setCartItemList(purchaseCartItemList);
        order.setCustomerId(loggedInCustomer);

        try {

            utx.begin();
            em.persist(order);
            utx.commit();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

        for (String purchaseCartItemId : purchaseCartItemIdArr) {
            System.out.println(purchaseCartItemId);
            CartItem purchaseCartItem = em.find(CartItem.class, Integer.parseInt(purchaseCartItemId));
            System.out.println(purchaseCartItem);
            purchaseCartItem.setOrderId(order);
            purchaseCartItemList.add(purchaseCartItem);
//            //update database
            try {
                utx.begin();
                em.merge(purchaseCartItem);
                utx.commit();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }

        response.sendRedirect("GetOrder");

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
