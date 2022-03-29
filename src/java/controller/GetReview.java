//CHAN KAI LIN

package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.Orders;
import model.Review;


public class GetReview extends HttpServlet {

    @PersistenceContext
    EntityManager em;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        
        List<Review> reviewList = em.createNamedQuery("Review.findAll", Review.class).getResultList(); 
        Review rByOrder = new Review();
        List<Review> rByProductList = new ArrayList<>();
        //To remove not the specific orderID
        if(!(reviewList.isEmpty())){
            for(int i=0; i<reviewList.size(); i++){    
                if(!(reviewList.get(i).getOrderId().getOrderId() == orderID)){
                    reviewList.remove(i);
                    i--;
                }else{
                    if(reviewList.get(i).getProdId() == null){
                        rByOrder = reviewList.get(i);
                    } else{
                        rByProductList.add(reviewList.get(i));
                    }
                }              
            }
        }
        
        //To get cart related to specific orderID 
        Orders order = em.find(Orders.class, orderID);
        List<CartItem> cartList = order.getCartItemList();
       
        HttpSession session = request.getSession();
        session.setAttribute("orderID", orderID);
        session.setAttribute("rByOrder", rByOrder);  
        session.setAttribute("rByProductList", rByProductList); 
        session.setAttribute("cartList", cartList);  

        response.sendRedirect("reviewPage1.jsp");       
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
