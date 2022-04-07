<%-- 
    Document   : UpdateStatusConfirmation
    Created on : Mar 23, 2022, 7:45:57 PM
    Author     : User
--%>
<%@page import="java.util.List"%>
<%@page import="model.Orders"%>
<%@page import="model.Customer"%>
<%@page import="model.CartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            Orders orders = (Orders) session.getAttribute("order");
            if (orders != null) {
%>
<%
  List<CartItem> cartList = (List)session.getAttribute("cartList");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>ORDER INFORMATION | EZIFIT</title>
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
            input.form-control:read-only {
                background-color: #fff;
            }
            .container{
                width: 1100px;
                max-width: 100%;
                padding: 5px;
                margin: 40px 190px;
                background: #fff;
                position: relative;
            }  
            .details{
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
            }
            .order h1{
                text-transform: uppercase;
            }
            .order span{
                color: black;            
            }
            .date p{
                font-size: 1.1rem;
            }
            .track{
                margin: 4em 0 8em;
            }
            #progress{
                list-style: none;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                align-items: center;
                gap: 1em;
                position: relative;
                text-align: center;
            }
            #progress li{
                width: 20%;
                position: relative;
            }
            #progress li::before{
                content: '\2713';
                position: absolute;
                display: flex;
                justify-content: center;
                width: 50px;
                align-items: center;
                font-size: 50px;
                background:#8B0000;
                color: #fff;
                border-radius: 50%;
                z-index: 11111;
            }#progress li:last-child::before{
                content:  '\2713';
                font-weight: bold;
                background: #c5cae9;
            }
            #progress::before{
                content: '';
                position: absolute;
                top: 20px;
                width: 50%;
                margin-left: 35px;
                height: 10px;
                background: #8B0000;
                z-index: 111;
            }
            #progress::after{
                content: '';
                position: absolute;
                top: 20px;
                width: 80%;
                height: 10px;
                background: #c5cae9;
            }
            #progress2{
                list-style: none;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                align-items: center;
                gap: 1em;
                position: relative;
                text-align: center;
            }
            #progress2 li{
                width: 20%;
                position: relative;
            }
            #progress2 li::before{
                content: '\2713';
                position: absolute;
                display: flex;
                justify-content: center;
                width: 50px;
                align-items: center;
                font-size: 50px;
                background:#8B0000;
                color: #fff;
                border-radius: 50%;
                z-index: 11111;
            }
            #progress2 li:nth-child(3)::before{
                content:  '\2713';
                font-weight: bold;
                background: #c5cae9;
            }
            #progress2 li:nth-child(4)::before{
                content:  '\2713';
                font-weight: bold;
                background: #c5cae9;
            }
            #progress2::before{
                content: '';
                position: absolute;
                top: 20px;
                width: 25%;
                margin-left: 35px;
                height: 10px;
                background: #8B0000;
                z-index: 111;
            }
            #progress2::after{
                content: '';
                position: absolute;
                top: 20px;
                width: 80%;
                height: 10px;
                background: #fff;
            }
            #progress3{
                list-style: none;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                align-items: center;
                gap: 1em;
                position: relative;
                text-align: center;
            }
            #progress3 li{
                width: 20%;
                position: relative;
            }
            #progress3 li::before{
                content: '\2713';
                position: absolute;
                display: flex;
                justify-content: center;
                width: 50px;
                align-items: center;
                font-size: 50px;
                background:#8B0000;
                color: #fff;
                border-radius: 50%;
                z-index: 11111;
            }
            #progress3 li:last-child{
                content:  '\2713';
                font-weight: bold;
                background: #c5cae9;
            }
            #progress3::before{
                content: '';
                position: absolute;
                top: 20px;
                width: 75%;
                margin-left: 35px;
                height: 10px;
                background: #8B0000;
                z-index: 111;
            }
            #progress3::after{
                content: '';
                position: absolute;
                top: 20px;
                width: 80%;
                height: 10px;
                background: #c5cae9;
            }
            #progress4{
                list-style: none;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                align-items: center;
                gap: 1em;
                position: relative;
                text-align: center;
            }
            #progress4 li{
                width: 20%;
                position: relative;
            }
            #progress4 li::before{
                content: '\2713';
                position: absolute;
                display: flex;
                justify-content: center;
                width: 50px;
                align-items: center;
                font-size: 50px;
                background: #8B0000;
                color: #fff;
                border-radius: 50%;
                z-index: 11111;
            }
            #progress4 li:nth-child(2)::before{
                content:  '\2713';
                font-weight: bold;
                background: #c5cae9;
            }
            #progress4 li:nth-child(3)::before{
                content:  '\2713';
                font-weight: bold;
                background: #c5cae9;
            }
            #progress4 li:nth-child(4)::before{
                content:  '\2713';
                font-weight: bold;
                background: #c5cae9;
            }
            #progress4::before{
                content: '';
                position: absolute;
                top: 20px;
                width: 0%;
                margin-left: 35px;
                height: 10px;
                background:#8B0000;
                z-index: 111;
            }
            #progress4::after{
                content: '';
                position: absolute;
                top: 20px;
                width: 80%;
                height: 10px;
                background: #c5cae9;
            }
            .lists{
                display: flex;
                gap : 2em;
                flex-wrap: wrap;
                align-items: center;
            }
            .list{
                display: flex;
                gap: 2em;
                flex: 1 1 50px;
            }
            .lisy p{
                font-size: 1.1rem;
            }
            .list img{
                widows: 50px;
                width: 28%;
                height: 25%;
                margin: 10px 28px;
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
                color: #8B0000;
            }
            .col-2 a:hoover{
                color: #8B0000;
            }
            .col-2 h3{
                margin-left: 28px;
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
            .wrapper{
                max-width: 500px;
                width: 100%;
                background: #fff;
                margin-left: 130px;
                margin-top: 1px;
                padding: 12px;
                box-shadow: 1px 1px 2px rgba(0,0,0,0.125);
            }
            .wrapper .form{
                width: 100%;
            }   
            .wrapper .form .input-box{
                margin-bottom: 15px;
                display: flex;
                align-items: center;
            }
            .wrapper .form .input-box label{
                width: 200px;
                color:#757575;
                margin-right: 10px;
                font-size: 14px;
            }
            .wrapper .form .input-box .form-control{
                width: 100%;
                outline: none;
                border: 1px solid #d5dbd9;
                font-size: 15px;
                padding: 8px 10px;
                border-right: 3px;
                transition: all 0.3s ease;
            }
            .wrapper .form .input-box .form-control1{
                width: 100%;
                outline: none;
                border: 1px solid #d5dbd9;
                font-size: 15px;
                padding: 8px 10px;
                border-right: 3px;
                transition: all 0.3s ease;
            }
            .wrapper .form .input-box .input:focus{
                border: 1px solid #fec107;
            }
            .wrapper .form .input-box .btn{
                width: 100%;
                padding: 8px 10px;
                font-size: 15px;
                border: 0;
                background: #8B0000;
                color: #fff;
                cursor: pointer;
                border-radius: 3px;
                outline: none;
            }
            .wrapper .form .container1 .btn{
                width: 100%;
                padding: 8px 10px;
                font-size: 15px;
                border: 0;
                background: #8B0000;
                color: #fff;
                cursor: pointer;
                border-radius: 3px;
                outline: none;
            }
            .wrapper .form .input-box:last-child{
                margin-bottom: 0;
            }
            .wrapper .form .input-box .btn:hover{
                background: black;
            }
            .remainder p{
                color: #818589;
                text-align: center;
                font-size: 13px;
            }
            .cart{
                width: 40%;
            }
            .cartDisplay{
                width: 80%;              
                border-collapse: collapse; 
                margin-left: 1000px;
                margin-right: 0px;
                margin-top: -450px;
                margin-bottom: 450px;
                position: relative;
            }            
            .cartDisplay td{
                border: none;
                vertical-align: top;
                padding: 40px 0px 20px 20px;
            }
            .cartDisplay td:nth-child(2){
                border: solid;
                box-shadow: 15px 12px;
            }
            .cartDisplay img{
                width: 20%;
            }
            .descriptionC{                               
                vertical-align: top;
                margin-left: 30px;
            }
            .name{
                font-size: 20px;
                margin-bottom: 50px;
                margin-top: 5px;              
            }
            .popup{
                width: 400px;
                background: #fff;
                border-radius: 6px;
                position: absolute;
                top: 0;
                left: 50%;
                transform: translate(-20%,-20%) scale(0.1);
                text-align: center;
                padding: 0 30px 30px;
                color: #333;
                visibility: hidden;
                transition: transform 0.4s, top 0.4s;
            }
            .open-popup{
                visibility: visible;
                top: 50%;
                transform: translate(-50%,-50%) scale(1);
            }
            .popup img{
                width: 100px;
                margin-top: -50px;
                border-radius: 50%;
                box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            }
            .popup h2{
                font-size: 38px;
                font-weight: 500;
                margin: 30px 0 10px;
            }
            .popup button{
                width: 100%;
                margin-top: 50px;
                padding: 10px 0;
                background: #6fd649;
                color: #fff;
                border: 0;
                outline: none;
                font-size: 18px;
                border-radius: 4px;
                cursor: pointer;
                box-shadow: 0 5px 5px rgba(0,0,0,0.2);
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
                <h1 style="color: #8B0000">ORDER STATUS</h1>
            </div>
        <br>      <hr style="width: 97%">
     
        <div class="container">
            <div class="details">
                <div class="order">
                    <h1>order <span><%=orders.getOrderId() %></span></h1>
                </div>
                <div class="date">
                    <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
                    <p>Order Date  <%=df.format(orders.getOrderDate()) %></p>
                </div>
            </diV>
                <div class="track">
                    <%if(orders.getStatus().equals("SHIPPING")){ %>
                    <ul id="progress" class="text-center">
                        <li class="active"></li>
                        <li class="active"></li>
                        <li class="active"></li>
                        <li class="active"></li>
                    </ul>
                    <% } else if(orders.getStatus().equals("PACKAGING")) {%> 
                    <ul id="progress2" class="text-center">
                        <li class="active"></li>
                        <li class="active"></li>
                        <li class="active"></li>
                        <li class="active"></li>
                    </ul>
                    <% }  else if(orders.getStatus().equals("DELIVERED")) {%>
                    <ul id="progress3" class="text-center">
                        <li class="active"></li>
                        <li class="active"></li>
                        <li class="active"></li>
                        <li class="active"></li>
                    </ul>
                    <% }  else if(orders.getStatus().equals("ORDERED")|| orders.getStatus() == null) {%>
                    <ul id="progress4" class="text-center">
                        <li class="active"></li>
                        <li class="active"></li>
                        <li class="active"></li>
                        <li class="active"></li>
                    </ul>
                    <% } %>
                </div>
                <div class="lists">
                    <div class="list">
                        <img src="order.jpg" alt="">
                        <p>Order <br> Received</p>
                    </div>
                    <div class="list">
                        <img src="packaging.jpg" alt="">
                        <p>Order <br> Packaged</p>
                    </div>
                    <div class="list">
                        <img src="shipping.jpg" alt="">
                        <p>Order <br> Shipped</p>
                    </div>
                    <div class="list">
                        <img src="deliver.jpg" alt="" style="width: 38%; height: 35%;" >
                        <p>Order <br> Delivered</p>
                    </div>
                </div>
        </div> 
                <br>      <hr style="width: 97%">
                <div class="col-2">
                <h3>&nbsp;&nbsp;&nbsp;ORDERS INFORMATION</h3>
            </div>
                <div class="remainder"><p>Update Customer Order's Status Here</p></div>
         
            <div class="wrapper">
                <form action="../UpdateStatus" onsubmit="return window.confirm('Are you sure you want to update to this status?')">
                    <div class="form">
                        <div class="input-box">
                            <label class="details">Customer Name</label>
                            <input type="text" class="form-control" name="customerName" value="<%=orders.getCustomerId().getFullname() %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Customer ID</label>
                            <input type="text" class="form-control" name="customerID" value="<%=orders.getCustomerId() %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Customer Email</label>
                            <input type="text" class="form-control" name="customerEmail" value="<%=orders.getCustomerId().getEmail() %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Order ID</label>
                            <input type="text" class="form-control" name="orderID" value="<%=orders.getOrderId()%>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Order Price</label>
                            <input type="text" class="form-control" name="orderPrice" value="<%=String.format("%.2f", orders.getOrderPrice())%>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Order Shipping</label>
                            <input type="text" class="form-control" name="orderShipping" value="<%=String.format("%.2f", orders.getShippingFee()) %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details" style="color: black;">Order Status<font color = "#FF0000">*</font></label>
                            <input type="text" class="form-control1" name="orderStatus" value="<%=orders.getStatus()%>" />
                        </div>
                        <div class="input-box">
                            <button type="submit" class="btn">UPDATE</button>
                        </div>
                    </div>
                    </div>
                    </form> 
            <div>
            <% for(int i=0; i < cartList.size(); i++){ %>   
                <table class="cartDisplay">
                    <tr>
                        <td class="cart">                 
                                <img id="img" src="data:image/jpg;base64,<%= cartList.get(i).getProdId().getBase64Image() %>">
                        <div class="descriptionC">
                        <div class="name"><%= cartList.get(i).getProdId().getProdName() %></div>
                        <div>Size: <%= cartList.get(i).getProdId().getSize() %></div>
                        <div>Quantity: <%= cartList.get(i).getPurchaseQty() %></div>
                        </div>
                        </td>
                    </tr>
                </table> 
            </div>
       <% } %>
      <% } %>
    </body>
</html>