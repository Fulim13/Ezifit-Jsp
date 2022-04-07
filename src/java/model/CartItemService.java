/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import model.Customer;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
import javax.persistence.OneToMany;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.xml.bind.annotation.XmlTransient;

public class CartItemService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    
    public CartItemService(EntityManager mgr) {
        this.mgr = mgr;
    }

   public Orders findOrderByID (int id) {
        Orders order = mgr.find(Orders.class, id);
        return order;
    }
    
    public Review findReviewByID (int id) {
       Review review = mgr.find(Review.class, id);
        return review;
    }
    
    public Product findProductByID (int id) {
       Product product = mgr.find(Product.class, id);
        return product;
    }
    
    public CartItem findCartItemByID (int id) {
       CartItem cartItem = mgr.find(CartItem.class, id);
        return cartItem;
    }
    
    public CartItem findCartItemByCategory (String category) {
       CartItem cartItem = mgr.find(CartItem.class, category);
        return cartItem;
    }
    
    public List<Orders> findAllOrder() {
        List orderList = mgr.createNamedQuery("Orders.findAll").getResultList();
        return orderList;
    }
    
    public List<CartItem> findAllCartItem() {
        List cartItemList = mgr.createNamedQuery("CartItem.findAll").getResultList();
        return cartItemList;
    }
    
    public List<Review> findAllReview() {
        List reviewList = mgr.createNamedQuery("Review.findAll").getResultList();
        return reviewList;
    }
    
    public List<Customer> findAllCustomer() {
        List customerList = mgr.createNamedQuery("Customer.findAll").getResultList();
        return customerList;
    }

    public List<Product> findAllProduct() {
        List productList = mgr.createNamedQuery("Product.findAll").getResultList();
        return productList;
    }
    
    public boolean updateStatus(Orders order) {
        Orders tempStatus = findOrderByID(order.getOrderId());
        if (tempStatus != null) {
            tempStatus.setStatus(order.getStatus()); 
            return true;
        }
        return false;
    }
    
    public boolean replyComment(Review review) {
        Review tempComment = findReviewByID(review.getReviewId());
        if (tempComment != null) {
            tempComment.setReplyComment(review.getReplyComment());
            tempComment.setStaffId(review.getStaffId());
            return true;
        }
        return false;
    }

}
