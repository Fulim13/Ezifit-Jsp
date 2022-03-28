package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Review;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-28T17:45:36")
@StaticMetamodel(Staff.class)
public class Staff_ { 

    public static volatile ListAttribute<Staff, Review> reviewList;
    public static volatile SingularAttribute<Staff, String> password;
    public static volatile SingularAttribute<Staff, String> staffEmail;
    public static volatile SingularAttribute<Staff, String> staffName;
    public static volatile SingularAttribute<Staff, String> position;
    public static volatile SingularAttribute<Staff, Integer> staffId;

}