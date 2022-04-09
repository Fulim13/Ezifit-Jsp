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
    List<CartItem> cartItemtList = (List)session.getAttribute("cartItemList");
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
                margin: 0px 90px 10px 90px;     
                border: none;
                border-radius: 30px;
                padding: 12px;
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
            .removeButtons {
                vertical-align: middle;               
                text-align: center;               
                margin-left: 10px;
            }
            .removeButtons a{
                color: #8B0000;
            }
            .removeButtons a:hover{
                color: black;
            }           
            .image {
                vertical-align: middle;               
                text-align: center;
            }
            .name{
                width: 25%;
            }
            .size{
                width: 10%;
            }
            .name, .size{
                font-weight: bold;
                vertical-align: middle;               
                text-align: center;
            }
            .quantity {
                vertical-align: middle;               
                text-align: center;
            }
            .quantity input {
                text-align: center;
                width: 40px;
                font-size: 16px;
                color: #8B0000;
                font-weight: bold;
            }
            .updateButton {
                text-align: center;
                margin-top: 15px;
            }
            .updateButton input{
                background-color: transparent;
                border: none;
                font-weight: bold;
                cursor: pointer;
            }
            .updateButton input:hover{
                color: #8B0000;
            }
            .subtotal {
                font-weight: bold;
                vertical-align: middle;               
                text-align: center;    
                width: 20%;
            }
            .returnButton {
                text-align: center;  
                margin: 45px 0px;
            }
            .returnButton a{
                color: black;
                text-decoration: none;
                font-weight: bold;
                padding: 10px;
            }
            .returnButton a:hover{
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
            <br>
        </div>

        <div class="button">
            <button id="btn1">MAKE CHANGES</button>
            <a href="purchase.jsp"><button id="btn2">MAKE PAYMENT</button></a>
        </div>
        
        <table class="table">  
            
            <% for(int i=0; i<cartItemtList.size(); i++){ %>    
                <tr class="shopping-cart"> 
                    
                        <td>
                            <div class="removeButtons">
                                <a href="RemoveCartItem?id=<%= cartItemtList.get(i).getCartId() %>"><i class="fa fa-trash"></i></a>
                            </div>
                        </td>

                        <td class="image">
                            <img src="data:image/jpg;base64,<%= cartItemtList.get(i).getProdId().getBase64Image() %>">
                        </td>
                        <td class="name">
                            <%= cartItemtList.get(i).getProdId().getProdName() %>
                        </td>
                        <td class="size">
                            <%= cartItemtList.get(i).getProdId().getSize() %>
                        </td>
                        <td>
                        <form action="UpdateQty" method="post">
                            <div class="quantity">
                                <input type="number" name="qty" min="1" max="<%= cartItemtList.get(i).getProdId().getQuantity() %>" placeholder="<%= cartItemtList.get(i).getPurchaseQty() %>">
                                <!--<input type="text" name="qty" placeholder="${cartItem.purchaseQty}">-->
                                <input type="hidden" name="id" value="<%= cartItemtList.get(i).getCartId() %>">
                            </div>
                            <div class="updateButton">
                                <input type="submit" value="update">
                            </div>
                        </form>
                        </td>
                        <td class="subtotal">MYR<%= String.format("%.2f", cartItemtList.get(i).getSubtotal()) %></td>
                </tr>
                <tr style="margin: 50px;"></tr>
            <% } %>              
        </table>
        <div class="returnButton"><a href="homePage.jsp">Back to Home Page</a></div>
        
 
    </body>
</html>
