package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Orders;
import model.Product;
import model.ReportService;
import model.CartItem;
import model.Review;

public class reportRetrieve extends HttpServlet {

    @PersistenceContext
    EntityManager em;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

//            get the value from the form
            String report_type = request.getParameter("report_type");
//            create a constructor of reportService to implement the SQL query
            ReportService reportService = new ReportService(em);

            List<Product> product_list = reportService.findProductByAll();
            List<CartItem> cart_list = reportService.findCartByAll();

//            variable for top product report
            int sum;
            double revenue;
            List<Integer> store_total_sales = new ArrayList<>();
            List<Double> product_revenue = new ArrayList<>();
            List<CartItem> store_cart_date = new ArrayList<>();
//            create a session
            HttpSession session = request.getSession();

//            if the report type is top 3 product
            if (report_type.equals("top_product")) {
                Date date_from = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date_from"));
                Date date_to = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date_to"));
                List<Orders> order_list = reportService.findSalesReportDate(date_from, date_to);

                //remove the cart item which don't have the order id
                for (int i = 0; i < cart_list.size(); i++) {
                    if (cart_list.get(i).getOrderId() == null) {
                        cart_list.remove(i);
                        i--;
                    }
                }

//           store the list of cart item which in the particular date range
                for (int i = 0; i < order_list.size(); i++) {
                    for (int j = 0; j < cart_list.size(); j++) {
                        if (order_list.get(i).getOrderId() == cart_list.get(j).getOrderId().getOrderId()) {
                            store_cart_date.add(cart_list.get(j));
                        }
                    }
                }

                //remove duplicate product
                for (int i = 0; i < product_list.size(); i++) {
                    for (int j = 0; j < i; j++) {
                        if (product_list.get(i).getProdName().equals(product_list.get(j).getProdName())) {
                            if (product_list.get(i).getCategory().equals(product_list.get(j).getCategory())) {
                                product_list.remove(i);
                                i--;
                            }
                        }
                    }
                }

                for (int i = 0; i < product_list.size(); i++) {
                    sum = 0;
                    for (int j = 0; j < store_cart_date.size(); j++) {
                        if (product_list.get(i).getProdName().equals(store_cart_date.get(j).getProdId().getProdName())) {
                            sum += store_cart_date.get(j).getPurchaseQty();
                        }
                    }
                    store_total_sales.add(sum);
                }

                //remove the product which the sold is 0
                for (int i = 0; i < product_list.size(); i++) {
                    if (store_total_sales.get(i) == 0) {
                        product_list.remove(i);
                        store_total_sales.remove(i);
                        i--;
                    }
                }

                //calculate each of the product revenue in the pages
                for (int i = 0; i < product_list.size(); i++) {
                    revenue = 0.0;
                    revenue = product_list.get(i).getPrice() * store_total_sales.get(i);
                    product_revenue.add(revenue);
                }

                for (int i = 0; i < product_list.size() - 1; i++) {
                    //cheching the condition fot two
                    //simultaneous elements of the array
                    if (store_total_sales.get(i) < store_total_sales.get(i + 1)) {

                        //temp store data
                        Integer temp_store_unitSell = store_total_sales.get(i);
                        Double temp_store_revenue = product_revenue.get(i);
                        Product temp_store_prodcut = product_list.get(i);

                        //swapping the elements
                        store_total_sales.set(i, store_total_sales.get(i + 1));
                        store_total_sales.set(i + 1, temp_store_unitSell);

                        product_revenue.set(i, product_revenue.get(i + 1));
                        product_revenue.set(i + 1, temp_store_revenue);

                        product_list.set(i, product_list.get(i + 1));
                        product_list.set(i + 1, temp_store_prodcut);

                        i = -1;

                    }
                }

                session.setAttribute("product_list", product_list);
                session.setAttribute("store_total_sales", store_total_sales);
                session.setAttribute("product_revenue", product_revenue);
                session.setAttribute("date_from", date_from);
                session.setAttribute("date_to", date_to);
                response.sendRedirect("secureManager/top_product_report.jsp");
            }
//            varible for sales report
            List<Integer> sales_unit_solds = new ArrayList<>();
            List<Integer> remaining_stock = new ArrayList<>();
            List<Double> sales_revenue = new ArrayList<>();
            List<Double> product_profit = new ArrayList<>();
            List<Product> store_product_name = reportService.findProductByAll();
            int sum_sold;
            int remaining_qty;
            double sales_total_revenue;
            double sales_profit;

