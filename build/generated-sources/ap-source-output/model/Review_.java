package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Orders;
import model.Product;
import model.Staff;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-28T17:45:36")
@StaticMetamodel(Review.class)
public class Review_ { 

    public static volatile SingularAttribute<Review, Orders> orderId;
    public static volatile SingularAttribute<Review, String> replyComment;
    public static volatile SingularAttribute<Review, Double> rating;
    public static volatile SingularAttribute<Review, Date> dateReview;
    public static volatile SingularAttribute<Review, String> comment;
    public static volatile SingularAttribute<Review, Product> prodId;
    public static volatile SingularAttribute<Review, Integer> reviewId;
    public static volatile SingularAttribute<Review, Staff> staffId;

}