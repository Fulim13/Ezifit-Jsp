<%-- 
    Document   : registration
    Created on : Mar 20, 2022, 5:06:21 PM
    Author     : Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
%>
<jsp:useBean id="error" scope="session" class="helper.Error" />
<jsp:useBean id="customer" scope="session" class="model.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
        <!--<link rel="stylesheet" href="registration.css">-->
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
            a, a:hover, a:focus, a:active {
                text-decoration: none;
                color: inherit;
            }
            .register-box-with-title{
                background-color:#EFF0F5 ;
                display:flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: calc(100vh - 108.4px);
                border-radius: 10px;
                
            }
            .register-box{
                background-color:#FFFFFF ;
                padding: 40px;
                width: 800px;
            }
            
            .register-box h1{
                padding-bottom: 20px;
                text-transform: uppercase;
            }
            
            .register-form{
                
                display:flex;
                flex-direction: row;

                align-items: flex-start;
                justify-content: space-between;
                
            }
            label {
                display: block;
                font-family: Raleway-SemiBold;
                font-size: 20px;
                color: #555555;
                line-height: 1.4;
                text-transform: uppercase;
                padding-bottom: 5px;
            }
            input {
                display: block;
                outline: none;
                 width: 100%;
                 height: 35px;
                padding: 11px;
                border: 3px solid #e6e6e6;
                border-radius: 2px;
                
            }

            .left{
                width: 45%;
            }
            
            .right{
                width: 45%;
            }
            .signup-btn{
                outline: none;
                border: none;
                display:block;
                 min-width: 150px;
                 margin: 35px auto 0;
                  padding: 10px 20px;
                  font-size: 20px;
                  background-color: #4BA96A;
                  color: #FFFFFF;
                font-family: Raleway-Bold;
            }
            .email{
                background-color: #E9ECEF;
                cursor: auto;
            }
            .toggle-checkbox{
                display: inline;
                margin:5px;
                /*width: auto;*/
                width: 24px;
                height: 24px;
                position: relative;
                top: 6px;
            }
            .password-field{
                margin: 0;
            }
            .error{
                color:red;
                margin-bottom: 20px;
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
        <div class="register-box-with-title">
            <div class="register-box">
                <h1>Sign up</h1>
                <form  action="RegisterProcess" method="POST" class="register-form">
                    <div class="left">
                        <label>Email*</label>
                        <input type="text" class="email" name="email" value="${verifiedEmail2}" readonly/>
                        <label>Verification Code*</label>
                        <input type="text" class="email" name="email" value="${verificationCode}" readonly/>
                    </div>
                    <div class="right">
                        <label>Full Name*</label>
                        <input type="text" name="fullName" value="${customer.fullname}"/>
                        <div class="error">${error.fullNameEmpty ? "FullName is empty" : ""}</div>
                        <label>Phone No*</label>
                        <input type="text" name="phoneNo" value="${customer.phone}"/>
                        <div class="error">${error.phoneNoEmpty ? "Phone number is empty" : ""}</div>
                        <div class="error">${error.phoneNoRedundant ? "This phone number has been registered by another user" : ""}</div>
                        <label>Password*</label>
                        <input type="password" class="password-field" name="password" value="${customer.password}"/>
                        <input type="checkbox" class="toggle-checkbox" onclick="togglePsw()">Show Password
                        <div class="error">${error.passwordNotFollowRequirement ? "Password should more than 7 and <br/>  should have at least one character and one digit":  ""}</div>
                        <div>
                            <button type="submit" class="signup-btn">SIGN UP</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <script>
        function togglePsw(){
            let  x = document.querySelector(".password-field");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
</html>
<% session.removeAttribute("customer"); %>
<% session.removeAttribute("error");%>
