<%-- CHAN KAI LIN --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//    boolean loggedIn = false;
//    System.out.println(session.getAttribute("loggedin"));
//    if(session.getAttribute("loggedin") != null){
//        loggedIn = (Boolean) session.getAttribute("loggedin");
//    }
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    System.out.println(loggedIn);
//    System.out.println(loggedIn);

//    Customer customer = (Customer) session.getAttribute("customer");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>HOME | EZIFIT</title>
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
            .home1 {
                animation-name: home1;
                animation-duration: 7s;
            }            
            @keyframes home1 {
                from {filter:brightness(30%)} 
                to {filter:brightness(80%)}
            }
            .dot {
                background-color: rgb(187, 187, 187);
                height: 10px;
                width: 10px;
                margin: 0 2px;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 7s ease;
            }
            .active {
                background-color: rgb(89, 89, 89);
            }
            .slogan {
                font-family: 'Arial narrow';
                font-weight: 600;
                font-size: 25px;
                text-align: center;
                padding-top: 90px;      
                word-spacing: 10px;
                letter-spacing: 1px;
            }
            .slogan span{
                font-size: 35px;
                color: #8B0000;
                text-decoration: line-through;
            }
            .container {
                position: relative;
                width: 100%;
                border: none;
                background-color: transparent;
                cursor: pointer;
            }
            .overlay{
                position: absolute;
                bottom: 0;
                left: 8px;
                right: 0;
                background-color: rgba(0, 0, 0, 0.5);
                overflow: hidden;
                width: 96%;
                height: 0;
                transition: .5s ease;
            }
            .container:hover .overlay{
                height: 10%;
            }
            .text {
                color: white;
                font-size: 20px;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                text-align: center;
            }
            .container img{
                display: block;
            }
            a, a:hover, a:focus, a:active {
                text-decoration: none;
                color: inherit;
            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="homePage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                <!--                <li><a href=""><i class="fa fa-facebook"></i></a></li>
                <li><a href=""><i class="fa fa-twitter"></i></a></li>-->
                <li>|</li>
                
                <%if(loggedIn){%>
                 <li><a href="profile.jsp"><i class="fa fa-user"></i></a></li>
                  <%} else {%>
                  <li><a href="login.jsp"><i class="fa fa-user"></i></a></li>
                 <%}%>
                <%if(loggedIn){%>
                <li><a href="GetOrder">My Order</a></li>
                <li><a href="Logout">Logout</a></li>
                <%} else {%>
                <li><a href="login.jsp">Login</a></li>
                <%}%>
                <li><a href="GetCart"><i class="fa fa-shopping-cart"></i></a></li>
                <!--<li><a href=""><i class="fa fa-sign-out"></i></a></li>-->             
            </ul>
        </div>

        <div class="home1">
            <img src="home1.jpg" alt="" style="width: 100%;" />     
        </div>
        <div class="home1">
            <img src="home2.jpg" alt="" style="width: 100%;" />     
        </div>
        <div class="home1">
            <img src="home3.jpg" alt="" style="width: 100%;" />     
        </div>

        <div style="text-align:center">
            <span class="dot"></span> 
            <span class="dot"></span> 
            <span class="dot"></span> 
        </div>

        <div class="slogan">- BELIEVE <span>YOU</span> ARE STRONGER THAN <span>YOU</span> KNOW -</div>

        <form action="GetProduct">
            <table style="text-align: center; margin: 70px; border-spacing: 65px;">
                <tr>
                    <td width="500px">
                        <button type="submit" name="category" value="M" class="container">
                            <img src="home4.png" alt="" style="width: 100%;" />
                            <div class="overlay">
                                <div class="text">MEN</div>
                            </div>
                        </button>                   
                    </td>

                    <td width="500px">
                        <button type="submit" name="category" value="W" class="container">
                            <img src="home5.jpg" alt="" style="width:100%;" />
                            <div class="overlay">
                                <div class="text">WOMEN</div>
                            </div>
                        </button>                    
                    </td>

                    <td width="500px">
                        <button type="submit" name="category" value="K" class="container">
                            <img src="home6.png" alt="" style="width: 100%;" />
                            <div class="overlay">
                                <div class="text">KIDS</div>
                            </div>
                        </button>                   
                    </td>
                </tr>
            </table>
        </form>       
        <script>
            var slideIndex = 0;
            showSlides();

            function showSlides() {
                var i;
                var slides = document.getElementsByClassName("home1");
                var dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "grid";
                dots[slideIndex - 1].className += " active";
                setTimeout(showSlides, 7000);
            }
        </script>
    </body>
</html>
