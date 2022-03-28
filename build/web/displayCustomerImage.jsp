<%-- 
    Document   : displayCustomerImage
    Created on : Mar 28, 2022, 12:46:19 PM
    Author     : Lim
--%>

<%@page import="model.Customer,java.util.List" contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:useBean id="customer" scope="session" class="" />--%>
<%
  List<Customer> customerList = (List)session.getAttribute("customerList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <img src="data:image/jpg;base64,<%= customerList.get(8).getBase64Image() %>" />
    </body>
</html>
