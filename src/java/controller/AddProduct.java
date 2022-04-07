package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

@WebServlet(name = "AddProduct", urlPatterns = {"/AddProduct"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
@PersistenceContext

public class AddProduct extends HttpServlet {

    PrintWriter out;

    EntityManager em;
    @Resource
    UserTransaction utx;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        Part part = request.getPart("image");
        if (part != null) {
            try {

                String prodName = request.getParameter("prod_name");
                String description = request.getParameter("description");

                double price = Double.parseDouble(request.getParameter("price"));//get value from form insert
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                double weight = Double.parseDouble(request.getParameter("weight"));

                String status = request.getParameter("status");
                double cost = Double.parseDouble(request.getParameter("cost"));

                String size = (request.getParameter("size"));
                char category = (request.getParameter("category").charAt(0));

                Connection con = DBProduct.getConnection();
                PreparedStatement ps = con.prepareStatement("insert into PRODUCT(prod_name,description,prod_picture,price,quantity,weight,status,cost,size,category) values (?,?,?,?,?,?,?,?,?,?)");
                InputStream is = part.getInputStream();

                
                ps.setString(1, prodName);
                ps.setString(2, description);
                ps.setBlob(3, is);
                ps.setDouble(4, price);
                ps.setInt(5, quantity);
                ps.setDouble(6, weight);
                ps.setString(7, status.toUpperCase());
                ps.setDouble(8, cost);
                ps.setString(9, size.toUpperCase());
                ps.setString(10, String.valueOf(category).toUpperCase());

                result = ps.executeUpdate();

                if (result > 0) {
                    boolean success = true;
                    HttpSession session = request.getSession();
                    session.setAttribute("success", success);
                    response.sendRedirect("secureStaff/AddConfirmProduct.jsp");
                } else {
                    response.sendRedirect("index.jsp?message=Some+Error+Occurred");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

}
