<%-- 
    Document   : testing
    Created on : Mar 25, 2022, 11:44:25 PM
    Author     : User
--%>

<%@page import="java.util.List"%>
<%@page  import="model.CartItem" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<CartItem> cartItemList = (List) session.getAttribute("cartItemList");
    int[] total = (int[]) session.getAttribute("total");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>SALES RECORD | EZIFIT</title>
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
            table {
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
            }

            th, td {
                text-align: left;
                padding: 16px;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2
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
            .salesTable{
                border-collapse: collapse;
                border-color: #8B0000;
                box-shadow: 15px 12px;
            }
            .salesTable{
                height: 750px;
                overflow: auto;
                margin-top: 20px;
                border: 3px solid #dddddd;
                width: 80%;
                margin-left: auto;
                margin-right: auto;
            }
            .salesTable thead th{
                position: sticky;
                top: 0;
                font-size: 15px;
                font-weight: 800;
                background-color: #8B0000;
                color: white;
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

            ::-webkit-scrollbar{
                width: 6px;
            }
            ::-webkit-scrollbar-track{
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3)
            }

            ::-webkit-scrollbar-thumb{
                -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3)
            }
            .hide {
                display: none;
            }
            .hide img{
                width: 300px;
                height: 300px;
            }
            .myDIV:hover + .hide {
                display: block;

            }
            .date{
                margin: -15px 5px 0 1330px;
                font-size: 15px;
                font-style: inherit;
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
                margin-left: 1300px;
            }
            .searchBtn{
                position: absolute;
                top: 230px;
                left: 1450px;
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
            <h1 style="color: #818589">" A good team is a greater action.</h1>
            <h2 text-align="right" style="color: #818589">Believe in your team ! "</h2>
        </div>
        <div class="col-2">
            <h1 style="color: #8B0000">SALES RECORD</h1>
        </div>
        <p class="date"><span id="datetime"></span></p><script>var dt = new Date();
            document.getElementById("datetime").innerHTML = dt.toLocaleString();</script>  
        <br>     <hr style="width: 97%">  <br> 
        
         <form class="searchBox" action="../SearchSalesRecord">
                <input type="text" name="search_for_sales" class="searchInput" placeholder="Search..." />
                <div class="searchBtn">
                    <button type="submit"><i class="fa fa-search"></i></button>
                </div>
            </form> 
        
        <table id="myTable" class="salesTable" style="width:60%">        
            <thead>
                <tr>
                    <th style="width:2%">#</th>
                    <th style="width:5%">Product ID</th>
                    <th style="width:20%">Product Name</th>
                    <th style="width:25%" id="id01">Product Category&nbsp;&nbsp;&nbsp;<i class="fa fa-sort-down" onclick="sortList()"></i></th>
                    <th style="width:15%">Product Size</th>
                    <th style="width:20%">Sales Quantity&nbsp;&nbsp;&nbsp;<i class="fa fa-sort-down" onclick="sortTable()"></i></th>
                </tr>
            </thead>

            <tbody>

                <% for (int i = 0; i < cartItemList.size(); i++) {%>
                <tr>
                    <td class="myDIV"><i class="fa fa-angle-double-right"></i></button></td>
                    <td class="hide"><img src="data:image/jpg;base64, <%= cartItemList.get(i).getProdId().getBase64Image()%>"></td>
                    <td><%=cartItemList.get(i).getProdId()%></td>
                    <td> <%=cartItemList.get(i).getProdId().getProdName()%></td>
                    <td> <%=cartItemList.get(i).getProdId().getCategory()%></td>
                    <td> <%=cartItemList.get(i).getProdId().getSize()%></td>
                    <td> <%=cartItemList.get(i).getPurchaseQty()%></td>
                </tr>
                <%  }%>
            </tbody>
        </table>
        <script>
            function sortTable() {
                var table, rows, switching, i, x, y, shouldSwitch;
                table = document.getElementById("myTable");
                switching = true;
                /*Make a loop that will continue until
                 no switching has been done:*/

                while (switching) {
                    //start by saying: no switching is done:
                    switching = false;
                    rows = table.rows;
                    /*Loop through all table rows (except the
                     first, which contains table headers):*/
                    for (i = 1; i < (rows.length - 1); i++) {
                        //start by saying there should be no switching:
                        shouldSwitch = false;
                        /*Get the two elements you want to compare,
                         one from current row and one from the next:*/

                        x = rows[i].getElementsByTagName("TD")[6];
                        y = rows[i + 1].getElementsByTagName("TD")[6];

                        //check if the two rows should switch place:
                        if (Number(x.innerHTML) < Number(y.innerHTML)) {
                            //if so, mark as a switch and break the loop:
                            shouldSwitch = true;
                            break;
                        }
                    }
                    if (shouldSwitch) {
                        /*If a switch has been marked, make the switch
                         and mark that a switch has been done:*/
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }
                }
            }

            function sortList() {
                var table, rows, switching, i, x, y, shouldSwitch;
                table = document.getElementById("myTable");
                switching = true;
                /*Make a loop that will continue until
                 no switching has been done:*/

                while (switching) {
                    //start by saying: no switching is done:
                    switching = false;
                    rows = table.rows;
                    /*Loop through all table rows (except the
                     first, which contains table headers):*/
                    for (i = 1; i < (rows.length - 1); i++) {
                        //start by saying there should be no switching:
                        shouldSwitch = false;
                        /*Get the two elements you want to compare,
                         one from current row and one from the next:*/

                        x = rows[i].getElementsByTagName("TD")[4];
                        y = rows[i + 1].getElementsByTagName("TD")[4];

                        //check if the two rows should switch place:
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            //if so, mark as a switch and break the loop:
                            shouldSwitch = true;
                            break;
                        }
                    }
                    if (shouldSwitch) {
                        /*If a switch has been marked, make the switch
                         and mark that a switch has been done:*/
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }
                }
            }
        </script>
        <br><br><br><br><br><br><br>
    </body>
</html>
