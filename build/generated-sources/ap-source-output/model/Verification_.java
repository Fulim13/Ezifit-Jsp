package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2022-03-28T17:45:36")
@StaticMetamodel(Verification.class)
public class Verification_ { 

    public static volatile SingularAttribute<Verification, Date> expireTime;
    public static volatile SingularAttribute<Verification, Date> expireDate;
    public static volatile SingularAttribute<Verification, Integer> verificationId;
    public static volatile SingularAttribute<Verification, String> email;
    public static volatile SingularAttribute<Verification, String> verificationCode;

}