

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Login Staff</title>
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
            .login-body{
                background-color: #EFF0F5;
                min-height: calc(100vh - 108.4px);
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .login-form{
                background-color: #FFFFFF;
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
                width:500px;
                padding: 45px;
                box-shadow: lightgrey 2px 2px 8px 2px;
            }
            .login-title{
                font-family: Raleway-Medium;
                font-size: 30px;
                color: #555555;
                line-height: 1.2;
                text-transform: uppercase;
                text-align: left;
                width: 100%;
                padding-bottom: 32px;

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

            .login-btn{
                outline: none;
                border: none;
                font-size: 20px;
                color: #FFFFFF;
                font-family: Raleway-Bold;
                font-size: 20px;
                line-height: 1.2;
                padding: 0 20px;
                min-width: 150px;
                height: 55px;
                background-color: #333333;
                border-radius: 27px;
                margin-top: 35px;
                transition: all 0.4s;
            }

            .login-btn:hover {
                background-color: #4BA96A;
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

            input:focus{
                border: 3px solid #6B77DA;
            }
            .hightlight{
                color: #8B0000;
            }
            .password-field{
                margin:0;
            }
            .not-hightlight{
                color: #BDBDBD;
            }
            .signuplink, .signuplink:hover, .signuplink:active{
                color: #8B0000;

            }
            .signup{
                text-align: center;
                font-size: 18px;
            }

            .forgotpasswordlink, .forgotpasswordlink:hover , .forgotpasswordlink:active{
                display: block;
                color: #006DC5;
                margin-top: 10px;
                text-align: right;
            }
            .error{
                color:red;
            }
            img {
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
            }
            .toggle-checkbox{
                display: inline;
                margin:5px;
                width: 24px;
                height: 24px;
                position: relative;
                top: 6px;
            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="../homePage.jsp">EZIFIT</a></span>
        </div>
        <div class="login-body">
            
            <div class="login-form">
                  <form method="post" action="j_security_check" method="POST">
                    <div class="login-title">Log in</div>
                    <label>Staff Name</label>
                    <input type="text"  name="j_username" required  />
                    <label>Password</label>

                    <input class="password-field" type="password" name="j_password"  required/>
                    <input type="checkbox" class="toggle-checkbox" onclick="togglePsw()">Show Password

                    <input type="submit" value="LOGIN" class="login-btn"/>
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


