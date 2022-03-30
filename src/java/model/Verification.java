/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Lim
 */
@Entity
@Table(name = "VERIFICATION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Verification.findAll", query = "SELECT v FROM Verification v")
    , @NamedQuery(name = "Verification.findByVerificationId", query = "SELECT v FROM Verification v WHERE v.verificationId = :verificationId")
    , @NamedQuery(name = "Verification.findByVerificationCode", query = "SELECT v FROM Verification v WHERE v.verificationCode = :verificationCode")
    , @NamedQuery(name = "Verification.findByExpireDate", query = "SELECT v FROM Verification v WHERE v.expireDate = :expireDate")
    , @NamedQuery(name = "Verification.findByEmail", query = "SELECT v FROM Verification v WHERE v.email = :email")})
public class Verification implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "VERIFICATION_ID")
    private Integer verificationId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 6)
    @Column(name = "VERIFICATION_CODE")
    private String verificationCode;
    @Basic(optional = false)
    @NotNull
    @Column(name = "EXPIRE_DATE")
    @Temporal(TemporalType.DATE)
    private Date expireDate;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 64)
    @Column(name = "EMAIL")
    private String email;

    public Verification() {
    }

    public Verification(Integer verificationId) {
        this.verificationId = verificationId;
    }
    
    public Verification(String verificationCode, Date expireDate, String email) {
        this.verificationCode = verificationCode;
        this.expireDate = expireDate;
        this.email = email;
    }

    public Verification(Integer verificationId, String verificationCode, Date expireDate, String email) {
        this.verificationId = verificationId;
        this.verificationCode = verificationCode;
        this.expireDate = expireDate;
        this.email = email;
    }

    public Integer getVerificationId() {
        return verificationId;
    }

    public void setVerificationId(Integer verificationId) {
        this.verificationId = verificationId;
    }

    public String getVerificationCode() {
        return verificationCode;
    }

    public void setVerificationCode(String verificationCode) {
        this.verificationCode = verificationCode;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (verificationId != null ? verificationId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Verification)) {
            return false;
        }
        Verification other = (Verification) object;
        if ((this.verificationId == null && other.verificationId != null) || (this.verificationId != null && !this.verificationId.equals(other.verificationId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Verification[ verificationId=" + verificationId + " ]";
    }
    
}
