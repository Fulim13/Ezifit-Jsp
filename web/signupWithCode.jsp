<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .send-verification, .send-verification:hover, .send-verification:active{
                padding-top: 20px;
                display:block;
                text-align: center;
                width: 45%;
                color: blue;
            }
            .inactiveLink {
                pointer-events: none;
                cursor: default;
                text-decoration: none;
                color: grey;
            }
            a, a:hover, a:focus, a:active {

                color: blue;
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
                <li><a href="login.jsp"><i class="fa fa-shopping-bag"></i></a></li>                
                <li><a href="login.jsp"><i class="fa fa-shopping-cart"></i></a></li>
                <li><a href="login.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="login.jsp"><i class="fa fa-sign-in"></i></a></li>
                        <%}%>       
            </ul>
        </div>
        <div class="register-box-with-title">
            <div class="register-box">
                <h1>Sign up</h1>
                <form  action="CheckVerificationCode" method="POST" class="register-form">
                    <input name="whichJSP" value="signUpWithCode" hidden style="display:none"/>
                    <div class="left">

                        <label>Email</label>
                        <input type="text" class="email" name="email" value="${verifiedEmail}" readonly/>
                        <label>Verification Code*</label>
                        <input type="text" name="verificationCode" />
                        <div class="error">${error.vCodeNotMatch ? "Verification Not Match" : ""}</div>
                        <div class="error">${error.vCodeExpire ? "Verification Expired, Wait for 60 Seconds , click the link below" : ""}</div>    
                        <button type="submit" class="btn-submit">Check Verification Code</button>
                    </div>
                    <div class="right"></div>
                </form>
                <a href="" class="send-verification inactiveLink"></a>
            </div>
        </div>
    </body>
    <script>
        let timeleft = 60;
        let countDownTimer = setInterval(function () {
            if (timeleft <= 0) {
                clearInterval(countDownTimer);
                let email = document.querySelector(".email").value
                document.querySelector(".send-verification").innerHTML = "Send verification code again"
                document.querySelector(".send-verification").href = "CheckEmail?email=" + email;
                document.querySelector(".send-verification").classList.remove("inactiveLink");
            } else {
                document.querySelector(".send-verification").innerHTML = "Resend ? Wait for " + timeleft;
                timeleft -= 1;
            }

        }, 1000);
        countDownTimer();
    </script>
</html>
<%session.removeAttribute("error");%>