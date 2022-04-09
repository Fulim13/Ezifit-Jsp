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
    List<CartItem> cartItemtList = (List) session.getAttribute("cartItemList");
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
                height: 130px;
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
                vertical-align: middle;               
                text-align: center;
            }
            .image {
                vertical-align: middle;               
                text-align: center;
                width: 20%;
            }
            .name{
                width: 35%;
            }
            .size{
                width: 8%;
            }
            .name, .size{
                font-weight: bold;
                vertical-align: middle;               
                text-align: center;
            }
            .quantity {
                vertical-align: middle;               
                text-align: center;
                font-weight: bold;
                width: 8%;
            }
            .updateButton {
                padding-top: 38px;
                margin-right: 60px;
            }
            .subtotal {
                font-weight: bold;
                vertical-align: middle;               
                text-align: center;    
                width: 20%;
            }

            .returnButton, .purchaseButton {
                text-align: center;  
                margin: 45px 0px;
                
            }
            .returnButton a, .purchaseButton input {
                color: black;
                text-decoration: none;
                font-weight: bold;
                padding: 10px;
                border: none;
                background-color: transparent;
                font-size: 15px;
            }
            .returnButton a:hover, .purchaseButton input:hover{
                background-color: black;
                color: white;
            }
            .table{
                margin: 10px auto;                
                width: 60%;
                border-color: #EEEEEE;
                border-collapse: collapse;
            }
            .table tr{
                border:solid 15px white;
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
            <h3>Cart</h3>
        </div>

        <div class="button">
            <a href="cart.jsp"><button id="btn1">MAKE CHANGES</button></a>
            <button id="btn2">MAKE PAYMENT</button>
        </div>


        <form action="MakeOrder" method="POST">
            <table class="table">  

                <% for (int i = 0; i < cartItemtList.size(); i++) {%>    
                <tr class="shopping-cart"> 
                    <td>
                        <div class="select">
                            <input type="checkbox" name="cartItemList" value="<%= cartItemtList.get(i).getCartId()%>">
                        </div>
                    </td>

                    <td class="image">
                        <img src="data:image/jpg;base64,<%= cartItemtList.get(i).getProdId().getBase64Image()%>">
                    </td>
                    <td class="name">
                        <%= cartItemtList.get(i).getProdId().getProdName()%>
                    </td>
                    <td class="size">
                        <%= cartItemtList.get(i).getProdId().getSize()%>
                    </td>
                    <td class="quantity">
                        
                            <%= cartItemtList.get(i).getPurchaseQty()%>
                        
                        
                    </td>
                    <td class="subtotal">MYR<%= String.format("%.2f", cartItemtList.get(i).getSubtotal())%></td>
                </tr>
                <tr style="margin: 50px;"></tr>
                <% }%>  




            </table>
            <table style="margin: 45px auto; width: 50%;">
                <tr>
                <td class="purchaseButton">
                    <input type="submit" value="Purchase"/>                  
                </td>
                <td class="returnButton">
                    <a href="homePage.jsp">Back to Home Page</a>
                </td>
                </tr>
            </table>
        </form>
    </body>
</html>
