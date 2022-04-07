<%@page import="java.util.List"%>
<%@page import="model.Review"%>
<%@page import="model.CartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            Review review = (Review) session.getAttribute("review");
            if (review != null) {
%>
<%
  List<CartItem> cartList = (List)session.getAttribute("cartList");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>REVIEW | EZIFIT</title>
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
            .col-2{
                flex-basis: 100%;
                flex-basis: 100%;
                min-width: 300px;
                margin: 50px;
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
            .productreview{
                width: 80%;              
                border-collapse: collapse; 
                margin: 30px auto;  
                margin-bottom: 250px;
            }            
            .productreview td{
                border: none;
                vertical-align: top;
                padding: 40px 0px 20px 20px;
            }
            .productreview td:nth-child(2){
                border: solid;
                box-shadow: 15px 12px;
            }
            .orderReview{
                width: 55%;              
                border-collapse: collapse; 
                margin: 30px auto;   
                border: solid;
                box-shadow: 15px 12px;
                margin-bottom: 250px;
            }            
            .orderReview td{
                border: none;
                vertical-align: top;
                padding: 40px 0px 20px 20px;
            }
            .orderReview td:nth-child(2){
                border: solid;
                box-shadow: 15px 12px;
            }
            .cart{
                width: 40%;
            }
            .productreview img{
                width: 80%;
            }
            .descriptionC{                               
                vertical-align: top;
                margin-left: 30px;
            }
            .name{
                font-size: 30px;
                margin-bottom: 50px;
                margin-top: 5px;              
            }
            .descriptionC :nth-child(2), :nth-child(3), :nth-child(4){
                font-size: 18px;
                margin-bottom: 5px;
            }
            input.form-control:read-only {
                background-color: #fff;
            }
            .form{
                width: 100%;
            }   
            
           .input-box{
                margin-bottom: 15px;
                display: flex;
                align-items: center;
            }
            .input-box label{
                width: 200px;
                color:#757575;
                margin-right: 10px;
                font-size: 14px;
            }
            .input-box .form-control{
                width: 100%;
                outline: none;
                border: 1px solid #d5dbd9;
                font-size: 15px;
                padding: 8px 10px;
                border-right: 3px;
                transition: all 0.3s ease;
            }
            .input:focus{
                border: 1px solid #fec107;
            }
            .btn{
                width: 98%;
                padding: 8px 10px;
                font-size: 15px;
                border: 0;
                background: #8B0000;
                color: #fff;
                cursor: pointer;
                border-radius: 3px;
                outline: none;
                margin-top: 10px;
                margin-bottom: 10px;
            }
            .customerReview .form .input-box .btn:hover{
                background: black;
            }
            .orderReview .form .input-box .btn:hover{
                background: black;
            }
            .orderReview .btn{
                width: 95%;
                padding: px 10px;
                font-size: 15px;
                border: 0;
                background: #8B0000;
                color: #fff;
                cursor: pointer;
                border-radius: 3px;
                outline: none;
                margin-top: 10px;
                margin-left: 20px;
                margin-bottom: 10px;
            }
            .orderReview .input-box label{
                width: 200px;
                color:#757575;
                margin-right: 10px;
                margin-left: 20px;
                margin-top: 15px;
                font-size: 14px;
            }
            .orderReview .input-box .form-control{
                width: 100%;
                outline: none;
                border: 1px solid #d5dbd9;
                font-size: 15px;
                padding: 8px 10px;
                border-right: 3px;
                margin-top: 20px;
                transition: all 0.3s ease;
            }
            .feedback{
                font-size: 18px;
                padding: 20px 30px;
            }
            textarea.form-control:read-only {
                background-color: #fff;
            }
            textarea.form-control{
                width: 95%;
                outline: none;
                border: 2px solid #d5dbd9;
                font-size: 15px;
                padding: 8px 10px;
                border-right: 13px;
                transition: all 0.3s ease;
            }
            textarea.reply{
                width: 95%;
                outline: none;
                border: 2px solid #d5dbd9;
                font-size: 15px;
                padding: 8px 10px;
                border-right: 13px;
                transition: all 0.3s ease;
            }
            .date{
                margin: 15px 5px 0 1330px;
                font-size: 15px;
                font-style: inherit;
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
               <p class="date"><span id="datetime"></span></p><script>var dt = new Date();
                        document.getElementById("datetime").innerHTML=dt.toLocaleString();</script>  
            </div>

            <div class="col-2">
                <%if(review.getProdId() == null) { %>
                <h1 style="color: #8B0000">CUSTOMER ORDER REVIEW</h1>
                <%  }else {  %>
                <h1 style="color: #8B0000">CUSTOMER PRODUCT REVIEW</h1>
                <%  }  %>
            </div>
        <br>      <hr style="width: 97%">
        <div class="col-2">
                <h3>&nbsp;&nbsp;&nbsp;REVIEW INFORMATION</h3>
        </div>
       
        <%  if(review.getProdId() != null) { %>
        <% for(int i=0; i < cartList.size(); i++){ %> 
        <table class="productreview">
            <tr>
                <td class="cart">                 
                    <img id="img" src="data:image/jpg;base64,<%=cartList.get(i).getProdId().getBase64Image() %>">
                    <div class="descriptionC">
                    <div class="name"><%= cartList.get(i).getProdId().getProdName() %></div>
                    <div>Size: <%= cartList.get(i).getProdId().getSize() %></div>
                    <div>Quantity: <%= cartList.get(i).getPurchaseQty() %></div>
                    </div>
                </td>
                <td class="customerReview">
                    <form action="../AddComment" class="form" onsubmit="return window.confirm('Are you sure you want to reply this review?')">
                        <div class="input-box">
                            <label class="details">Customer Name</label>
                            <input type="text" class="form-control" name="customerName" value="<%=review.getOrderId().getCustomerId().getFullname() %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Customer ID</label>
                            <input type="text" class="form-control" name="customerID" value="<%=review.getOrderId().getCustomerId() %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Review ID</label>
                            <input type="text" class="form-control" name="reviewID" value="<%=review.getReviewId() %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Review Date</label>
                            <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
                            <input type="text" class="form-control" name="reviewDate" value="<%=df.format(review.getDateReview()) %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Rating</label>
                            <input type="text" class="form-control" name="rating" value="<%=String.format("%.1f", review.getRating()) %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Product ID</label>
                            <input type="text" class="form-control" name="productID" value="<%=review.getProdId() %>" readonly="readonly" />    
                        </div>
                        <div class="input-box">
                            <label class="details">Product Name</label>
                            <input type="text" class="form-control" name="productName" value="<%=review.getProdId().getProdName() %>" readonly="readonly" />    
                        </div>
                        <div class="feedback" style="color:#757575;">We'd love to hear your feedback. How was our product? What can we improve?</div>
                            <textarea placeholder="<%=review.getComment() %>" rows="6" cols="60" class="form-control" readonly="readonly"><%=review.getComment() %></textarea>    
                            <div class="feedback" style="font-size: 18px;"><strong>Feedback From Us</strong></div>
                            <textarea rows="6" cols="60" name="replyComment" class="reply"><%=review.getReplyComment() %></textarea>
                             <div class="input-box">
                            <label class="staff" style="color: black; font-size: 16px;">Staff In-Charge<font color = "#FF0000">*</font></label>
                            <input style="margin-top: 10px;" type="text" class="form-control" name="staffID" value="<%=review.getStaffId() %>" />    
                        </div>
                        <div class="input-box">
                            <button type="submit" class="btn">UPDATE</button>
                        </div>
                    </form>
                </td>
             </tr>
             <br>
        </table>
        <% } %>
        <% } else {%>
 
        <div class="orderReview">
            <form action="../AddComment" class="form">
                        <div class="input-box">
                            <label class="details">Customer Name</label>
                            <input type="text" class="form-control" name="customerName" value="<%=review.getOrderId().getCustomerId().getFullname() %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Customer ID</label>
                            <input type="text" class="form-control" name="customerID" value="<%=review.getOrderId().getCustomerId() %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Review ID</label>
                            <input type="text" class="form-control" name="reviewID" value="<%=review.getReviewId() %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Review Date</label>
                            <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
                            <input type="text" class="form-control" name="reviewDate" value="<%=df.format(review.getDateReview()) %>" readonly="readonly"/>    
                        </div>
                        <div class="input-box">
                            <label class="details">Rating</label>
                            <input type="text" class="form-control" name="rating" value="<%=String.format("%.1f", review.getRating()) %>" readonly="readonly"/>    
                        </div>
                        <div class="feedback" style="color:#757575; text-align: center;">We'd love to hear your feedback. How was our product?<br> What can we improve?</div>
                        <textarea rows="6" cols="60" class="form-control" readonly="readonly" style="margin-left: 10px;"><%=review.getComment() %></textarea>    
                            <div class="feedback" style="font-size: 18px;"><strong>Feedback From Us</strong></div>
                            <textarea rows="6" cols="60" name="replyComment" class="reply" style="margin-left: 10px;"><%=review.getReplyComment() %></textarea>
                             <div class="input-box">
                            <label class="staff" style="color: black; font-size: 16px;">Staff In-Charge<font color = "#FF0000">*</font></label>
                            <input style="margin-top: 10px;" type="text" class="form-control" name="staffID" value="<%=review.getStaffId() %>" />    
                        </div>
                        <div class="input-box">
                            <button type="submit" class="btn">UPDATE</button>
                        </div>
                    </form>
        </div>
<%  } %>
        <%  } %>
    </body>
</html>







