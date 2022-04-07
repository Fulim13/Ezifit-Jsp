<%@page import="model.Orders"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Product> product_list = (List) session.getAttribute("product_list"); %>
<% List<Double> store_rating_percentage = (List) session.getAttribute("store_rating_percentage");%>
<% List<String> store_rating_evaluate = (List) session.getAttribute("store_rating_evaluate"); %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            @import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';
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

           .menu_interface_report{  
                width: 100%; 
                height: 15%;
                position: absolute;
                background-color: #8B0000;
                font-family: 'Open Sans', sans-serif;;
                color: #fff;
            }
            .label_report{     
                padding: 0rem 0rem 1rem 2rem;
                color:#fff;
                margin-left: auto;
                margin-right: auto;
                top: 15%;
            }

            .section_report_type{
                top: 55px;
                position: absolute;
                left: 21px;
            }

            .section_date{
                top:55px;
                position:absolute;
                left: 400px;
            }

            #report{
                margin-left: 10px;
                top: 20%;
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


            #date_from, #date_to{
                font-size: 18px;
                letter-spacing: 1px;
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

            .generate{
                position: absolute;
                background-color: #04AA6D;
                font-size: 18px;
                color: black;
                border-radius: 4px;
                left: 1000px;
                top: 65px;
            }

            .generate:hover{
                background-color: #A3AFAF;

            }

            .report-content{
                margin-bottom: 100px;
            }
            .report-content th{
                background: #d0def2;
            }
            
            .report-content tr:nth-child(odd){
                background: #f3f8fe;
            }
            
            .report_container{
                margin-top: 200px;
                text-align: center;
                width: 100%;
                height:100%;
                font-family: 'Open Sans', sans-serif;
                font-size: 1em;
            }
            
            .table_content{
                margin: auto;
            }
             .table_content th,.table_content td{
                padding: 10px 15px;
                color: black;
            }
            
            .total_product{
                margin-right: 350px;
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

        <div class="menu_interface_report">
            <h2 class="label_report">Report Generation</h2>
            <form action="../reportRetrieve">
                <div class="section_report_type">
                    <span id="report">Report Type<span>
                            <select name="report_type" id="report_type" onchange="change()">
                                <option value="top_product">Top Product Report</option>
                                <option value="sales_report">Sales Report</option>
                                <option value="product_rating_report">Product Rating Report</option>
                            </select>
                            </div>
                            <div class="section_date">
                                <span id="date_from">Date From</span>
                                <input type="date" name="date_from" id="design_date_from" required>
                                <span id="date_to">Date To</span>
                                <input type="date" name="date_to" id="design_date_to" required>
                            </div>
                            <input type="submit" value="Generate" class="generate">
                            </form>
                            </div>


                            <% String category_name=null; %>
                            <div class="report_container">
                                <h1 class="report_title">Product Rating Report</h1>
                                <span class="header_title">Data Collection: All</span>
                                <hr>
                                <div class="report-content">
                                    <span class="total_product">Total Number Of Product: <%=product_list.size()%></span>
                                    <table class="table_content">
                                        <thead>
                                        <th>Product Name</th>
                                        <th>Category</th>
                                        <th>Rating Percentage(%)</th>
                                        <th>Evaluation</th>
                                        </thead>
                                        <tbody>
                                            <% for (int i = 0; i < product_list.size(); i++) {%>
                                            <tr>
                                                <td><%=product_list.get(i).getProdName()%></td>
                                                <% if(product_list.get(i).getCategory()=='M'){
                                                    category_name="Men";
                                                }
                                                else if(product_list.get(i).getCategory()=='W'){
                                                    category_name="Women";
                                                }
                                                 else if(product_list.get(i).getCategory()=='K'){
                                                    category_name="Kids";
                                                }
                                                 else if(product_list.get(i).getCategory()=='O'){
                                                    category_name="Other";
                                                } %>
                                                <td><%=category_name %></td>
                                                <td><%=String.format("%.2f%%", store_rating_percentage.get(i))%></td>
                                                <td>
                                                    <% if(store_rating_evaluate.get(i).equals("Good")){%>
                                                    <p style="background: #5cb85c;"><%=store_rating_evaluate.get(i)%></p>
                                                    <% } %>
                                                    <% if(store_rating_evaluate.get(i).equals("Average")){%>
                                                    <p style="background: #f0ad4e;"><%=store_rating_evaluate.get(i)%></p>
                                                    <% } %>
                                                    <% if(store_rating_evaluate.get(i).equals("Poor")){%>
                                                    <p style="background: #d9534f;"><%=store_rating_evaluate.get(i)%></p>
                                                    <% } %>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>

                                </form>
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