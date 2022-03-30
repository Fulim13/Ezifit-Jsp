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
 * @author Lim
 */
@Entity
@Table(name = "AUTH_TOKEN")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AuthToken.findAll", query = "SELECT a FROM AuthToken a")
    , @NamedQuery(name = "AuthToken.findByTokenId", query = "SELECT a FROM AuthToken a WHERE a.tokenId = :tokenId")
    , @NamedQuery(name = "AuthToken.findByTokenValue", query = "SELECT a FROM AuthToken a WHERE a.tokenValue = :tokenValue")})
public class AuthToken implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "TOKEN_ID")
    private Integer tokenId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "TOKEN_VALUE")
    private String tokenValue;
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    @ManyToOne(optional = false)
    private Customer customerId;

    public AuthToken() {
    }

    public AuthToken(Integer tokenId) {
        this.tokenId = tokenId;
    }

    public AuthToken(String tokenValue,Customer customerId) {
        this.tokenValue = tokenValue;
        this.customerId = customerId;
    }

    public AuthToken(Integer tokenId, String tokenValue) {
        this.tokenId = tokenId;
        this.tokenValue = tokenValue;
    }

    public Integer getTokenId() {
        return tokenId;
    }

    public void setTokenId(Integer tokenId) {
        this.tokenId = tokenId;
    }

    public String getTokenValue() {
        return tokenValue;
    }

    public void setTokenValue(String tokenValue) {
        this.tokenValue = tokenValue;
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
        hash += (tokenId != null ? tokenId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AuthToken)) {
            return false;
        }
        AuthToken other = (AuthToken) object;
        if ((this.tokenId == null && other.tokenId != null) || (this.tokenId != null && !this.tokenId.equals(other.tokenId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.AuthToken[ tokenId=" + tokenId + " ]";
    }

}
