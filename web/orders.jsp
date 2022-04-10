<%-- 
    Document   : orders
    Created on : Mar 30, 2022, 4:18:30 PM
    Author     : Lim
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="model.Orders"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have not logged in , to profile page
    if (!loggedIn) {
        response.sendRedirect(request.getContextPath());
        return;
    }
    List<Orders> orderList = (List) session.getAttribute("ordersList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>ORDERS | EZIFIT </title>
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
            h3 {
                text-align: center;
                font-size: 20px;
                color: #8B0000;
            }
            .container {              
                margin: 40px auto 80px auto;              
            }
            .table{
                margin: 20px auto;
                border-collapse: collapse;
            }
            th {
                padding: 10px 12px;
                color: white;
                background-color: black;
            }
            td {
                border: solid;
                text-align: center;
                padding: 15px ;
            }        
            .feedbackButton i:hover {
                color: #8B0000;
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
            a, a:hover, a:focus, a:active {
                text-decoration: none;
                color: inherit;
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

        <h3>My Orders</h3>

        <div class="container">
            <table class="table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Shipping Fees</th>
                        <th>Prices</th>
                        <th>Payment Method</th>
                        <th>Status</th>
                        <th>Feedback</th>
                    </tr>
                </thead>

                <tbody>
                    <% SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy"); %>    
                    <% for (int i = 0; i < orderList.size(); i++) {%>                                              
                    <tr>
                        <td><%= orderList.get(i).getOrderId()%></td>
                        <td><%= ft.format(orderList.get(i).getOrderDate())%></td>
                        <td><%= orderList.get(i).getShippingFee()%></td>
                        <td><%= orderList.get(i).getOrderPrice()%></td>
                        <td><%= orderList.get(i).getPaymentMethod()%></td>
                        <td><%= orderList.get(i).getStatus()%></td>
                        <% if (orderList.get(i).getStatus().equalsIgnoreCase("DELIVERED")) {%>                                
                        <td><a href="GetReview?orderID=<%= orderList.get(i).getOrderId()%>" class="feedbackButton"><i class="fa fa-comments"></i></a></td>
                                <% } else { %>                              
                        <td></td>                           
                        <% } %>                       
                    </tr>                                                                          
                    <% }%>                   

                </tbody>
            </table>

        </div>
        <div class="returnButton"><a href="homePage.jsp">Back to Home Page</a></div>
    </body>
</html>
