<%-- 
    Document   : signup
    Created on : Mar 28, 2022, 1:22:17 AM
    Author     : Lim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="error" scope="session" class="helper.Error" />
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have logged in , to sign up agains
    if (loggedIn) {
        response.sendRedirect(request.getContextPath());
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .no-click {
                pointer-events: none;
            }
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
                height: 481px;
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
                margin-bottom: 20px;
            }
            .btn-submit{
                 outline: none;
                border: none;
                display:block;
                 min-width: 100%;
                 margin: 35px auto 0;
                  padding: 10px 20px;
                  font-size: 20px;
                  background-color: #4BA96A;
                  color: #FFFFFF;
                font-family: Raleway-Bold;
            }
            .left{
                width: 45%;
            }
            .right{
                width: 45%;
                font-size: 100px;
                height:100%;
            }
            
            .error{
                color: red;
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
                <form  action="CheckEmail" method="POST" class="register-form">
                    <div class="left">
                    <label>Email</label>
                    <input class="email" type="text" name="email" value="${email}" required/>
                    <div class="jserror"></div>
                    <div class="error">${error.emailEmpty ? "Email is empty" : ""}</div>
                    <div class="error">${error.emailRedundant ? "This email has been registered by another user" : ""}</div>
                    <button type="submit" class="btn-submit" onClick="return validateEmail();">GET VERIFICATION CODE</button>
                    </div>
                    <div class="right"></div>
                </form>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        function validateEmail() {

            let emailField = document.querySelector(".email");
            var emailFormat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
            console.log(emailField.value);
            if (emailField.value.match(emailFormat)) {
                console.log("Hi");
                
                document.querySelector(".jserror").innerHTML = "";
                document.querySelector(".btn-submit").innerHTML = "Waiting...";
                document.querySelector(".btn-submit").style.pointerEvents  = "none";
                emailField.style.backgroundColor = "lightgrey";
                emailField.readOnly = true;
                return true;

            } else {
                console.log("Bye");
                document.querySelector(".jserror").style.color = "red";
                document.querySelector(".jserror").innerHTML = "Invalid Email Address";
                emailField.value = "";
                emailField.focus();
                return false;
            }
        }

    </script>
</html>
<%session.removeAttribute("email");%>
<%session.removeAttribute("error");%>