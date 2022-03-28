package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;
import model.Orders;
import model.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-28T17:45:36")
@StaticMetamodel(CartItem.class)
public class CartItem_ { 

    public static volatile SingularAttribute<CartItem, Orders> orderId;
    public static volatile SingularAttribute<CartItem, Double> subtotal;
    public static volatile SingularAttribute<CartItem, Integer> cartId;
    public static volatile SingularAttribute<CartItem, Customer> customerId;
    public static volatile SingularAttribute<CartItem, Integer> purchaseQty;
    public static volatile SingularAttribute<CartItem, Product> prodId;

}