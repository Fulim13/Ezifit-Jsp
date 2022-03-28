package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.CartItem;
import model.Customer;
import model.Review;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-28T17:45:36")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile ListAttribute<Orders, Review> reviewList;
    public static volatile SingularAttribute<Orders, Double> shippingFee;
    public static volatile SingularAttribute<Orders, Integer> orderId;
    public static volatile ListAttribute<Orders, CartItem> cartItemList;
    public static volatile SingularAttribute<Orders, Customer> customerId;
    public static volatile SingularAttribute<Orders, String> paymentMethod;
    public static volatile SingularAttribute<Orders, Double> orderPrice;
    public static volatile SingularAttribute<Orders, Date> orderDate;
    public static volatile SingularAttribute<Orders, String> status;

}