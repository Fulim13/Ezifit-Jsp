<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Product"%>
<%@page import="model.Orders"%>
<%@page import="model.CartItem"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Product> product_list = (List) session.getAttribute("product_list");%>
<% List<Integer> store_total_sales = (List) session.getAttribute("store_total_sales"); %>
<% List<Double> product_revenue = (List) session.getAttribute("product_revenue"); %>
<% Date date_from = (Date) session.getAttribute("date_from"); %>
<% Date date_to = (Date) session.getAttribute("date_to");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Display</title>
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

            .report_container{
                margin-top: 200px;
                text-align: center;
                width: 100%;
                height:100%;
                font-family: 'Open Sans', sans-serif;
                font-size: 1em;
            }

            .header_date_from{
                margin-right: 180px;
            }
            .header_date_to{
                margin-left: 180px;
            }
            .report-content{
                margin-left: 200px;
                overflow-x: hidden;
                overflow-y: auto;
            }
            .total_product{
                margin-left: -1080px;
            }
            .table_content{
                border: solid black 1px;
                z-index: 2;
                height: 60%;
                overflow: hidden;
                width: 90%;
                border-collapse: collapse;
            }
            .table_content th, .table_content tfoot>tr{
                background: #DD2F6E;
            }

            .table_content th,.table_content td{
                padding: 10px 15px;
                color: black;
                border: solid black 1px;
            }

            .table_content tr:nth-child(odd){
                background-color:#eeeeee;
            }
            .col_unit_sold, .col_unit_prices{
                width: 10%;
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

        <% SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy");%>
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

                            <div class="report_container">
                                <div class="report_header">
                                    <h1 class="header_title">Top Product Report</h1>
                                    <h4 class="header_content">Collection: Date Range</h4>
                                    <span class="header_date_from">Start Date: <%=ft.format(date_from)%></span>
                                    <span class="header_date_to">End Date: <%=ft.format(date_to)%></span>
                                </div>
                                <hr>

                                <% int total_unit_sold = 0;
                                    double total_revenue = 0.0;
                                %>
                                <div class="report-content">
                                    <span class="total_product">Total Number Of Product: <%=product_list.size()%></span>
                                    <table class="table_content">
                                        <thead>
                                        <th>Rank</th> 
                                        <th>Product Name</th>
                                        <th>Product Description</th>
                                        <th class="col_unit_sold">Solds(Units)</th>
                                        <th class="col_unit_prices">Prices(MYR)</th>
                                        <th>Revenue(MYR)</th>
                                        </thead>
                                        <tbody>
                                            <% for (int i = 0; i < product_list.size(); i++) {%>
                                            <tr>
                                                <td><%=(i + 1)%></td>
                                                <td><%=product_list.get(i).getProdName()%></td>
                                                <td><%=product_list.get(i).getDescription()%></td>
                                                <td><%=store_total_sales.get(i)%> Units</td>
                                                <td>$<%=String.format("%.2f", product_list.get(i).getPrice())%></td>
                                                <td>$<%=String.format("%.2f", product_revenue.get(i))%></td>
                                                <% total_unit_sold += store_total_sales.get(i);
                                                    total_revenue += product_revenue.get(i);%>
                                            </tr>
                                            <% }%>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th colspan="3">Summary</th>
                                                <th><%=total_unit_sold%> Units</th>
                                                <th></th>
                                                <th>$<%=String.format("%.2f", total_revenue)%></th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
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



