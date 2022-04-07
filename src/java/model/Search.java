
package model;

import model.Customer;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


public class Search {
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    
    public Search(EntityManager mgr){
        this.mgr=mgr;
    }
    
    public List<Product> searchProduct(String search_input_typing){
        Query query_product=mgr.createQuery("SELECT p FROM Product p WHERE UPPER(p.prodName) LIKE :search_input_typing");
            query_product.setParameter("search_input_typing","%" +search_input_typing+ "%");
            List<Product> prod_list=query_product.getResultList();
            return prod_list;
    }
    
    public List<Customer> searchCustomer(String search_for_staff){
        Query query_customer=mgr.createQuery("SELECT c FROM Customer c WHERE UPPER(c.fullname) LIKE :search_for_staff");
        query_customer.setParameter("search_for_staff","%" + search_for_staff + "%");
        List<Customer> cust_list=query_customer.getResultList();
        return cust_list;
    }
    
   
}
