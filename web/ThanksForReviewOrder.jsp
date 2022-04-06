<%-- CHAN KAI LIN --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>REVIEW | EZIFIT</title>
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
            .img{
                width: 100%;
                
            }
            .img img{
                width: 100%;
            }
            .button1 a, .button2 a{
                font-family: 'Lucida Sans'; 
                font-weight: bold;
                font-size: 20px;
                text-decoration: none;
                background-color: rgba(0, 0, 0, 0.17);
                color: black;
                padding: 10px 12px;
                position: absolute;
                bottom: -100px;
            }
            .button1 a{                              
                left: 400px;
            }
            .button2 a{
                right: 380px;
            }
            .button1 a:hover, .button2 a:hover{
                color: white;
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
                <li><a href="GetOrder"><i class="fa fa-shopping-bag"></i></a></li>                
                <li><a href="GetCart"><i class="fa fa-shopping-cart"></i></a></li>
                <li><a href="profile.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="login.jsp"><i class="fa fa-sign-in"></i></a></li>
                        <%}%>       
            </ul>
        </div>
        
        <div class="img">
            <img src="tq.jpg">
        </div>
        
        <div class="button1"><a href="orders.jsp">BACK</a></div>
        <div class="button2"><a href="reviewPage2.jsp">REVIEW PRODUCT</a></div>
    </body>
</html>
