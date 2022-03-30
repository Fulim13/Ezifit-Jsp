<%-- 
    Document   : orders
    Created on : Mar 30, 2022, 4:18:30 PM
    Author     : Lim
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="" method="POST">
            <c:forEach var="orders" items="${ordersList}">

                <a class="order" href="GetReview?orderID=${orders.orderId}">
                    <div>${orders.orderId}</div>
                    <div>Price ${orders.orderDate}</div>
                    <div>shippingFee ${orders.shippingFee}</div>
                    <div>orderPrice ${orders.orderPrice}</div>
                    <div>paymentMethod ${orders.paymentMethod}</div>
                    <div>status ${orders.status}</div>
                    

                </a>


            </c:forEach>
        </form>
    </body>
</html>
