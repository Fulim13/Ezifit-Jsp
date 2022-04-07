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

            * {font-family: 'Open Sans', sans-serif;}

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

            .customerRecord td:first-child::before{
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
                border-top: none;
                background-color:transparent;
                color:#fff;
                font-family: 'Open Sans', sans-serif;
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
                color: #fff;
                background-color: transparent;
                font-weight: bold;
                font-size: 1em;
                display: inline-block;
                font-family: 'Open Sans', sans-serif;
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
                width: 13%;
            }
            .col_dob, .col_register_date{
                width: 10%;
            }

            .btn_name:hover, .btn_dob:hover, .btn_register_date:hover{
                background:red;
            }


            .searchInput{
                border: transparent;
                outline: none;
                background-color: #D3D3D3;               
                padding-left: 20px;
                position: relative;
                left: 500px;
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
                left: 1300px;
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
        <hr style="width: 97%;"> 
        <div class="content-table">

            <form class="searchBox" action="../SearchCustomer">
                <input type="text" name="search_for_staff" class="searchInput" placeholder="Search..." />
                <div class="searchBtn">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </div>
            </form> 

            <span class="head_Customer_Record"><i class="fa fa-address-card"></i>Customer Records</span>
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
                            <th class="col_name"><input type="submit" name="button" class="btn_name" value="Full Name"><i class="fa-solid fa-arrow-down-arrow-up"></i></th>
                            <th>Email</th>
                            <th>Phone Number</th>
                            <th class="col_dob"><input type="submit" name="button" class="btn_dob" value="Date Of Birth"></th>
                            <th class="col_register_date"><input type="submit" name="button" class="btn_register_date" value="Register Date"></th>
                            <th>Address</th>
                        </tr>
                    </thead>
                </form>
                <tbody>
                    <% for (Customer customer : custList) {%>
                    <tr>
                        <td><img class="customer_pic" src="data:image/jpg;base64,<%= customer.getBase64Image()%>"</td>
                        <td data-th="Full Name"><%=customer.getFullname()%></td>
                        <td data-th="Email"><%= customer.getEmail()%></td>
                        <td data-th="Phone Number"><%= customer.getPhone()%></td>
                        <td data-th="Date Of Birth"><%=ft.format(customer.getDob())%></td>
                        <td data-th="Register Date"><%= ft.format(customer.getRegisterDate())%></td>
                        <td data-th="Address"><%= customer.getAddress()%></td>
                    </tr>
                    <% }%>
                </tbody>

            </table>
        </div>

    </body>

</html>
