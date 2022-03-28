<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Product, java.util.List"%>
<%
  List<Product> productSelected = (List)session.getAttribute("productSelected");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title><%= productSelected.get(0).getProdName() %> | EZIFIT</title>        
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
            table{
                width: 90%;
                padding-top: 30px;
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 20px;
            }
            .picture{
                width: 40%; 
                vertical-align: top;
            }
            .picture img{
                width: 100%;
            }
            .info{
                width: 60%;               
                padding-left: 8%;               
                vertical-align: top;
            }
            .name{
                font-size: 70px;
                letter-spacing: 5px;
                font-weight: 300;               
            }
            .category{
                font-size: 20px;
                color: #989898;
                font-style: italic;
                margin-bottom: 25px;
            }
            .price{
                font-size: 23px;
                letter-spacing: 2px;
                font-weight: bold;
                color: #5F4D2A;
                margin-bottom: 60px;
            }
            .sizeTitle{
                font-size: 23px;                
                letter-spacing: 1px;
                margin-bottom: 15px;
            }
            .size > label > span{
                border: solid;
                border-width: 2px;
                border-color: #989898;
                border-radius: 10px;
                padding: 4px 12px;
                font-family: "Lucida Sans";
                font-size: 23px;
                cursor: pointer;
                margin-right: 20px;
            }
            .size > label > span:hover{
                border-color: black;
            }
            .description{
                font-size: 20px;
                letter-spacing: 1px;
                margin-top: 30px;
                margin-bottom: 40px;
                line-height: 1.5;
            }
            .submitBtn{
                width: 55%;                 
                box-shadow: 12px 13px rgba(139, 0, 0, 0.7);;
                margin-left: auto;
                margin-right: auto;
            }
            
            .submitBtn input{
                border: none;
                background-color: #8B0000;
                width: 100%;
                height: 65px;
                vertical-align: middle;
                color: white;
                font-family: 'Arial narrow'; 
                font-size: 24px;
                letter-spacing: 1.5px;
                font-weight: bold;
                cursor: pointer;
                
            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="homePage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                <li><a href=""><i class="fa fa-facebook"></i></a></li>
                <li><a href=""><i class="fa fa-twitter"></i></a></li>
                <li>|</li>
                <li><a href=""><i class="fa fa-user"></i></a></li>
                <li><a href=""><i class="fa fa-shopping-cart"></i></a></li>
                <li><a href=""><i class="fa fa-sign-out"></i></a></li>                
            </ul>
        </div>
        
        <table>
            <tr>
                <td class="picture">
                    <img src="data:image/jpg;base64,<%= productSelected.get(0).getBase64Image() %>">
                </td>
                
                <td class="info">
                    <div class="name"><%= productSelected.get(0).getProdName() %></div>
                    
                    <% 
                        String category = "";
                        if(productSelected.get(0).getCategory() == 'M'){
                            category = "men";
                        }else if(productSelected.get(0).getCategory() == 'W'){
                            category = "women";
                        }else if(productSelected.get(0).getCategory() == 'K'){
                            category = "kids";
                        }else if(productSelected.get(0).getCategory() == 'O'){
                            category = "other";
                        }
                    %>
                    <div class="category"># <%= category %></div>
                    <div class="price">MYR <%= String.format("%.2f", productSelected.get(0).getPrice()) %> </div>
                                     
                    <form action="AddToCart" class="size">
                        <div class="sizeTitle">Select size </div>
                    <%! int id; %>
                    <% for(int i=0; i<productSelected.size(); i++){ %>
                        <% id = i; %>
                        <label>                            
                            <input class="radioBtn" type="radio" name="prodID" value="<%= productSelected.get(i).getProdId() %>"  required />
                            <span><i><%= productSelected.get(i).getSize() %></i></span>                       
                        </label>                        
                    <% } %>
                        
                        <div class="description"><%= productSelected.get(0).getDescription() %></div>
                        <div class="submitBtn">
                            <input type="submit" value="ADD TO CART" /> 
                        </div>
                    </form>
                    
                    
                </td>
            </tr>
        </table>
    </body>
</html>
