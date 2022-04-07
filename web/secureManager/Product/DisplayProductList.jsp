

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Product, java.util.List"%>
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
            .searchBar{
                display: flex;
                align-items: center;
                justify-content: space-between; 
                margin-right: 100px;
                margin-left: 25px;
            }            
            .searchBar li{
                list-style: none;
                text-align: center;
                display: inline-block;
                margin: 20px;                
            }
            .searchBar li:hover button{
                border: none;
                border-bottom: solid;
                border-color: #8B0000;
            }        
            .searchBar button{
                border: none;
                border-bottom: solid;
                border-color: transparent;
            }
            .searchBar button, .dropdown{
                cursor: pointer;
                background-color: transparent;
                font-weight: 600;   
                font-family: 'Arial narrow';
                font-size: 18px;                   
                letter-spacing: 2px;
            }
            .searchInput{
                border: none;
                outline: none;
                background-color: #D3D3D3;               
                padding-left: 20px;
            }
            .searchBox .searchInput{      
                width: 160px;
                height: 40px;
                border-radius: 30px;
                font-size: 18px;
                margin-left:1195px;
                margin-top: 23px;
            }
            .searchBtn{
                position: absolute;
                top: 140px;
                right: 125px;
                cursor: pointer;
            }                 
            .result{
                margin-left: 90px;
                margin-top: 10px;
                font-weight: 500;
                letter-spacing: 2.5px;
                font-size: 20px;
                font-style: italic;
            }
            .productForm{
                width: 95%;
                margin-top: 30px;
                margin-left: 4%;
            }
            .productForm button{
                display: inline-block;                
                width: 24%;
                text-align: center;
                margin-bottom: 80px;
                border: none;
                background-color: white;
                cursor: pointer;
            }
            .product img{
                width: 85%;
                margin-top: 2%;
                margin-bottom: 20px;
            }
            .product div{
                padding: 5px;
                font-family: 'Arial narrow';
                font-size: 20px;
                letter-spacing: 1px;
                font-weight: 600;
            }
            .product div:nth-child(3){

                font-size: 18px;
            }

            .button {
                text-align: center;
                text-transform: uppercase;
                cursor: pointer;
                font-size: 20px;
                letter-spacing: 4px;
                position: relative;
                background-color: #16a085;
                border: none;
                color: #fff;
                padding: 20px;
                width: 200px;
                text-align: center;
                transition-duration: 0.4s;
                overflow: hidden;
                box-shadow: 0 5px 15px #193047;
                border-radius: 4px;
            }

            .button:hover {
                background: #fff;
                box-shadow: 0px 2px 10px 5px #1abc9c;
                color: #000;
            }

            .button:after {
                content: "";
                background: #1abc9c;
                display: block;
                position: absolute;
                padding-top: 300%;
                padding-left: 350%;
                margin-left: -20px !important;
                margin-top: -120%;
                opacity: 0;
                transition: all 0.8s
            }

            .button:active:after {
                padding: 0;
                margin: 0;
                opacity: 1;
                transition: 0s
            }

            .button:focus { outline:0; }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="../../secureStaff/staffHomepage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                <li><a href="../../LoadCheckIdentityStaff"><i class="fa fa-user"></i></a></li>
                <li><a href="../../secureStaff/logoutStaff.jsp"><i class="fa fa-sign-out"></i></a></li>                
            </ul>
        </div>

        <div class="filter">
            <div class="searchBar">     

                <form class="searchBox" action="../../SearchProductByName">
                    <input type="text" name="searchInput" class="searchInput" placeholder="Enter..." />
                    <div class="searchBtn">
                        <button type="submit"><i class="fa fa-search"></i></button>
                    </div>
                </form>
            </div>
        </div>

        <div class="result">
            Results: <%= productList.size()%>
        </div>

        <form class="productForm" action="../../GetProductDetailsStaff">        
            <% for(int i=0; i<productList.size(); i++){ %>           
            <button style="text" type="submit" name="prodSelected" value="<%= productList.get(i).getProdId()%>">
                <div class="product">                   
                    <img src="data:image/jpg;base64,<%= productList.get(i).getBase64Image() %>">
                    <div>Stock remaining : <%= productList.get(i).getQuantity()%></div>                    
                    <div><%= productList.get(i).getProdName()%> </div>   
                </div>
            </button>         
            <% } %>
        </form>     

    </body>
</html>
