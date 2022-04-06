<%-- 
    Document   : orderHaveMade
    Created on : Apr 1, 2022, 11:25:16 AM
    Author     : Lim
--%>

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
        <title>JSP Page</title>
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }

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
            img{
                width: 100px;
                height: 100px;
            }

            textarea {
                display: block;
                outline: none;
                resize: none;
                border: 2px lightgray solid;
                width:100%;
                margin: 20px 0;
            }
            a, a:hover, a:focus, a:active {
                text-decoration: none;
                color: inherit;
            }


            .box{
                display: flex;
                justify-content: flex-start;
                flex-direction: column;
                align-items: center;
                min-height: calc(100vh - 108.4px);
                
            }
            
            .title{
                font-size: 25px;
                margin: 40px 0 20px ;
            }
            .link, .link:hover,.link:active,.link:focus{
                color: blue;
                text-decoration: underline;
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

        <div class="box">
            <div class="title">Payment have made before </div>
            <div>
                <a href="orders.jsp" class="link">Go to Order Page</a>
            </div>
            <div>
                <a href="homePage.jsp" class="link">Back to Home page</a>
            </div>
        </div>
    </body>
</html>
