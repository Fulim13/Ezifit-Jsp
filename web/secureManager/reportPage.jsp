<%-- 
    Document   : reportPage
    Created on : Mar 29, 2022, 9:31:22 PM
    Author     : user
--%>

<%@page import="model.Orders"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

            .menu_interface_report{  
                font-family: 'Lucida Sans';   
                width: 100%; 
                color: black;
                margin-left: 30px
            }

            #report{
                margin-left: 20px;
                font-size: 18px;
                letter-spacing: 1px;
            }

            #report_type{
                padding: 8px 12px;
                color: #333333;
                background-color: #eeeeee;
                border: 1px solid #dddddd;
                cursor: pointer;
                border-radius: 5px;
                font-size: 18px;
            }

            #report_type focus, #report_type{
                outline: none;
                border: 1px solid #bbbbbb;
            }

            #report_type:hover{
                background-color: #BCCBD0;
            }

            #report_type option{
                background: #ffffff;
            }

            #design_date_from,#design_date_to{
                background-color: #eeeeee;
                padding: 8px 12px;
                color: black;
                font-size: 18px;
                border: none;
                border-radius: 5px;
                outline: none;
            }

            .wrap{
                background-color: #04AA6D;
                color: #fff;
                border: 1px solid #eee;
                border-radius: 20px;
                box-shadow: 5px 5px #eee;
                text-shadow: none;
                padding: 10px;
                text-align: center;
                width: 10%;
            }
            .wrap:hover{
                background-color: #A3AFAF;

            }



        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="../secureStaff/staffHomepage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                <li><a href="../LoadCheckIdentityStaff"><i class="fa fa-user"></i></a></li>
                <li><a href="../secureStaff/logoutStaff.jsp"><i class="fa fa-sign-out"></i></a></li>                
            </ul>
        </div>
        <div class="col-3">
            <h1 style="color: #818589">-&nbsp;" A good team is a greater action.</h1>
            <h2 text-align="right" style="color: #818589">Believe in your team !&nbsp; "-</h2>
        </div>
        <div class="col-2">
            <h1 style="color: #8B0000">Report</h1>
            <br>

        </div>
        <br>        
        <div class="menu_interface_report">
            <form action="../reportRetrieve">
                <span id="report">Report Type<span>
                        <select name="report_type" id="report_type" onchange="change()">
                            <option value="top_product">Top product Report</option>
                            <option value="sales_report">Sales Report</option>
                            <option value="product_rating_report">Product Rating Report</option>
                        </select>&nbsp;&nbsp;&nbsp;
                        <span id="date_from">Date From</span>
                        <input type="date" name="date_from" id="design_date_from" required>&nbsp;&nbsp;&nbsp;
                        <span id="date_to">Date To</span>
                        <input type="date" name="date_to" id="design_date_to" required>&nbsp;&nbsp;&nbsp;
                        <input type="submit" value="Generate" class="wrap">
                        </div>
                        </form>
                        <hr style="width: 97%">


                        </div>
                        <script type="text/javascript">
                            function change() {
                                var x = document.getElementById("report_type");
                                if (!(x.value === "top_product")) {
                                    document.getElementById("design_date_from").disabled = true;
                                    document.getElementById("design_date_to").disabled = true;

                                } else {
                                    document.getElementById("design_date_from").disabled = false;
                                    document.getElementById("design_date_to").disabled = false;
                                }
                            }
                        </script>
                        </body>
                        </html>
