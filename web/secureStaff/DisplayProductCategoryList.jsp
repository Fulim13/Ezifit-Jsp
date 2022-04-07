<%-- 
    Document   : DisplayProductCategoryList
    Created on : Mar 24, 2022, 9:02:37 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page  import="model.CartItem" %>
<%@page  import="model.Product" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--
<%
  List<CartItem> cartItemList = (List)session.getAttribute("cartItemList");
%>
--%>
<%
    List<Product> productList = (List) session.getAttribute("productList");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>PRODUCTS | EZIFIT</title>
        <style>
            body{
                font-family: 'Arial narrow'; 
            }
            .header{
                font-family: 'Lucida Sans';   
                display: flex; 
                align-items: center; 
                justify-content: space-between; 
                margin: 25px;
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
            .submitBtn{
                margin-top: 20px;
                text-align: center;
            }
            .submitBtn input{
                font-family: 'Lucida Sans'; 
                font-size: 18px;
                font-weight: bold;
                background-color: transparent;
                border: none;
                cursor: pointer;
                padding: 10px;
            }
            .submitBtn input:hover{
                background-color: black;
                color: white;
            }
            .col-2{
                flex-basis: 100%;
                flex-basis: 100%;
                min-width: 300px;
                margin: 10px;
            }
            .col-2 h1{
                font-size: 25px;
                line-height: 0px;
                margin: 18px 0;
                font-family: 'Lucida Sans'; 
                border-bottom: solid;
                border-color: #8B0000;
                display: inline;
            }
            .col-3{
                flex-wrap: wrap;
                flex-basis: 100%;
                min-width: 300px;
                margin: 10px;
            }
            .col-3 h1{
                font-size: 15px;
                line-height: 0px;
                margin: 18px 0;
                font-family: 'Lucida Sans'; 
                text-align: right;
            }
            .col-3 h2{
                font-size: 14px;
                line-height: 2px;
                margin: 0;
                font-family: 'Lucida Sans'; 
                text-align: right;
            }
            .pro{
                border-collapse: collapse;
            }
            .header_fixed{
                height: 750px;
                overflow: auto;
                margin-top: 20px;
                border: 1px solid #dddddd;
                width: 80%;
                margin-left: auto;
                margin-right: auto;
            }
            .header_fixed thead th{
                position: sticky;
                top: 0;
                font-size: 15px;
                font-weight: 800;
                background-color: white;
                color: #8B0000;
            }
            th{
                border-bottom: 1px solid #dddddd;
                padding: 10px 20px;
                font-size: 16px;
                text-align: center;

            }
            td{
                border-bottom: 1px solid #dddddd;
                padding: 10px 20px;
                font-size: 15px;
                text-align: center;
                border-style: inset;
            }
            td img{
                width: 85%;
                margin-top: 2%;
                margin-bottom: 20px;
            }
            <%--
            tr:hover td{
                color: black;
                cursor: pointer;
                background-color: #FFFFFF;
                font-weight: bolder;
                transform: scale(1.2);
            }
            --%>
            ::-webkit-scrollbar{
                width: 6px;
            }
            ::-webkit-scrollbar-track{
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3)
            }

            ::-webkit-scrollbar-thumb{
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3)
            }
            
            .searchInput{
                border: transparent;
                background-color: #D3D3D3;               
                padding-left: 20px;
                position: relative;
            }
            .searchBox .searchInput{      
                width: 160px;
                height: 40px;
                border-radius: 30px;
                font-size: 18px;
                margin-left: 1180px;
            }
            .searchBtn{
                position: absolute;
                top: 210px;
                left: 1330px;
                cursor: pointer;
                background-color: transparent;
                border:none;
                outline: none;
            }  

            .searchBtn button[type=submit]{
                border: none;
                outline: none;
                background: transparent;
                cursor: pointer;
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
        <div class="col-3">
            <h1 style="color: #818589">-&nbsp;" A good team is a greater action.</h1>
            <h2 text-align="right" style="color: #818589">Believe in your team !&nbsp; "-</h2>
        </div>
        <div class="col-2">
            <h1 style="color: #8B0000">PRODUCT OVERVIEW></h1>
        </div>
        <br>        <hr style="width: 97%">
        
         <form class="searchBox" action="../SearchProductView">
                <input type="text" name="search_for_product" class="searchInput" placeholder="Search..." />
                <div class="searchBtn">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </div>
            </form> 
        <div class="header_fixed">
            <table class="pro">
                <form action="../SalesRecord">
                    <thead>
                        <tr>
                            <th style="width:5%">Product ID</th>
                            <th style="width:20%">Product Picture</th>
                            <th style="width:20%">Product Name</th>
                            <th style="width:30%">Product Description</th>
                            <th style="width:10%">Product Category</th>
                            <th style="width: 5%">Product Size</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product product : productList) {%>
                        <tr>
                            <td style="width:1%"> <%=product.getProdId()%></td> 
                            <td><img src="data:image/jpg;base64, <%=product.getBase64Image()%>" ></td>
                            <td> <%=product.getProdName()%></td>
                            <td> <%=product.getDescription()%></td>
                            <td> <%=product.getCategory()%></td>   
                            <td> <%=product.getSize()%></td>
                        </tr>
                        <%  }%>
                    </tbody>
            </table>
            <div class="submitBtn"><input type="submit" value="VIEW SALES" /><div>
                </div>          
                </form>
                </table>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                </body>
                </html>
