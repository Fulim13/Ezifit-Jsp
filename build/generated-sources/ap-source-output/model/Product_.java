package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.CartItem;
import model.Review;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-28T17:45:36")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile ListAttribute<Product, Review> reviewList;
    public static volatile SingularAttribute<Product, Integer> quantity;
    public static volatile SingularAttribute<Product, Double> cost;
    public static volatile ListAttribute<Product, CartItem> cartItemList;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile SingularAttribute<Product, Double> weight;
    public static volatile SingularAttribute<Product, byte[]> prodPicture;
    public static volatile SingularAttribute<Product, Integer> prodId;
    public static volatile SingularAttribute<Product, String> size;
    public static volatile SingularAttribute<Product, Double> price;
    public static volatile SingularAttribute<Product, String> prodName;
    public static volatile SingularAttribute<Product, Character> category;
    public static volatile SingularAttribute<Product, String> status;

}