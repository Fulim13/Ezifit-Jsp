<%-- 
    Document   : payment
    Created on : Mar 30, 2022, 1:17:06 AM
    Author     : Lim
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="model.Customer" contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have not logged in , to profile page
    if (!loggedIn) {
        response.sendRedirect(request.getContextPath());
    }
    Customer loggedCustomer = (Customer) session.getAttribute("loggedInCustomer");
    String shippingAddress = loggedCustomer.getAddress();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            img{
                width: 200px;
                height: 200px;
            }
        </style>
    </head>
    <body>
        <form action="Payment" method="POST">
            <label>Address</label>
                <textarea name="shippingAddress" rows="5"><%=shippingAddress %></textarea>
            <c:forEach var="purchaseCartItem" items="${purchaseCartItemList}">

                <div class="product">
                    <img src="data:image/jpg;base64,${purchaseCartItem.prodId.base64Image}">
                    <div>${purchaseCartItem.prodId.prodName}</div>
                    <div>Price ${purchaseCartItem.subtotal}</div>
                    <div>Quantity${purchaseCartItem.purchaseQty}</div>
                    <input type="text" name="purchaseCartItem" value="${purchaseCartItem.cartId}" hidden>
                </div>


            </c:forEach>
            <label for="html">Online Banking</label>
            <input type="radio" name="paymentMethod" value="Online Banking">
            <label for="css">Credit Card</label><br>
            <input type="radio"  name="paymentMethod" value="Credit Card">
<input type="text" name="shippingFee" value="${shippingFee}" >
            <input type="text" name="totalPayment" value="${orderPrice}" >
            <input type="submit" value="Make Payment"/>
        </form>
    </body>
</html>
