
package model;

import model.Customer;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;


public class CustomerService {
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;
    
    public CustomerService(EntityManager mgr){
        this.mgr=mgr;
    }
    
    public Customer findCustomerId(String id){
        Customer customer=mgr.find(Customer.class, mgr);
        return customer;
    }
    
    public List<Customer> findAll(){
        List custList=mgr.createNamedQuery("Customer.findAll").getResultList();
        return custList;
    }
    
    public List<Customer> findSortNameASC(){
        List custList=mgr.createNamedQuery("Customer.findSortNameASC").getResultList();
        return custList;
    }
    
     public List<Customer> findSortNameDESC(){
        List custList=mgr.createNamedQuery("Customer.findSortNameDESC").getResultList();
        return custList;
    }
     
      public List<Customer> findSortDobASC(){
        List custList=mgr.createNamedQuery("Customer.findSortDobASC").getResultList();
        return custList;
    }
    
      public List<Customer> findSortDobDESC(){
        List custList=mgr.createNamedQuery("Customer.findSortDobDESC").getResultList();
        return custList;
    }
      
      public List<Customer> findSortRegisterDateASC(){
        List custList=mgr.createNamedQuery("Customer.findSortRegisterDateASC").getResultList();
        return custList;
    }
      
      public List<Customer> findSortRegisterDateDESC(){
        List custList=mgr.createNamedQuery("Customer.findSortRegisterDateDESC").getResultList();
        return custList;
    }
      
     
}
