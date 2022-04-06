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
    List<Review> rByProductList = (List) session.getAttribute("rByProductList");
    List<CartItem> cartList = (List) session.getAttribute("cartList");
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
                margin: 0px 90px 10px 90px;                
                border: none;
                border-radius: 30px;
                padding: 13px;
                cursor: pointer;
            }
            .button #btn2{
                background-color: #8B0000;
                color: white;
            }
            .button #btn1{
                background-color: transparent;
            }
            .num{               
                margin-top: 20px;
                margin-right: 80px;
                text-align: right;
            }
            .rByP{
                width: 80%;              
                border-collapse: collapse; 
                margin: 30px auto;                
            }            
            .rByP td{
                border: none;
                vertical-align: top;
                padding: 40px 0px 20px 20px;
            }
            .rByP td:nth-child(2){
                border: solid;
                box-shadow: 15px 12px;
            }
            .imageC{
                width: 40%;
            }
            .rByP img{
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
            .reviewBtn{
                background-color: transparent;
                border: none;
                font-size: 25px;
                cursor: pointer;
            }
            .reviewBtn :hover{
                color: #8B0000;
            } 
            .form{
                padding: 0px 40px 40px 70px;
            }
            .form div{
                font-size: 18px;
            }
            .form span > i{
                font-size: 22px;
                margin-right: 220px;
            }
            .form textarea{
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
                <li><a href="GetOrder"><i class="fa fa-shopping-bag"></i></a></li>                
                <li><a href="GetCart"><i class="fa fa-shopping-cart"></i></a></li>
                <li><a href="profile.jsp"><i class="fa fa-user"></i></a></li>
                <li><a href="login.jsp"><i class="fa fa-sign-in"></i></a></li>
                        <%}%>       
            </ul>
        </div>

        <div class="button">
            <a href="reviewPage1.jsp"><button id="btn1">REVIEW BY ORDER</button></a>
            <button id="btn2">REVIEW BY PRODUCTS</button>
        </div>

        <% for (int i = 0; i < cartList.size(); i++) {%>        
        <div class="num"><%= i + 1%>/<%= cartList.size()%></div>
        <table class="rByP">           
            <tr>
                <td class="imageC">
                    <img id="img" src="data:image/jpg;base64,<%= cartList.get(i).getProdId().getBase64Image()%>">
                    <div class="descriptionC">
                        <div class="name"><%= cartList.get(i).getProdId().getProdName()%></div>
                        <div>Size: <%= cartList.get(i).getProdId().getSize()%></div>
                        <div>Quantity: <%= cartList.get(i).getPurchaseQty()%></div>  
                        <div>Price per piece: MYR<%= String.format("%.2f", cartList.get(i).getProdId().getPrice())%></div>                        
                    </div>
                </td>

                <td>
                    <form class="form" action="SaveProdReview">
                        <% if (rByProductList.isEmpty()) {%>
                        <h1>Send Us Feedback</h1><br/><br/>
                        <div>How was our product?</div><br/>
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
                        <div style>We'd love to hear your feedback. How was our product? What can we improve?</div>
                        <textarea name="comment" rows="6" cols="55"></textarea>
                        <input type="hidden" name="prodID" value="<%= cartList.get(i).getProdId()%>" />
                        <div class="submitBtn"><input type="submit" value="submit" />        
                            <% } else { %>
                            <% int flag = 0;
                            int index = -1; %>
                            <% for (int j = 0; j < rByProductList.size(); j++) {
                                    if (rByProductList.get(j).getProdId().getProdId() == cartList.get(i).getProdId().getProdId()) {
                                        flag = 1;
                                        index = j;
                                    }
                                }
                            %> 
                            <% if (flag == 1) { %>
                            <h1>Send Us Feedback</h1><br/><br/>
                            <div>How was our product?</div><br/>
                            <span><i class="fa fa-thumbs-down"></i></span><span><i class="fa fa-thumbs-up"></i></span>
                            <div class="radioBtn">
                                <% for (int r = 1; r <= 10; r++) {
                                        if (rByProductList.get(index).getRating() == r) {
                                %>
                                <input type="radio" name="rating" disabled checked="true" />
                                <% } else { %>
                                <input type="radio" name="rating" disabled /> 
                                <%  }
                                }%>                   
                            </div>    
                            <br/><br/>
                            <div style>We'd love to hear your feedback. How was our product? What can we improve?</div>
                            <textarea name="comment" rows="6" cols="50"  readonly="" placeholder="<%= rByProductList.get(index).getComment()%>"></textarea>

                            <%  if (rByProductList.get(index).getReplyComment() != null) {%> 
                            <div style="margin-bottom: 10px">Feedback from us:</div>
                            <textarea rows="6" cols="55" readonly="" placeholder="<%= rByProductList.get(index).getReplyComment()%>"></textarea>
                            <% } %>
                            <% } else {%>

                            <h1>Send Us Feedback</h1><br/><br/>
                            <div>How was our product?</div><br/>
                            <span><i class="fa fa-thumbs-down"></i></span><span><i class="fa fa-thumbs-up"></i></span>
                            <div class="radioBtn">
                                <input id="rb" type="radio" name="rating" value="1" required />
                                <input id="rb"  type="radio" name="rating" value="2" required />
                                <input id="rb"  type="radio" name="rating" value="3" required />
                                <input id="rb"  type="radio" name="rating" value="4" required />
                                <input id="rb" type="radio" name="rating" value="5" required />
                                <input id="rb" type="radio" name="rating" value="6" required />
                                <input id="rb" type="radio" name="rating" value="7" required />
                                <input id="rb" type="radio" name="rating" value="8" required />
                                <input id="rb" type="radio" name="rating" value="9" required />
                                <input id="rb" type="radio" name="rating" value="10" required />
                            </div>                
                            <br/><br/>
                            <div style>We'd love to hear your feedback. How was our product? What can we improve?</div>
                            <textarea id="ta" name="comment" rows="6" cols="55"></textarea>
                            <input style="display: none;" type="text" name="prodID" value="<%= cartList.get(i).getProdId().getProdId()%>" />
                            <div class="submitBtn"><input type="submit" value="submit" />                    
                                <% } %>  
                                <% } %>
                                </form> 
                                </td>
                                </tr>                       
                                </table>   <br/><br/><br/><br/>      
                                <% }%>

                                <script>

                                </script>
                                </body>
                                </html>
