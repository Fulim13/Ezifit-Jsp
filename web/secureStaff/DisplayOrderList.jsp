<%@page import="java.util.List"%>
<%@page  import="model.Orders" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Orders> orderList = (List) session.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>ORDERS | EZIFIT</title>
        <style>
            html{
                overflow: scroll;
                overflow-x: hidden;
            }
            ::-webkit-scrollbar {
                width: 0px;
            }
            ::webkit-scrollbar-thumb{
                background: #FF0000;
            }
            body{
                font-family: 'Arial narrow'; 
            }
            .header{
                font-family: 'Lucida Sans';   
                display: flex; 
                align-items: center; 
                justify-content: space-between; 
                margin: 25px;
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
            .col-2{
                flex-basis: 100%;
                flex-basis: 100%;
                min-width: 300px;
                margin: 10px;
            }
            .col-2 h1{
                font-size: 25px;
                line-height: 0px;
                margin: 18px 0;
                font-family: 'Lucida Sans'; 
                border-bottom: solid;
                border-color: #8B0000;
                display: inline;
            }
            .col-3{
                flex-wrap: wrap;
                flex-basis: 100%;
                min-width: 300px;
                margin: 10px;
            }
            .col-3 h1{
                font-size: 15px;
                line-height: 0px;
                margin: 18px 0;
                font-family: 'Lucida Sans'; 
                text-align: right;
            }
            .col-3 h2{
                font-size: 14px;
                line-height: 2px;
                margin: 0;
                font-family: 'Lucida Sans'; 
                text-align: right;
            }
            .selection {
                padding: 1px 50px;
                width: 150px;
                height: 22px;
                border-color: transparent;
            } 
            .button2 {
                transition: all .5s ease;
                color: #fff;
                border: 3px solid white;
                font-family:'Montserrat', sans-serif;
                text-transform: uppercase;
                text-align: center;
                line-height: 1;
                font-size: 17px;
                padding: 10px;
                outline: none;
                border-radius: 4px;
            }
            .button2:hover {
                color: #001F3F;
                background-color: #fff;
            }
            .orderBar{
                font-family: 'Lucida Sans'; 
                margin: 45px 5px 0 45px;
                font-size: 18px;
            }
            .date{
                margin: -32px 5px 0 1330px;
                font-size: 15px;
                font-style: inherit;
            }
            .total{
                margin-left: 90px;
                margin-top: 10px;
                font-weight: 500;
                letter-spacing: 2.5px;
                font-size: 20px;
                font-style: italic;
                font-weight: bold;
            }
            .orderTable{
                margin: 10px 250px;
                width: 60%;
                margin-left: auto;
                margin-right: auto;
                border: none;
                background-color: white;
            }
            td{
                padding: 10px 20px;
                font-size: 14px;
                border: none;
            }
            tr{
                border: none;
            }
            .row1{
                background-color: white;
                border: none;
            }
            .row1{
                background-color: whitesmoke;
                border: none;
            }
            .orderForm{
                width: 90%;
                margin-top: 50px;
                margin-left: 6%;
            }
            .orderForm button{
                display: inline-block;                
                width: 24%;
                text-align: center;
                margin-bottom: 80px;
                border: 50px;
                background-color: whitesmoke;
                cursor: pointer;
            }
            .orderForm button:hover{
                color: #8B0000;
                background-color: #fff;
                box-shadow: 5px 10px;
            }
            .order div {
                padding: 5px;
                font-family: 'Times New Roman';
                font-size: 18px;
                text-align: center;
                border-radius: 25px;
                border: 2px solid #8B0000; <%-- --%>
            }
            .order div img {
                width: 80px;
                height: 100px;
                border-radius: 50%;
            }  
            .order div:nth-child(3){
                font-size: 15px;
            }
            .explain{
                display: flex;
                align-items: center;
                justify-content: space-between; 
                margin-right: 100px;
                margin-left: 25px;
            }
            .explain li{
                list-style: none;
                text-align: center;
                display: inline-block;
                margin: 20px;                
            }
            .explain li:hover button{
                border: none;
                border-bottom: solid;
                border-color: #8B0000;
            }   
            .explain button{
                border: none;
                border-bottom: solid;
                border-color: transparent;
            }
            .explain button, .dropdown{
                cursor: pointer;
                background-color: transparent;
                font-weight: 600;   
                font-family: 'Arial narrow';
                font-size: 18px;                   
                letter-spacing: 2px;
            }
            .explain .searchInput{      
                width: 160px;
                height: 40px;
                border-radius: 30px;
                font-size: 18px;
            }
            .testimonial{
                background: #fff;
                padding: 10px;
            }
            .testimonial img {
                width: 80px;
                height: 90px;
                border-radius: 50%;
            }   
            .name{
                font-size: 18px;
                margin: 20px 0;
            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="staffHomepage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                <li><a href="../LoadCheckIdentityStaff"><i class="fa fa-user"></i></a></li>
                <li><a href="logoutStaff.jsp"><i class="fa fa-sign-out"></i></a></li>                
            </ul>
        </div>
        <div class="col-3">
            <h1 style="color: #818589">" A good team is a greater action.</h1>
            <h2 text-align="right" style="color: #818589">Believe in your team ! "</h2>
        </div>
        <div class="col-2">
            <h1 style="color: #8B0000">MY ORDERS</h1>
        </div>
        <br>
        <div class="option">
            <form class="searchBox" action="SearchOrder.jsp">
                <label class="orderBar">SEARCH ORDER ID : </label> 
                <select class="selection" name="orderID">
                    <%for (Orders order : orderList) {%>
                    <option value="<%=order.getOrderId()%>">
                        <%=order.getOrderId()%>
                        <%}%>
                </select>
                <button class="button2" name="button"><i class="fa fa-caret-right"></i></button>
                <p class="date"><span id="datetime"></span></p><script>var dt = new Date();
                    document.getElementById("datetime").innerHTML = dt.toLocaleString();</script>  
            </form>
        </div>
        <br>
        <div class="total">
            <%= orderList.size()%> Orders
        </div>
        <br>      <hr style="width: 97%">

        <div class="explain">
            <form action="../orderCategory">
                <ul>
                    <li><button type="submit" name="status" value="ALL">ALL</button></li>
                    <li><button type="submit" name="status" value="PACKAGING">PACKAGING</button></li>
                    <li><button type="submit" name="status" value="SHIPPING">SHIPPING</button></li>
                    <li><button type="submit" name="status" value="DELIVERED">DELIVERED</button></li>
                </ul>
            </form>
        </div>
        <form class="orderForm" action="SearchOrder.jsp">        
            <% for (int i = 0; i < orderList.size(); i++) {%>           
            <button type="submit" name="orderID" value="<%= orderList.get(i).getOrderId()%>">
                <div class="testimonial">
                    <img id="img" src="data:image/jpg;base64,<%=orderList.get(i).getCustomerId().getBase64Image()%>">
                    <div class="name">Order ID <%=orderList.get(i).getOrderId()%></div>
                    <p style="font-size: 20px">Status <%=orderList.get(i).getStatus()%></p>
                </div>
            </button>         
            <% }%>
        </form> 
    </body>
</html>
