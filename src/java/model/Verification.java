/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author USER
 */
@Entity
@Table(name = "VERIFICATION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Verification.findAll", query = "SELECT v FROM Verification v")
    , @NamedQuery(name = "Verification.findByVerificationId", query = "SELECT v FROM Verification v WHERE v.verificationId = :verificationId")
    , @NamedQuery(name = "Verification.findByVerificationCode", query = "SELECT v FROM Verification v WHERE v.verificationCode = :verificationCode")})
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
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    @ManyToOne(optional = false)
    private Customer customerId;

    public Verification() {
    }

    public Verification(Integer verificationId) {
        this.verificationId = verificationId;
    }

    public Verification(Integer verificationId, String verificationCode) {
        this.verificationId = verificationId;
        this.verificationCode = verificationCode;
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

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
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
