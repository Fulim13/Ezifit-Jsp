package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-28T17:45:36")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, String> password;
    public static volatile SingularAttribute<Customer, String> address;
    public static volatile SingularAttribute<Customer, String> phone;
    public static volatile SingularAttribute<Customer, Date> dob;
    public static volatile SingularAttribute<Customer, Integer> customerId;
    public static volatile SingularAttribute<Customer, String> fullname;
    public static volatile SingularAttribute<Customer, byte[]> customerImage;
    public static volatile SingularAttribute<Customer, String> email;
    public static volatile SingularAttribute<Customer, Date> registerDate;

}