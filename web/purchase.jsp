<%-- 
    Document   : cart
    Created on : Mar 30, 2022, 1:02:43 AM
    Author     : Lim
--%>

<%@page import="model.CartItem"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have not logged in , to profile page
    if (!loggedIn) {
        response.sendRedirect(request.getContextPath());
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>CART | EZIFIT </title>
        <style>
            body{
                font-family: 'Lucida Sans';                
            }
            .header{
                display: flex; 
                align-items: center; 
                justify-content: space-between; 
                margin: 25px
            }
            .header span a{
                font-size: 40px; 
                font-weight: bold; 
                letter-spacing: 3px;
                color: black;
                text-decoration: none;
            }           
            .nav-link li{
                display: inline-block;
                margin: 0 13px;
                font-weight: 700; 
                font-size: 22px;
            }
            .nav-link li i{
                color: black;
            }
            .nav-link :hover{
                color: #8B0000;
            }  
            .Header{
                text-align: center;
                font-size: 20px;
                color: #8B0000;
            }
            img{
                width: 110px;
                height: 110px;
            }           
            * {
                box-sizing: border-box;
            }
            .button{
                text-align: center;                
            }
            .button button{
                font-family: 'Arial narrow'; 
                font-size: 18px;
                font-weight: bold;
                letter-spacing: 2px;
                margin: 0px 90px 50px 90px;                
                border: none;
                border-radius: 30px;
                padding: 13px;
                cursor: pointer;
            }
            .button #btn1{
                background-color: #8B0000;
                color: white;
            }
            .button #btn2{
                background-color: transparent;
            }
            .shopping-cart {
                width: 850px;
                height: 150px;
                margin: 15px auto;
                background: #EEEEEE;
                box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);
                border-radius: 8px;
            }
            .button{
                text-align: center;                
            }
            .button button{
                font-family: 'Arial narrow'; 
                font-size: 18px;
                font-weight: bold;
                letter-spacing: 2px;
                margin: 0px 90px 30px 90px;                
                border: none;
                border-radius: 30px;
                padding: 13px;
                cursor: pointer;
            }
            .button #btn2{
                background-color: #8B0000;
                color: white;
            }
            .button #btn1{
                background-color: transparent;
                color: black;
            }
            .item {
                padding: 20px 20px;
                height: 100px;
                display: flex;
            }
            .removeButtons {
                padding-top: 50px;
                margin-right: 30px;
                color: #8B0000;
            }
            .select {
                margin-left: 160px;
                margin-bottom: -45px;
            }
            .image {
                margin-right: 40px;
            }
            .name, .size{
                padding-top: 40px;
                margin-right: 60px;
            }
            .quantity {
                padding-top: 40px;
                margin-right: 50px;
            }
            .quantity input {
                text-align: center;
                width: 40px;
                font-size: 16px;
                color: #8B0000;
            }
            .updateButton {
                padding-top: 38px;
                margin-right: 60px;
            }
            .fa-plus-square, .fa-minus-square{
                padding-top: 20px;
                font-size: 20px;    
                color: #333333;
            }
            .subtotal {
                padding-top: 40px;
                margin-right: 40px;
                text-align: center;
            }
            .purchaseButton{
                position: absolute;
                padding-bottom: 10px;
                left: 42%;
            }
            .returnButton {
                position: absolute;
                left: 48%;
            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="homePage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                   <%if (loggedIn) {%>
                <li><a href="GetOrder"><i class="fa fa-shopping-bag"></i></a></li>                
                <li><a href="GetCart"><i class="fa fa-shopping-cart"></i></a></li>
                <li><a href="profile.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="Logout"><i class="fa fa-sign-out"></i></a></li>
                        <%} else {%>
                <li><a href="login.jsp"><i class="fa fa-shopping-bag"></i></a></li>                
                <li><a href="login.jsp"><i class="fa fa-shopping-cart"></i></a></li>
                <li><a href="login.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="login.jsp"><i class="fa fa-sign-in"></i></a></li>
                        <%}%>       
            </ul>
        </div>

        <div class="Header">
            <h3>Shopping cart</h3>
        </div>

        <div class="button">
            <a href="cart.jsp"><button id="btn1">Change Quantity</button></a>
            <button id="btn2">Purchase</button>
        </div>

        <table>  
            <form action="MakeOrder" method="POST">
                <c:forEach var="cartItem" items="${cartItemList}">
                    <div class="select">
                        <input type="checkbox" name="cartItemList" value="${cartItem.cartId}">
                    </div>
                    
                    <div class="shopping-cart"> 
                        <div class="item">
                            <div class="removeButtons">
                                <a href="RemoveCartItem?id=${cartItem.cartId}"><i class="fa fa-trash" ></i></a>
                            </div>

                            <div class="image">
                                <img src="data:image/jpg;base64,${cartItem.prodId.base64Image}">
                            </div>
                            <div class="name">
                                ${cartItem.prodId.prodName}
                            </div>
                            <div class="size">
                                ${cartItem.prodId.size}
                            </div>
                            <div class="quantity">
                                ${cartItem.purchaseQty}
                            </div>
                            <div class="subtotal">MYR ${cartItem.subtotal}</div>
                        </div>
                    </div>
                </c:forEach>
                <div class="purchaseButton">
                    <input type="submit" value="Purchase"/>                  
                </div>
            </form>

            <a href="homePage.jsp" class="returnButton"><button>Back to Home Page</button></a>
        </table>
    </body>
</html>
