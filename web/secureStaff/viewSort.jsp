<%-- 
    Document   : viewSort
    Created on : Mar 26, 2022, 10:59:26 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="date" class="java.util.Date"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Sorting Type</title>
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

            .customerRecord {
                margin: auto;
                min-width: 200px;
                max-width: 90%;
                border-collapse: collapse;
                box-shadow: 5px 10px;
            }

            .customerRecord thead tr{
                border-top: none;
                background-color:#8B0000;
                color:#fff;
                font-size: 1em;
            }

            .customerRecord tr {
                border-top: 1px solid #ddd;
                border-bottom: 1px solid #ddd;
                background-color: #f5f9fc;
            }

            .customerRecord tbody tr:nth-child(odd) {
                background-color: #f5f5f5;
            }

            .customerRecord th {
                display: none;
                border: solid black 1px;
                text-transform: UPPERCASE;

            }

            .customerRecord td {
                display: block;
                border: solid black 1px;
            }

            .customerRecord td:first-child {
                margin-top: .5em;
            }

            .customerRecord td:last-child {
                margin-bottom: .5em;
            }

            .customerRecord td:before{
                content: attr(data-th) ": ";
                font-weight: bold;
                width: 120px;
                display: inline-block;
                color: #000;
            }

            .customerRecord td:first-child::before,.customerRecord td:last-child::before{
                content: "";
                font-weight: bold;
                width: 120px;
                display: inline-block;
                color: #000;
            }

            .customerRecord th,
            .customerRecord td {
                text-align: center;
            }

            .customerRecord {
                color: #333;
                border-radius: .4em;
                overflow: hidden;
            }

            .customerRecord tr {
                border-color: #bfbfbf;
            }

            .customerRecord th,
            .customerRecord td {
                padding: .5em 1em;
            }
            @media screen and (max-width: 601px) {
                .customerRecord tr:nth-child(2) {
                    border-top: none;
                }
            }
            @media screen and (min-width: 600px) {
                .customerRecord tbody tr:hover {
                    background-color: #f7bbbb;
                }
                .customerRecord td:before {
                    display: none;
                }
                .customerRecord th,
                .customerRecord td {
                    display: table-cell;
                    padding: .25em .5em;
                }
                .customerRecord th:first-child,
                .customerRecord td:first-child {
                    padding-left: 0;
                }
                .customerRecordth:last-child,
                .customerRecord td:last-child {
                    padding-right: 0;
                }
                .customerRecord th,
                .customerRecord td {
                    padding: .5em !important;
                }
            }

            body {
                background: #fff;     
            }
            .head_Customer_Record {
                text-align: center;
                font-size: 2.4em;
                color: black;
            }
            .content-table {
                display: block;
                text-align: center;
                position:relative;
                bottom: 20px;
            }

            .customer_pic{
                width: 50%;
                height: 50%;
            }

            .btn_name{
                font-family: 'Lucida Sans'; 
                border-top: none;
                background-color:transparent;
                color:#fff;
                font-weight:bold;
                font-size: 1em;
                padding-left: 40px;
                padding-right: 40px;
                padding-top: 20px;
                padding-bottom: 20px;
                display: inline-block;
                border-style: none;
                cursor: pointer;
                text-transform: UPPERCASE;
                margin: -30px -7px;
            }

            .btn_dob,.btn_register_date{
                font-family: 'Lucida Sans'; 
                color: #fff;
                background-color: transparent;
                font-weight: bold;
                font-size: 1em;
                display: inline-block;
                border-top: none;
                border-style: none;
                cursor: pointer;
                text-transform: UPPERCASE;
                margin: -10px -8px;

            }

            .btn_dob, .btn_register_date{
                padding: 18px 7px;
                bottom: 1px;
                right: 1px;
            }

            .pic_col{
                padding: 1px 1px;
                width: 10%;
            }
            .col_name{
                width: 15%;
            }
            .col_dob, .col_register_date{
                width: 12%;
            }

            .col_phone{
                width: 10%;
            }


            .searchInput{
                border: transparent;
                outline: none;
                background-color: #D3D3D3;               
                padding-left: 20px;
                position: relative;
                left: 590px;
                top: 45px;
            }
            .searchBox .searchInput{      
                width: 160px;
                height: 40px;
                border-radius: 30px;
                font-size: 18px;
            }
            .searchBtn{
                position: absolute;
                top: 54px;
                left: 1400px;
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
            
            .btn_order{
                padding: 10px;
                margin-bottom: 10px;
                background-color: #AA3232;
                color: #fff;
                border: 1px solid #eee;
                box-shadow: 5px 5px #eee;
                text-shadow: none;
                padding: 10px;
                text-align: center;
                width: 100%;
                cursor: pointer;
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
            <h1 style="color: #8B0000"><i style="color: black;"class="fa fa-address-card"></i>Customer Records</h1>
            <br>

        </div>
        <hr style="width: 97%;"> 
        <div class="content-table">


            <form class="searchBox" action="../SearchCustomer">
                <input type="text" name="search_for_staff" class="searchInput" placeholder="Search..." />
                <div class="searchBtn">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </div>
            </form> 
            </br></br></br>
            <%
                List<Customer> custList = (List) session.getAttribute("custList");
            %>

            <!--Display Customer Record-->
            <% SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy"); %>
            <table class="customerRecord">
                <form action="retrieveSorting.jsp" method="post">
                    <thead>
                        <tr>
                            <th class="pic_col">#</th>
                            <th class="col_name"><button type="submit" name="button" class="btn_name" value="Full Name">Full Name&nbsp;<i class="fa fa-sort"></i></button></th>
                            <th>Email</th>
                            <th class="col_phone">Phone Number</th>
                            <th class="col_dob"><button type="submit" name="button" class="btn_dob" value="Date Of Birth">Date Of Birth&nbsp;<i class="fa fa-sort"></i></button></th>
                            <th class="col_register_date"><button type="submit" name="button" class="btn_register_date" value="Register Date">Register Date&nbsp;<i class="fa fa-sort"></i></button></th>
                            <th>Address</th>
                            <th>Orders</th>
                        </tr>
                    </thead>
                </form>
                <tbody>
                    <% for (Customer customer : custList) {%>
                    <tr>
                        <td>
                            <% if (customer.getCustomerImage() == null) { %>
                            Null
                            <% } %>
                            <% if (customer.getCustomerImage() != null) {%>
                            <img class="customer_pic" src="data:image/jpg;base64,<%= customer.getBase64Image()%>"
                                 <% }%>
                        </td>
                        <td data-th="Full Name"><%=customer.getFullname()%></td>
                        <td data-th="Email"><%= customer.getEmail()%></td>
                        <td data-th="Phone Number"><%=customer.getPhone()%></td>
                        <td data-th="Date Of Birth">
                            <% if(customer.getDob()==null){%>
                            Null
                            <% } %>
                            <% if (customer.getDob() != null) {%>
                             <%=ft.format(customer.getDob())%>
                            <% }%>
                           </td>
                        <td data-th="Register Date"><%= ft.format(customer.getRegisterDate())%></td>
                        <td data-th="Address">
                            <% if (customer.getAddress() == null) { %>
                            Null
                            <% } %>
                            
                            <% if (customer.getAddress()!= null) {%>
                             <%= customer.getAddress()%>
                            <% }%>
                      </td>
                <form action="../SearchCustomerOrder">
                      <td><button type="submit" name="cust_id" value="<%=customer.getCustomerId()%>" class="btn_order"</button>View Orders</td>
                      <form>
                    </tr>
                    <% }%>
                </tbody>

            </table>
        </div>

    </body>

</html>
