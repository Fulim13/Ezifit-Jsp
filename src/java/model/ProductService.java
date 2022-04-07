package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class ProductService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public ProductService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addProduct(Product product) {
        mgr.persist(product);
        return true;
    }

    public Product findProductById(int id) {
        Product product = mgr.find(Product.class, id);
        return product;
    }

     public Product findProductByName(String name) {
        Product product = mgr.find(Product.class, name);
        return product;
    }
    public boolean deleteProduct(int id) {
        Product product = findProductById(id);
        if (product != null) {
            mgr.remove(product);
            return true;
        }
        return false;
    }

    public List<Product> findAll() {
        List productList = mgr.createNamedQuery("Product.findAll").getResultList();
        return productList;
    }

    public boolean updateProduct(Product product) {
        Product tempProduct = findProductById(product.getProdId());
        if (tempProduct != null) {
            tempProduct.setProdName(product.getProdName());
            tempProduct.setDescription(product.getDescription());
           // tempProduct.setProdPicture(product.getProdPicture());
            tempProduct.setPrice(product.getPrice());
            tempProduct.setQuantity(product.getQuantity());
            tempProduct.setWeight(product.getWeight());
            tempProduct.setStatus(product.getStatus());
            tempProduct.setCost(product.getCost());
            tempProduct.setSize(product.getSize());
            tempProduct.setCategory(product.getCategory());
            return true;
        }
        
        return false;
    }
    public boolean updateProductImage(Product product) {
        Product tempProduct = findProductById(product.getProdId());
        if (tempProduct != null) {
            tempProduct.setProdPicture(product.getProdPicture());
            return true;
        }
        
        return false;
    }
}
