<%-- 
    Document   : payment
    Created on : Mar 30, 2022, 1:17:06 AM
    Author     : Lim
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="model.Customer" contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have not logged in , to profile page
    if (!loggedIn) {
        response.sendRedirect(request.getContextPath());
        return;
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }

            body{
                font-family: 'Lucida Sans';   

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
            img{
                width: 100px;
                height: 100px;
            }

            textarea {
                display: block;
                outline: none;
                resize: none;
                border: 2px lightgray solid;
                width:100%;
                margin: 20px 0;
            }
            a, a:hover, a:focus, a:active {
                text-decoration: none;
                color: inherit;
            }

            input {

            }

            .payment-body{
                background-color: #F4F4F4;
                min-height: calc(100vh - 108.4px);
            }
            .payment-form{
                padding:  0 50px;
                display: flex;
            }

            h1{
                text-align: center;
                padding:20px;
            }

            .left-block{
                width: 100%;
                display: flex;
                flex-direction: column;
                margin-right: 20px;
            }

            .title-product{
                display: flex;
                align-items: center;

            }

            .banner-product{
                flex: 1 1 36%;

            }
            .banner-size, .banner-qty{
                flex: 1 1 12%;
            }

            .banner-unitprice,  .banner-subtotal{
                flex: 1 1 20%;
            }

            .banner-unitprice,  .banner-subtotal,.banner-size, .banner-qty{
                text-align: center;
            }

            .purchaseitem{
                display: flex;
                align-items: center;
                padding: 20px 0;
            }


            .prod-name-img{
                flex: 1 1 36%;
                display: flex;
                align-items: center;
            }

            .prod-name-img > img {
                margin-right: 15px;
            }

            .prod-size{
                flex: 1 1 12%;
            }

            .prod-price{
                flex: 1 1 20%;
            }

            .prod-qty{
                flex: 1 1 12%;
            }

            .prod-subtotal{
                flex: 1 1 20%;
            }

            .prod-size,.prod-price,.prod-qty,.prod-subtotal{
                text-align: center;
            }




            .shiping-address{
                margin-bottom: 20px;
                font-size: 25px;

            }

            .banner-ordersummary{
                padding: 20px 0;
            }

            .banner-payment{
                padding-bottom: 20px;
            }
            .banner-product,.banner-payment,.banner-ordersummary {
                font-size: 25px;
            }


            .paymentmethod-ordersummary {
                width: 45%;
            }


            .shiping-address, .purchaseitems, .paymentmethod-ordersummary{
                background-color: #FFFFFF;
                border-radius: 10px;
                padding: 30px;
            }

            input[type="radio"]{
                width: 1.5rem;
                height: 1.5rem;
                accent-color: green;
            }

            .radio-btn{
                display: flex;
                align-items: center;
                margin-bottom: 20px;
            }

            .radio-btn > label{
                margin-left: 20px;
            }

            .shippingFee{

            }
            .orderPrice{

            }
            .shippingFee,.orderPrice,.totalPayment{
                border:none;
                outline: none;
            }

            .btn-pay{
                outline: none;
                border: none;
                display:block;
                min-width: 100%;
                margin: 35px auto 0;
                padding: 10px 20px;
                font-size: 20px;
                background-color: #4BA96A;
                color: #FFFFFF;
                font-family: Raleway-Bold;
            }
            .div-price,.div-shipping,.div-totalpay{
                display: flex;
                justify-content: space-between;
                padding: 10px 0;
            }

            .div-price > input,.div-shipping > input,.div-totalpay > input{
                text-align: right;
                font-size: 16px;
                width: 50%;
            }

            .div-totalpay > input{
                font-size: 20px;
                color: #8B0000;
            }

            .credit-card-form{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }


            .exp-cvv{
                display: flex;

            }

            .exp {
                margin-right: 10px;
                width:100%;
            }

            .cvv{
                width:100%;
            }

            .credit-card-form input {
                display: block;
                outline: none;
                width: 100%;
                height: 50px;
                padding: 10px;
                border: 3px solid #e6e6e6;
                border-radius: 2px;
                margin-bottom: 30px;
            }
            .card-no{
                width: 100%;
            }

            .card-name{
                width:100%;
            }
            .invisible{
                display: none;
            }
        </style>
    </head>
    <body>
    <body>
        <div class="header">            
            <span><a href="homePage.jsp">EZIFIT</a></span>
            <ul class="nav-link">
                    <%if (loggedIn) {%>
                <li><a href="GetOrder"><i class="fa fa-shopping-bag"></i></a></li>                
                <li><a href="GetCart"><i class="fa fa-shopping-cart"></i></a></li>
                <li><a href="profile.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="Logout"><i class="fa fa-sign-out"></i></a></li>
                        <%} else {%>
                <li><a href="login.jsp"><i class="fa fa-shopping-bag"></i></a></li>                
                <li><a href="login.jsp"><i class="fa fa-shopping-cart"></i></a></li>
                <li><a href="login.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="login.jsp"><i class="fa fa-sign-in"></i></a></li>
                        <%}%>       
            </ul>
        </div>

        <div class="payment-body">
            <h1>Check Out</h1>
            <form action="Payment" method="POST" class="payment-form">
                <div class="left-block">
                    <div class="shiping-address">
                        <div>Shipping Address</div>
                        <textarea name="shippingAddress" rows="5" required="">${loggedInCustomer.address != null ? loggedInCustomer.address : " "}</textarea>
                    </div>
                    <div class="purchaseitems">
                        <div class="title-product">
                            <div class="banner-product">Product Ordered</div>
                            <div class="banner-size">Size</div>
                            <div class="banner-unitprice">Unit Price (MYR)</div>
                            <div class="banner-qty">Quantity</div>
                            <div class="banner-subtotal">Subtotal (MYR)</div>
                        </div>


                        <c:forEach var="purchaseCartItem" items="${purchaseCartItemList}">

                            <div class="purchaseitem">
                                <div class="prod-name-img">
                                    <img src="data:image/jpg;base64,${purchaseCartItem.prodId.base64Image}">
                                    <div>${purchaseCartItem.prodId.prodName}</div>
                                </div>

                                <div class="prod-size">${purchaseCartItem.prodId.size}</div>
                                <div class="prod-price">${purchaseCartItem.prodId.price}</div>
                                <div class="prod-qty">${purchaseCartItem.purchaseQty}</div>
                                <div class="prod-subtotal">${purchaseCartItem.subtotal}</div>
                                <input type="text" name="purchaseCartItem" value="${purchaseCartItem.cartId}" hidden>

                            </div>


                        </c:forEach>
                    </div>
                </div>
                <div class="paymentmethod-ordersummary">
                    <div class="banner-payment">Payment Method</div>
                    <div class="radio-btn">
                        <input type="radio" class="cash-rbtn" name="paymentMethod" onclick="makeUnVisible()" value="Cash On Delivery" checked="checked">
                        <label> Cash On Delivery</label>
                    </div>
                    <div class="radio-btn">
                        <input type="radio" class="credit-card-rbtn" onclick="makeVisible();" name="paymentMethod" value="Credit Card">
                        <label> Credit Card</label>
                    </div>
                    <div class="credit-card-form invisible">
                        <div class="card-no">
                            <label>Card number</label>
                            <input type="text"/>
                        </div>
                        <div class='card-name'>
                            <label>Name on card</label>
                            <input type="text"/>
                        </div>
                        <div class="exp-cvv">
                            <div class='exp'>
                                <label>Expiration (MM/YY)</label>
                                <input type="text"/>
                            </div>
                            <div class="cvv">
                                <label>CVV</label>
                                <input type="text"/>
                            </div>
                        </div>
                    </div>

                    <div class="banner-ordersummary">Order Summary</div>
                    <div class="div-price">
                        <label>Order Price</label>
                        <input type="text" class="orderPrice" name="orderPrice" value="${orderPrice}" >
                    </div>
                    <div class="div-shipping">
                        <label>Shipping Total</label>
                        <input type="text" class="shippingFee" name="shippingFee" value="${shippingFee}" >
                    </div>
                    <div class="div-totalpay">
                        <label>Total Payment</label>
                        <input type="text" class="totalPayment" name="totalPayment" value="RM${orderPrice +shippingFee}" >
                    </div>
                    <input type="submit" value="Make Payment" class="btn-pay"/>
                </div>
            </form>
        </div>
    </body>
    <script>

        function makeUnVisible() {
            if (document.querySelector(".cash-rbtn").checked)
            {
                document.querySelector(".credit-card-form").classList.add("invisible");
            }
        }
        function makeVisible() {
            if (document.querySelector(".credit-card-rbtn").checked) {
                document.querySelector(".credit-card-form").classList.remove("invisible");
            }

        }


    </script>
</html>
