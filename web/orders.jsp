<%-- 
    Document   : orders
    Created on : Mar 30, 2022, 4:18:30 PM
    Author     : Lim
--%>
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
                width: 95%;
                height: 400px;
                margin: 20px auto;
                background: #EEEEEE;
                box-shadow: 1px 2px 3px 0px rgba(0,0,0,0.10);
                border-radius: 8px;
            }
            th {
                padding-top: 20px;
                padding-left: 40px;
                padding-bottom: 10px;
                color: #8B0000;
            }
            td {
                padding-left: 40px;
                padding-right: 10px;
                text-align: center;
                padding-bottom: 15px;
            }
            .feedbackButton:link {
                color: #8B0000;
            }            
            .feedbackButton:hover {
                color: cadetblue;
            }
            .feedbackButton:visited {
                color: #333333;
            }
            .returnButton {
                /*margin-top: 20%;*/
                padding-left: 43%;
                font-size: 30px;
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
            <table>
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
                <form action="" method="POST">                   
                    <c:forEach var="orders" items="${ordersList}">                        
                        <!--<a class="order" href="GetReview?orderID=${orders.orderId}">-->
                        <tr>
                            <td>${orders.orderId}</td>
                            <td>${orders.orderDate}</td>
                            <td>${orders.shippingFee}</td>
                            <td>${orders.orderPrice}</td>
                            <td>${orders.paymentMethod}</td>
                            <td>${orders.status}</td>
                            <c:choose>
                                <c:when test="${orders.status=='DELIVERED'}">
                               <td><a href="GetReview?orderID=${orders.orderId}" class="feedbackButton">Add Feedback</a></td>
                            </c:when>    
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        
                        </tr>                          
                        <!--</a>-->                        
                    </c:forEach>                   
                </form>
                </tbody>
            </table>
            <a href="homePage.jsp" class="returnButton"><button>Back to Home Page</button></a>
        </div>
    </body>
</html>
