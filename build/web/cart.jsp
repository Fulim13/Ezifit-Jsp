<%-- 
    Document   : cart
    Created on : Mar 30, 2022, 1:02:43 AM
    Author     : Lim
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <form action="MakeOrder" method="POST">
            <c:forEach var="cartItem" items="${cartItemList}">

                <div class="cart">
                    <img src="data:image/jpg;base64,${cartItem.prodId.base64Image}">
                    <div>${cartItem.prodId.prodName}</div>
                    <div>${cartItem.prodId.size}</div>
                    <div>Quantity${cartItem.purchaseQty}</div>
                    <div>Price ${cartItem.subtotal}</div>      
                    <input type="checkbox" name="cartItemList" value="${cartItem.cartId}">
                </div>


            </c:forEach>
            <input type="submit" value="Purchase"/>
        </form>
    </body>
</html>
