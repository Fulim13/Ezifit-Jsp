//CHAN KAI LIN
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import model.CartItem;
import model.Customer;
import model.Product;

public class AddToCart extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
        // not enable the people whoe have not logged in , to profile page
        if (!loggedIn) {
            response.sendRedirect("login.jsp");
        }

        int prodID = Integer.parseInt(request.getParameter("prodID"));
        try {
            Product product = em.find(Product.class, prodID);

            Customer loggedInCustomer = (Customer) session.getAttribute("loggedInCustomer");

            List<CartItem> cartItemList = em.createNamedQuery("CartItem.findAll", CartItem.class).getResultList();
            CartItem cartItem1 = new CartItem(product, loggedInCustomer, 1, product.getPrice());
            CartItem cartItem2 = new CartItem();

            //Find if there is same product that is in cart
            for (int i = 0; i < cartItemList.size(); i++) {
                if ((cartItemList.get(i).getCustomerId().getCustomerId() == (int) loggedInCustomer.getCustomerId()) && (cartItemList.get(i).getOrderId() == null) && (cartItemList.get(i).getProdId().getProdId() == prodID)) {
                    cartItem2 = cartItemList.get(i);
                    int qty = cartItem2.getPurchaseQty();
                    double price = cartItem2.getSubtotal();
                    if (product.getQuantity() >= cartItem2.getPurchaseQty() + 1) {
                        qty = qty + 1;
                        price += product.getPrice();
                    }

                    cartItem2.setPurchaseQty(qty);
                    cartItem2.setSubtotal(price);
                }
            }

            utx.begin();
            if (cartItem2.getCartId() == null) {
                em.persist(cartItem1);
            } else {
                em.merge(cartItem2);
            }
            utx.commit();

            //back to previous page
            PrintWriter out = response.getWriter();
            out.println("<button id=\"backBtn\" onclick=\"history.back()\">Click here to go back </button>");
            out.println("<script>window.onload = function(){"
                    + "var button = document.getElementById('backBtn').click();"
                    + "}</script>");

        } catch (Exception ex) {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
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
