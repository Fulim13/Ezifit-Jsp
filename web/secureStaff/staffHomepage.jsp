<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html lang="en" dir="ltr">
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
            .slogan {
                font-family: 'Arial narrow';
                font-weight: 600;
                font-size: 25px;
                text-align: center;
                padding-top: 40px;      
                word-spacing: 10px;
                letter-spacing: 1px;
                margin-left: -260px;
             }
             .slogan span{
                 font-size: 35px;
                 color: #8B0000;
             }
             .s1{
                 margin-top: 60px;
                 margin-left: 260px;
                 letter-spacing: 10px;
             }
             .s2{
                letter-spacing: 10px;
             }
             .banner{
                 position: relative;
                 width: 90%;
             }
              .banner2{
                 position: relative;
                 width: 90%;
             }
             .heading{
                 color: white;
                 position: absolute;
                 top: 30%;
                 left: -41.5%;
                 width: 100%;
                 text-align: center;
                 font-size: 23px;
                 letter-spacing: 0px;
             }
             .heading2{
                 color: white;
                 position: absolute;
                 top: 30%;
                 left: -23%;
                 width: 100%;
                 text-align: center;
                 font-size: 23px;
                 letter-spacing: 0px;
             }
             .heading3{
                 color: white;
                 position: absolute;
                 top: 30%;
                 left: -5%;
                 width: 100%;
                 text-align: center;
                 font-size: 23px;
                 letter-spacing: 0px;
             }
             .heading4{
                 color: white;
                 position: absolute;
                 top: 30%;
                 left: 13%;
                 width: 100%;
                 text-align: center;
                 font-size: 23px;
                 letter-spacing: 0px;
             }
             .heading5{
                 color: white;
                 position: absolute;
                 top: 30%;
                 left: 31%;
                 width: 100%;
                 text-align: center;
                 font-size: 23px;
                 letter-spacing: 0px;
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
        <hr style="width: 97%;"> 
        <div class="s1">
            <div class="banner">
               <a href="../LoadRating">
                <img src="s1.jpeg" alt="" style="width: 17%;" /></a>
                <h2 class="heading" >Customer <br/> Review</h2>
                <a href="../ViewCustomer">
                    <img src="s2.jpeg" alt="" style="width: 17%;" /></a>
                    <h2 class="heading2">Customer<br/>  Record</h2>
                <a href="../LoadOrderDetailsList">
                    <img src="s3.jpeg" alt="" style="width: 17%;" /></a>
                    <h2 class="heading3">Order Status</h2>
                <a href="../ViewReportListServlet">
                    <img src="s4.jpeg" alt="" style="width: 17%;" /></a>
                    <h2 class="heading4">Sales Record</h2>
                    <a href="../secureManager/reportPage.jsp">
                    <img src="s5.jpeg" alt="" style="width: 17%;" /></a>
                    <h2 class="heading5">Report</h2>
            </div>
           
        <div class="slogan">- A good team is a greater action ! <span>Believe</span> in your team -</div>
        <br><br><br><br>
        <div class="s2">
            <div class="banner2">
               <a href="../ViewReportListServlet">
                <img src="s6.jpeg" alt="" style="width: 17%;" /></a>
                <h2 class="heading" >View Product</h2>
                <a href="../LoadProductList">
                    <img src="s7.jpeg" alt="" style="width: 17%;" /></a>
                    <h2 class="heading2">Maintain<br/>  Product</h2>
                <a href="AddProduct.jsp">
                    <img src="s8.jpeg" alt="" style="width: 17%;" /></a>
                    <h2 class="heading3">Add Product</h2>
                <a href="../LoadStaffList">
                    <img src="s9.jpeg" alt="" style="width: 17%;" /></a>
                    <h2 class="heading4">Maintain Staff</h2>
                    <a href="../secureManager/Staff/registerStaff.jsp">
                    <img src="s10.jpeg" alt="" style="width: 17%;" /></a>
                    <h2 class="heading5">Register Staff</h2>
            </div>
        </div>
        <br><br><br><br><br><br><br>
        
        </body>
</html>