            if (report_type.equals("sales_report")) {
                for (int i = 0; i < product_list.size(); i++) {
                    sum_sold = 0;
                    for (int j = 0; j < cart_list.size(); j++) {
                        if (product_list.get(i).getProdName().equals(cart_list.get(j).getProdId().getProdName())) {
                            //calculate total sold for each size of the product
                            if (product_list.get(i).getSize() != null) {
                                if (product_list.get(i).getSize().equals(cart_list.get(j).getProdId().getSize())) {
                                    sum_sold += cart_list.get(j).getPurchaseQty();
                                }
                            } else {
                                sum_sold += cart_list.get(j).getPurchaseQty();
                            }
                        }
                    }
                    sales_unit_solds.add(sum_sold);
                    //calculate remaining qty
                    remaining_qty = product_list.get(i).getQuantity() - sales_unit_solds.get(i);
                    remaining_stock.add(remaining_qty);

                    //calculate total revenue
                    sales_total_revenue = product_list.get(i).getPrice() * sales_unit_solds.get(i);
                    sales_revenue.add(sales_total_revenue);

                    //calculate total profit
                    if (sales_revenue.get(i) == 0) {
                        sales_profit = 0;
                        product_profit.add(sales_profit);
                    } else {
                        sales_profit = ((sales_revenue.get(i) - product_list.get(i).getCost()) / sales_revenue.get(i)) * 100;
                        product_profit.add(sales_profit);
                    }
                }

                //remove product sold is 0
                for (int i = 0; i < product_list.size(); i++) {
                    if (sales_unit_solds.get(i) == 0) {
                        product_list.remove(i);
                        sales_unit_solds.remove(i);
                        sales_revenue.remove(i);
                        product_profit.remove(i);
                        remaining_stock.remove(i);
                        i--;
                    }
                }

                //To remove duplicate product
                for (int i = 0; i < store_product_name.size(); i++) {
                    for (int j = 0; j < i; j++) {
                        if ((store_product_name.get(i).getProdName().equals(store_product_name.get(j).getProdName()))) {
                            if (store_product_name.get(i).getCategory().equals(store_product_name.get(j).getCategory())) {
                                store_product_name.remove(i);
                                i--;
                            }

                        }
                    }
                }

////            calculate the sum profit and sum revenue for each of the product
                List<Double> temp_product_total_revenue = new ArrayList<>();
                List<Double> temp_product_total_profit = new ArrayList<>();
                double product_sum_revenue;
                double product_sum_profit;
                for (int i = 0; i < store_product_name.size(); i++) {
                    product_sum_revenue = 0;
                    product_sum_profit = 0;
                    for (int j = 0; j < product_list.size(); j++) {
                        if (store_product_name.get(i).getProdName().equals(product_list.get(j).getProdName())) {
                            product_sum_revenue +=Double.parseDouble(String.format("%.2f",sales_revenue.get(j)));
                            product_sum_profit +=Double.parseDouble(String.format("%.2f",product_profit.get(j)));
                        }
                    }
                    temp_product_total_revenue.add(product_sum_revenue);
                    temp_product_total_profit.add(product_sum_profit);
                }

                List<Double> product_total_revenue = new ArrayList<>();
                List<Double> product_total_profit = new ArrayList<>();
                for (int i = 0; i < product_list.size(); i++) {
                    for (int j = 0; j < store_product_name.size(); j++) {
                        if (product_list.get(i).getProdName().equals(store_product_name.get(j).getProdName())) {
                            product_total_revenue.add(temp_product_total_revenue.get(j));
                            product_total_profit.add(temp_product_total_profit.get(j));
                        }
                    }
                }

                session.setAttribute("store_product_name", store_product_name);
                session.setAttribute("product_list", product_list);
                session.setAttribute("sales_unit_solds", sales_unit_solds);
                session.setAttribute("remaining_stock", remaining_stock);
                session.setAttribute("sales_revenue", sales_revenue);
                session.setAttribute("product_profit", product_profit);
                session.setAttribute("product_total_revenue", product_total_revenue);
                session.setAttribute("product_total_profit", product_total_profit);
                response.sendRedirect("secureManager/SalesReport.jsp");
            }

//            create summary rating for each product
            if (report_type.equals("product_rating_report")) {
                List<Review> review_list = reportService.findReviewbyAll();
                double sum_rating;
                double percent_rating;
                double max_rating_for_product;
                List<Double> store_sum_rating = new ArrayList<>();
                List<Double> store_rating_percentage = new ArrayList<>();
                List<String> store_rating_evaluate = new ArrayList<>();
                List<Double> max_rating = new ArrayList<>();
                List<Integer> store_without_review=new ArrayList<>();

                //remove duplicate product
                for (int i = 0; i < product_list.size(); i++) {
                    for (int j = 0; j < i; j++) {
                        if (product_list.get(i).getProdName().equals(product_list.get(j).getProdName())) {
                            if (product_list.get(i).getCategory().equals(product_list.get(j).getCategory())) {
                                product_list.remove(i);
                                i--;
                            }
                        }
                    }
                }
                //remmove the null product id in review list
                for (int i = 0; i < review_list.size(); i++) {
                    if (review_list.get(i).getProdId() == null) {
                        review_list.remove(i);
                        i--;
                    }
                }
                
                
                

                //remove the product don't have the review
                int[] without_review = new int[product_list.size()];
                for (int i = 0; i < product_list.size(); i++) {
                    without_review[i] = 0;
                    for (int j = 0; j < review_list.size(); j++) {
                        if (product_list.get(i).getProdName().equals(review_list.get(j).getProdId().getProdName())) {
                           without_review[i]++;
                        }
                    }
                    store_without_review.add(without_review[i]);
                }
                 
                //remove the product which no inside in the review table
                for(int i=0;i<product_list.size();i++){
                    if(store_without_review.get(i)==0){
                        product_list.remove(i);
                        store_without_review.remove(i);
                        i--;
                    }
                }
               
                out.println(product_list.size());
                

                for (int i = 0; i < product_list.size(); i++) {
                    sum_rating = 0;
                    max_rating_for_product = 0;
                    for (int j = 0; j < review_list.size(); j++) {
                        if (product_list.get(i).getProdName().equals(review_list.get(j).getProdId().getProdName())) {
                            sum_rating = sum_rating + review_list.get(j).getRating();
                            max_rating_for_product = max_rating_for_product + 10.0;
                        }
                    }
                    max_rating.add(max_rating_for_product);
                    //store sum rating 
                    store_sum_rating.add(sum_rating);
                }
//             / calculate the average rating for each product
                for (int z = 0; z < product_list.size(); z++) {
                    percent_rating = (store_sum_rating.get(z) / max_rating.get(z)) * 100;
                    store_rating_percentage.add(percent_rating);
                    if (store_rating_percentage.get(z) >= 70) {
                        store_rating_evaluate.add("Good");
                    } else if (store_rating_percentage.get(z) >= 40 && store_rating_percentage.get(z) <= 69) {
                        store_rating_evaluate.add("Average");
                    } else if (store_rating_percentage.get(z) <= 39) {
                        store_rating_evaluate.add("Poor");
                    }
                }
                

                session.setAttribute("product_list", product_list);
                session.setAttribute("store_rating_percentage", store_rating_percentage);
                session.setAttribute("store_rating_evaluate", store_rating_evaluate);
                response.sendRedirect("secureManager/ProductRatingReport.jsp");
            }
    
        } catch (Exception ex) {

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
