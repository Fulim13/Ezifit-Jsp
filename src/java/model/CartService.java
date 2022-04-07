package model;

//import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class CartService {

    @PersistenceContext
    EntityManager mgr;

    private List<CartItem> cart;
    
    public CartService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public CartItem findCartById(int id) {
        CartItem cart = mgr.find(CartItem.class, id);
        return cart;
    }

    public boolean deleteCart(int id) {
        CartItem cart = findCartById(id);
        if (cart != null) {
            mgr.remove(cart);
            return true;
        }
        return false;   
    }
    
//    public void deleteCart(int id) {
//      Iterator<CartItem> iter = cart.iterator();
//      while (iter.hasNext()) {
//         CartItem item = iter.next();
//         if (item.getCartId() == id) {
//            cart.remove(item);
//            return;
//         }
//      }
//   }

    public List<CartItem> findAll() {
        List cartList = mgr.createNamedQuery("CartItem.findAll").getResultList();
        return cartList;
    }
    
    public boolean updateItemQty(CartItem cart){
        CartItem tempCart = findCartById(cart.getCartId());
        
        if (tempCart != null){
//            double subtotal = tempCart.getProdId().getPrice();
//            int newQty = cart.getPurchaseQty();
//            double newSubtotal = newQty * subtotal;
            
            tempCart.setPurchaseQty(cart.getPurchaseQty());
            tempCart.setSubtotal(tempCart.getProdId().getPrice()*cart.getPurchaseQty());
            return true;
        }
        return false;
    }
    
//    public boolean updateItemQty(int id, int newQty) {
//      Iterator<CartItem> iter = cart.iterator();
//      while (iter.hasNext()) {
//         CartItem item = iter.next();
//         if (item.getCartId() == id) {
//            // id found, increase qtyOrdered
//            item.setPurchaseQty(newQty);
//            return true;
//         }
//      }
//      return false;
//   }
}