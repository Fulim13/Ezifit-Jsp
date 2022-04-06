<%-- CHAN KAI LIN --%>

<%@page import="model.CartItem"%>
<%@page import="model.Review"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean loggedIn = session != null && session.getAttribute("loggedInCustomer") != null;
    // not enable the people whoe have not logged in , to profile page
    if (!loggedIn) {
        response.sendRedirect(request.getContextPath());
        return;
    }
    Review rByOrder = (Review) session.getAttribute("rByOrder");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>REVIEW | EZIFIT</title>
        <style>
            body{
                font-family: 'Lucida Sans'; 
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
            a, a:hover, a:focus, a:active {
                text-decoration: none;
                color: inherit;
            }
            .button{
                text-align: center;                
            }
            .button button{
                font-family: 'Arial narrow'; 
                font-size: 18px;
                font-weight: bold;
                letter-spacing: 2px;
                margin: 0px 90px 50px 90px;                
                border: none;
                border-radius: 30px;
                padding: 13px;
                cursor: pointer;
            }
            .button #btn1{
                background-color: #8B0000;
                color: white;
            }
            .button #btn2{
                background-color: transparent;
            }
            .rByO{
                margin-left: auto;
                margin-right: auto;
                width: 50%;
                border: solid;
                box-shadow: 10px 20px;
            }
            .rateOrder{
                margin: 50px 70px;
            }
            .rateOrder div{
                font-size: 18px;
            }
            .rateOrder span > i{
                font-size: 22px;
                margin-right: 220px;
            }
            .rateOrder textarea{
                font-family: 'Lucida Sans'; 
                font-size: 17px;
            }
            .submitBtn{
                margin-top: 20px;
                text-align: center;
            }
            .submitBtn input{
                font-family: 'Lucida Sans'; 
                font-size: 18px;
                font-weight: bold;
                background-color: transparent;
                border: none;
                cursor: pointer;
                padding: 10px;
            }
            .submitBtn input:hover{
                background-color: black;
                color: white;
            }

        </style>
    </head>
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

        <div class="button">
            <button id="btn1">REVIEW BY ORDER</button>
            <a href="reviewPage2.jsp"><button id="btn2">REVIEW BY PRODUCTS</button></a>
        </div>

        <div class="rByO" id="1">           
            <div class="rateOrder">                                   

                <% if (rByOrder.getReviewId() != null) { %>        
                <h1>Send Us Feedback</h1><br/><br/>
                <div>How was your experience?</div><br/>
                <span><i class="fa fa-thumbs-down"></i></span><span><i class="fa fa-thumbs-up"></i></span>
                <div class="radioBtn">
                    <% for (int r = 1; r <= 10; r++) {
                            if (rByOrder.getRating() == r) {
                    %>
                    <input type="radio" name="rating" disabled checked="true" />
                    <% } else { %>
                    <input type="radio" name="rating" disabled /> 
                    <%  }
                            }%>                   
                </div>                

                <br/><br/>
                <div style="margin-bottom: 10px">We'd love to hear your feedback. What was positive? What can we improve?</div>
                <textarea name="comment" rows="6" cols="43" readonly="" placeholder="<%= rByOrder.getComment()%>"></textarea><br/><br/><br/>

                <%  if (rByOrder.getReplyComment() != null) {%> 
                <div style="margin-bottom: 10px">Feedback from us</div>
                <textarea rows="6" cols="43" readonly="" placeholder="<%= rByOrder.getReplyComment()%>"></textarea>

                <% }
                } else { %>
                <form action="SaveOrderReview">                  
                    <h1>Send Us Feedback</h1><br/><br/>
                    <div>How was your experience?</div><br/>
                    <span><i class="fa fa-thumbs-down"></i></span><span><i class="fa fa-thumbs-up"></i></span>
                    <div class="radioBtn">
                        <input type="radio" name="rating" value="1" required />
                        <input type="radio" name="rating" value="2" required />
                        <input type="radio" name="rating" value="3" required />
                        <input type="radio" name="rating" value="4" required />
                        <input type="radio" name="rating" value="5" required />
                        <input type="radio" name="rating" value="6" required />
                        <input type="radio" name="rating" value="7" required />
                        <input type="radio" name="rating" value="8" required />
                        <input type="radio" name="rating" value="9" required />
                        <input type="radio" name="rating" value="10" required />
                    </div>                

                    <br/><br/>
                    <div style="margin-bottom: 10px">We'd love to hear your feedback. What was positive? What can we improve?</div>
                    <textarea name="comment" rows="6" cols="43"></textarea>
                    <div class="submitBtn"><input type="submit" value="submit" /><div>
                            </form>
                            <% }%>
                        </div>
                    </div>

                    </body>
                    </html>
