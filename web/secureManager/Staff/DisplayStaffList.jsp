
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Staff"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="date" class="java.util.Date"/>
<%List<Staff> staffList = (List) session.getAttribute("staffList");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Sorting Type</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

            @import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';

            * {font-family: 'Open Sans', sans-serif;}

            .customerRecord {
                margin: auto;
                min-width: 200px;
                max-width: 90%;
                border-collapse: collapse;

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
                text-align: left;
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
                top: 30px;
            }

            .customer_pic{
                width: 50%;
                height: 50%;
            }

            table input[type=submit]{
                width: 100%;
                border:0;
                padding:0;
                min-width: 100%;

            }

            .btn_name{
                border-top: none;
                background-color:transparent;
                color:#fff;
                font-family: 'Open Sans', sans-serif;
                font-weight:bold;
                font-size: 1em;
                padding: 10px 30px;
                display: inline-block;
                border-style: none;
                cursor: pointer;
            }

            .btn_date{
                color: #fff;
                background-color: transparent;
                font-weight: bold;
                font-size: 1em;
                display: inline-block;
                font-family: 'Open Sans', sans-serif;
                border-top: none;
                padding: 10px 15px;
                border-style: none;
                cursor: pointer;
            }

            .pic_col{
                padding: 1px 1px;
                width: 10%;
            }
            .col_name{
                padding: 10px 10px;
            }

            .btn_name:hover{
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
            
            




            .buttonDelete {

                margin-right: 110px;
                text-align: center;
                text-transform: uppercase;
                cursor: pointer;
                font-size: 20px;
                letter-spacing: 4px;
                position: relative;
                background-color: #dc143c;
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

            .buttonDelete:hover {
                background: #fff;
                box-shadow: 0px 2px 10px 5px #dc143c;
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

            th{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="header">            
            <span><a href="../../secureStaff/staffHomepage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                <li><a href="../../secureStaff/LoadCheckIdentityStaff"><i class="fa fa-user"></i></a></li>
                <li><a href="../../secureStaff/logoutStaff.jsp"><i class="fa fa-sign-out"></i></a></li>                
            </ul>
        </div>
    </div>
    <div class="content-table">
        <form class="searchBox" action="../../SearchStaffInformation">
            <input type="text" name="search_staff" class="searchInput" placeholder="Search..." />
            <div class="searchBtn">
                <button type="submit"><i class="fa fa-search"></i></button>
            </div>
        </form> 

        <span class="head_Customer_Record"></i>Staff</span>

        <table class="customerRecord">

            <thead>
                <tr>
                    <th style="text-align: center;">STAFF ID</th>
                    <th  style="text-align: center;">STAFF NAME</th>
                    <th style="text-align: center;">STAFF EMAIL</th>
                    <th style="text-align: center;">POSITION</th>
                </tr>
            </thead>

            <tbody>
            <form  class="productForm" action="../../GetStaffDetails">     
                <% for (Staff staff : staffList) {%>
                <tr>                     
                    <td><button  class="buttonDelete" type="submit" name="staffSelected" value="<%=staff.getStaffId()%>"><%=staff.getStaffId()%></button></td>
                    <td><%=staff.getStaffName()%></td>
                    <td><%=staff.getStaffEmail()%></td>
                    <td><%=staff.getPosition()%></td>
                </tr>
                <% }%>
            </form>
            </tbody>

        </table>
    </div>

</body>

</html>