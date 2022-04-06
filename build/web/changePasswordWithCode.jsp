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
            .send-verification, .send-verification:hover,.send-verification:active,.send-verification:focus{
                color:blue;
            }
            .inactiveLink {
                pointer-events: none;
                cursor: default;
                text-decoration: none;
                color: grey;
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
                margin: 35px auto 0;
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
                padding-bottom: 11px;
            }
            input {
                margin-bottom: 35px;
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
            .signup{
                text-align: center;
                font-size: 18px;
            }
            .signuplink, .signuplink:hover, .signuplink:active{
                color: #8B0000;

            }
            .not-hightlight{
                color: #BDBDBD;
            }
            .login{
                color: blue;
                text-align: center;
                padding:20px 0;
            }
            .whichJSP{
                display: none;
            }
            .email{
                background-color: lightgray;
            }
            .verification-field{
                margin:0;;
            }
            .resend{
                text-align: left;
                padding-top: 5px;
            }
            .error{
                color:red;
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
        <div class="forgot-body">
            <div class="forgot-form">
                <h1>Forgot Password</h1>
                <form  action="CheckVerificationCode" method="POST" class="register-form">
                    <input name="whichJSP" value="changePasswordWithCode" hidden class="whichJSP"/>
                    <label>Email</label>
                    <input type="text" class="email" name="email" value="${verifiedEmail}" readonly/>
                    <label>Verification</label>
                    <input type="text" name="verificationCode" class="verification-field" />
                    <div class="error">${error.vCodeNotMatch ? "Verification Not Match" : ""}</div>
                    <div class="error">${error.vCodeExpire ? "Verification Expired, Wait for 60 Seconds , click the link below" : ""}</div>   
                    <div class="resend">
                        <a href="" class="send-verification inactiveLink"></a>
                    </div>

                    <button type="submit" class="btn-submit">Submit</button>
                </form>

                <div class="login">
                    <a href="login.jsp">Already member?</a>
                </div>
                <div class="signup">
                    <span class="not-hightlight">New to Ezifit?  &nbsp;</span><a href="signup.jsp" class="signuplink">Sign up</a>
                </div>
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
                document.querySelector(".send-verification").href = "CheckEmailInDB?email=" + email;
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