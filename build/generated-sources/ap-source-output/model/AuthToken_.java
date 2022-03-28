package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Customer;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-28T17:45:36")
@StaticMetamodel(AuthToken.class)
public class AuthToken_ { 

    public static volatile SingularAttribute<AuthToken, Integer> tokenId;
    public static volatile SingularAttribute<AuthToken, Customer> customerId;
    public static volatile SingularAttribute<AuthToken, String> tokenValue;

}