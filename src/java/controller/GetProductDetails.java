//CHAN KAI LIN

package controller;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;


public class GetProductDetails extends HttpServlet {
    @PersistenceContext
    EntityManager em;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");        
        
        List<Product> productList = em.createNamedQuery("Product.findAll", Product.class).getResultList();        
        
        //Remove product not selected
        String name = request.getParameter("prodSelected");                  
        for(int i=0; i<productList.size(); i++){           
            if(!(productList.get(i).getProdName().equals(name))){
                productList.remove(i);
                i--;
            }            
        } 
        
        //To remove product that are not available or stock=0
        for(int i=0; i<productList.size(); i++){
            if(!(productList.get(i).getStatus().equalsIgnoreCase("AVAILABLE"))){
                productList.remove(i);
                i--;
            } else if(productList.get(i).getQuantity() == 0){
                productList.remove(i);
                i--;
            }
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("productSelected", productList);        
        response.sendRedirect("productDetailsPage.jsp");
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
