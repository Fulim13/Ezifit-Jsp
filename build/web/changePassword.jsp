<%-- 
    Document   : changePassword
    Created on : Mar 29, 2022, 7:14:20 PM
    Author     : Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have logged in , to sign up agains
    if (loggedIn) {
        response.sendRedirect(request.getContextPath());
        return;
    }
%>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
             *{
                box-sizing: border-box;
            }
            body{
                font-family: 'Lucida Sans'; 
                margin: 0;
                padding: 0;
            }
            .header{
                display: flex; 
                align-items: center; 
                justify-content: space-between; 
                margin: 20px
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
            a, a:hover, a:focus, a:active {
                text-decoration: none;
                color: inherit;
            }
             .forgot-body{
                background-color: #EFF0F5;
                min-height: calc(100vh - 108.4px);
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .forgot-form{
                background-color: #FFFFFF;
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
                width:500px;
                padding: 45px;
                box-shadow: lightgrey 2px 2px 8px 2px;
            }
            .btn-submit{
                outline: none;
                border: none;
                display:block;
                min-width: 100%;
                margin: 20px auto 0;
                padding: 10px 20px;
                font-size: 20px;
                background-color: #4BA96A;
                color: #FFFFFF;
                font-family: Raleway-Bold;
            }
            label {
                display: block;
                font-family: Raleway-SemiBold;
                font-size: 20px;
                color: #555555;
                line-height: 1.4;
                text-transform: uppercase;
                padding-bottom: 5px;
                margin-top: 20px;
            }
            input {
                outline: none;
                font-family: Raleway-Medium;
                color: #555555;
                line-height: 1.2;
                font-size: 18px;
                display: block;
                width: 100%;
                background: transparent;
                height: 45px;
                padding: 0 10px;
                border: 3px solid #e6e6e6;
                border-radius: 2px;
                
            }
            .error{
                color:red;
            }
            .toggle-checkbox{
                display: inline;
                margin:5px;
                width: 24px;
                height: 24px;
                position: relative;
                top: 6px;
             
            }
            .email{
                background-color: lightgray;
            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="homePage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                <li>|</li>
                    <%if (loggedIn) {%>
                <li><a href="profile.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="GetOrder">My Order</a></li>
                <li><a href="Logout">Logout</a></li>
                <li><a href="GetCart"><i class="fa fa-shopping-cart"></i></a></li>
                        <%} else {%>
                <li><a href="login.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="login.jsp">My Order</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="login.jsp"><i class="fa fa-shopping-cart"></i></a></li>
                        <%}%>       
            </ul>
        </div>
        <div class="forgot-body">
            <div class="forgot-form">
                <h1>Change Password</h1>
                <form action="ChangePassword" method="POST">
                    <label>Email</label>
                    <input type="text" name="email" value="${verifiedEmail2}" readonly class="email"/>
                    <label>Password</label>
                    <input type="password" name="password" class="password"/>
                    <input type="checkbox" class="toggle-checkbox" onclick="togglePsw()">Show Password
                    <label>Comfirm Password</label>
                    <input type="password" name="confirmPassword" class="confirmPassword"/>
                    <input type="checkbox" class="toggle-checkbox" onclick="togglePsw2()">Show Password
                    <p class="error">${error.passwordNotSame ? "Password not same" : ""}</p>
                    <p class="error">${error.passwordNotFollowRequirement ? "Password should more than 7 and should have at least one character and one digit":  ""}</p>
                    <button type="submit" class="btn-submit">Change</button>
                </form>
            </div>
        </div>
    </body>
    <script>
        function togglePsw(){
            let  x = document.querySelector(".password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
        function togglePsw2(){
            let  x = document.querySelector(".confirmPassword");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
</html>
<% session.removeAttribute("error");%>