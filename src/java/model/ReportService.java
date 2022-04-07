/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;

/**
 *
 * @author user
 */
public class ReportService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public ReportService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public List<Product> findProductByAll() {
        List prodList = mgr.createNamedQuery("Product.findAll").getResultList();
        return prodList;
    }

    public List<Orders> findOrderByDate(Date date) {
        Query query_orderList = mgr.createNamedQuery("Orders.findByOrderDate").setParameter("date", date);
        List<Orders> orderList = query_orderList.getResultList();
        return orderList;
    }

    public List<Orders> findOrderByAll() {
        List orderList = mgr.createNamedQuery("Orders.findAll").getResultList();
        return orderList;
    }
    
    public List<CartItem> findCartByAll(){
        List cart_list=mgr.createNamedQuery("CartItem.findAll").getResultList();
        return cart_list;
    }

    public List<Orders> findSalesReportDate(Date date_from, Date date_to) {
        Query query_salesReport = mgr.createQuery("SELECT o FROM Orders o WHERE o.orderDate BETWEEN :date_from AND :date_to");
        query_salesReport.setParameter("date_from", date_from,TemporalType.DATE);
        query_salesReport.setParameter("date_to",date_to,TemporalType.DATE);
        List<Orders> salesReport_list = query_salesReport.getResultList();
        return salesReport_list;
    }
    
    public List<Review> findReviewbyAll(){
        List review_list=mgr.createNamedQuery("Review.findAll").getResultList();
        return review_list;
    }
}
