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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Lim
 */
@Entity
@Table(name = "CART_ITEM")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CartItem.findAll", query = "SELECT c FROM CartItem c")
    , @NamedQuery(name = "CartItem.findByCartId", query = "SELECT c FROM CartItem c WHERE c.cartId = :cartId")
    , @NamedQuery(name = "CartItem.findByPurchaseQty", query = "SELECT c FROM CartItem c WHERE c.purchaseQty = :purchaseQty")
    , @NamedQuery(name = "CartItem.findBySubtotal", query = "SELECT c FROM CartItem c WHERE c.subtotal = :subtotal")})
public class CartItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CART_ID")
    private Integer cartId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PURCHASE_QTY")
    private int purchaseQty;
    @Basic(optional = false)
    @NotNull
    @Column(name = "SUBTOTAL")
    private double subtotal;
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    @ManyToOne(optional = false)
    private Customer customerId;
    @JoinColumn(name = "ORDER_ID", referencedColumnName = "ORDER_ID", updatable = true)
    @ManyToOne
    private Orders orderId;
    @JoinColumn(name = "PROD_ID", referencedColumnName = "PROD_ID")
    @ManyToOne(optional = false)
    private Product prodId;

    public CartItem() {
    }

    public CartItem(Integer cartId) {
        this.cartId = cartId;
    }

    public CartItem(Integer cartId, int purchaseQty) {
        this.cartId = cartId;
        this.purchaseQty = purchaseQty;
    }

    public CartItem(Integer cartId, int purchaseQty, double subtotal) {
        this.cartId = cartId;
        this.purchaseQty = purchaseQty;
        this.subtotal = subtotal;
    }

    public CartItem(Product prodId, Customer customerId, int purchaseQty, double subtotal) {
        this.prodId = prodId;
        this.customerId = customerId;
        this.purchaseQty = purchaseQty;
        this.subtotal = Double.parseDouble(String.format("%.2f", subtotal));
    }

    public Integer getCartId() {
        return cartId;
    }

    public void setCartId(Integer cartId) {
        this.cartId = cartId;
    }

    public int getPurchaseQty() {
        return purchaseQty;
    }

    public void setPurchaseQty(int purchaseQty) {
        this.purchaseQty = purchaseQty;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = Double.parseDouble(String.format("%.2f", subtotal));
    }

    public Customer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customer customerId) {
        this.customerId = customerId;
    }

    public Orders getOrderId() {
        return orderId;
    }

    public void setOrderId(Orders orderId) {
        this.orderId = orderId;
    }

    public Product getProdId() {
        return prodId;
    }

    public void setProdId(Product prodId) {
        this.prodId = prodId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cartId != null ? cartId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CartItem)) {
            return false;
        }
        CartItem other = (CartItem) object;
        if ((this.cartId == null && other.cartId != null) || (this.cartId != null && !this.cartId.equals(other.cartId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CartItem[ cartId=" + cartId + " ]";
    }

}
