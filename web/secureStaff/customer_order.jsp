<%-- 
    Document   : customer_order
    Created on : Apr 10, 2022, 2:25:42 PM
    Author     : user
--%>

<%@page import="model.Customer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Orders"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  List<Orders> cust_orders = (List) session.getAttribute("cust_orders"); %>
<%  List<Customer> cust_record=(List)session.getAttribute("cust_record"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
              <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
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

              .order_table{
                margin: auto;
                box-shadow: 10px 15px #888888;
                border: 1px solid #dddddd;
                z-index: 2;
                height: 60%;
                overflow: hidden;
                width: 90%;
                border-collapse: collapse;
                border-radius: 10px;
            }
            .order_table th{
                background-color:#8B0000;
                color: white;
            }

            .order_table th,.order_table td{
                padding: 10px 15px;
                border: 1px solid #dddddd;
                text-align: center;
            }

            .order_table tr:nth-child(odd){
                background-color:#eeeeee;
            }
            
            .header_information{
                margin: auto;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="../secureStaff/staffHomepage.jsp">EZIFIT</a></span>
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
            <h1 style="color: #8B0000">Orders Customer</h1>
            <br>

        </div>
        <hr style="width: 97%;"> 
        <div class="header_information">
            <% for(int i=0;i<cust_record.size();i++){ %>
            <h3>Full Name: <%=cust_record.get(i).getFullname()%></h1>
            <span>Phone Number: <%=cust_record.get(i).getPhone() %></span>
            <% } %>
        </div>
        <% SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy"); %>
        <div class="content-table">
            <div class="container">
                <table class="order_table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Shipping Fees(MYR)</th>
                            <th>Prices(MYR)</th>
                            <th>Payment Method</th>
                            <th>Status</th>
                        </tr>
                    </thead>

                    <tbody>

                        <% for (int i = 0; i < cust_orders.size(); i++) {%>                                              
                        <tr>
                            <td><%= cust_orders.get(i).getOrderId()%></td>
                            <td><%= ft.format(cust_orders.get(i).getOrderDate())%></td>
                            <td>$<%= cust_orders.get(i).getShippingFee()%></td>
                            <td>$<%= cust_orders.get(i).getOrderPrice()%></td>
                            <td><%= cust_orders.get(i).getPaymentMethod()%></td>
                            <td><%= cust_orders.get(i).getStatus()%></td>      
                        </tr>                                                                          
                        <% }%>                   

                    </tbody>
                </table>

                </body>
                </html>
