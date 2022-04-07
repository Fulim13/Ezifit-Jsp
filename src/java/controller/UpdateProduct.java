package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.transaction.UserTransaction;
import model.Product;
import model.ProductService;

@WebServlet(name = "UpdateProduct", urlPatterns = {"/UpdateProduct"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 10,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 12
)
public class UpdateProduct extends HttpServlet {

    PrintWriter out;
    @PersistenceContext
    EntityManager em;
    @Resource
    UserTransaction utx;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            int id = Integer.parseInt(request.getParameter("prod_id"));
            String prodName = request.getParameter("prod_name");
            String description = request.getParameter("description");
            Part profilePicture = request.getPart("prod_picture");
            double price = Double.parseDouble(request.getParameter("price"));//get value from form insert
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double weight = Double.parseDouble(request.getParameter("weight"));

            String status = request.getParameter("status");
            double cost = Double.parseDouble(request.getParameter("cost"));

            String size = (request.getParameter("size"));
            char category = (request.getParameter("category").charAt(0));

            ProductService productService = new ProductService(em);
            Product product = new Product(id, prodName, description, price, quantity, weight, status.toUpperCase(), cost, size.toUpperCase(), category);//delete update view add
            Product oldProduct = productService.findProductById(id);
            
            if (profilePicture.getSize() > 0 && profilePicture != null) {
                long imageSize = profilePicture.getSize();
                byte[] imageBytes = new byte[(int) imageSize];
                InputStream inputStream = profilePicture.getInputStream();
                inputStream.read(imageBytes);
                inputStream.close();
                product.setProdPicture(imageBytes);

            } else {
                product.setProdPicture(oldProduct.getProdPicture());
            }

            utx.begin();
            em.merge(product);
            utx.commit();

            boolean success = true;

            HttpSession session = request.getSession();
            session.setAttribute("success", success);
            response.sendRedirect("secureManager/Product/UpdateConfirmProduct.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AddProduct.class.getName()).log(Level.SEVERE, null, ex);
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
